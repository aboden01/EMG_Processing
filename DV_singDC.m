    function [DataView_DC] = DV_singDC(Channel) 
%assumes DataView txt is [OnTime Duration Interval]

%clear previous variables
clear DataView_DC

%define variables
ChDur = Channel(:,2);
ChInt = Channel (:,3); 
ChStart = Channel(:,1);

%calculate cycle duration and duty cycle for each EMG pair

count = 1;
for i = 1:length(Channel)-1
  if ChStart(i)-ChStart(i+1)< 310
       DataView_DC(count) = ChDur(i)/ChInt(i+1);
       count = count+1;
  end
end