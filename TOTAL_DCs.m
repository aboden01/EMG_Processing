%assumes DataView txt is [OnTime Duration Interval]

%clear previous variables
clear TOTAL_DC
clear DataView_DCs

%define variables
Channel = input('Channel?   ');
ChDur = Channel(:,2);
ChInt = Channel (:,3); 
ChStart = Channel(:,1);

%calculate DC based on single channel
count = 1;
for i = 1:length(Channel)-1
  if (ChStart(i+1)-(ChStart(i)+ChDur(i))) < 310
       DataView_DCs(count) = ChDur(i)/ChInt(i+1);
       count = count+1;
  end
end

TOTAL_DC = DataView_DCs;


Y=1;
N=0;
CONT = input('Continue (Y/N)? ');
while CONT == 1
    Channel = input('Channel?   ');
    ChDur = Channel(:,2);
    ChInt = Channel (:,3);
    ChStart = Channel(:,1);
    
    clear DataView_DCs
    count = 1;
    for i = 1:length(Channel)-1
        if (ChStart(i+1)-(ChStart(i)+ChDur(i))) < 310
            DataView_DCs(count) = ChDur(i)/ChInt(i+1);
            count = count+1;
        end
    end
    TOTAL_DC = horzcat(TOTAL_DC,DataView_DCs);
    
    CONT = input('Continue (Y/N)? ');
end

OJO = 'Dont forget to rename TOTAL_DC!!';
disp(OJO)