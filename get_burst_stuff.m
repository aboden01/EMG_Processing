importLabChart('bg10_10-5Hz_steady_006.mat','bg10_10-5Hz_steady_006mat.mat')
load('bg10_10-5Hz_steady_006mat.mat')
data = findbursts_gui(t,[Left3 Right3])

plot(t,Left3, data.burston(:,1),zeros(33,1),'ro')
