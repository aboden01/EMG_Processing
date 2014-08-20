%cd F:\Viscosity\2013-11-08\Nonviscous 0.5mM\L20-121235_PM
%load L20-121235_PM.mat

directory = uigetdir('Directory?');
[filename,pn] = uigetfile('*.mat','Workspace file?');
cd(directory);
load(filename);

fps=30;
scale=0.2638;       % mm/pix

t=frame/fps;
c1t=C1FrameNum/fps;
c3t=C3FrameNum/fps;
c2t=C2FrameNum/fps;
c4t=C4FrameNum/fps;

[h5filename,pn] = uigetfile('*.h5','H5 file?');

c1raw = h5read(h5filename,'/Dev1_ai3');
c2raw = h5read(h5filename,'/Dev1_ai4');
c3raw = h5read(h5filename,'/Dev1_ai5');
c4raw = h5read(h5filename,'/Dev1_ai6');

%CHANGE THIS MANUALLY FOR EA. FIGURE
emgdt = h5readatt(h5filename,'/Dev1_ai3','dt');
ctrframe = h5read(h5filename,'/4');
ctrdt = h5readatt(h5filename,'/4','dt');
ctrt = (0:length(ctrframe)-1)*ctrdt;

frmax = max(ctrframe);
ind = find(ctrframe==frmax, 1, 'first');
endtime = ctrt(ind);

emgt = (0:length(c2raw)-1)*emgdt - endtime;

plot1 = input('First channel? (c1t, c2t, etc.)= ');
raw1 = input('H5 file? (c1raw, c2raw, etc.)= ');
plot2 = input('Second channel? (c1t, c2t, etc.)= ');
raw2 = input('H5 file? (c1raw, c2raw, etc.)= ');

h(1) = subplot(3,1,1);
ctr = mean(y5*scale);
plot(t-t(end),y5*scale,  plot1,ctr*ones(size(plot1)),'go',  plot2,ctr*ones(size(plot2)),'rs');
%plot(frame(1:end-1)-frame(end),diff(y5), plot1,ones(size(plot1)),'o',...
  %  plot2,ones(size(plot2)),'rs')
ylabel('Tail position (mm)');

h(2) = subplot(3,1,2);
plot(emgt,raw1,'k', plot1,zeros(size(plot1)),'go');

h(3) = subplot(3,1,3);
plot(emgt,raw2,'k', plot2,zeros(size(plot2)),'rs');

linkaxes(h,'x');
addscalebars('x','xlen',2,'units','sec');

