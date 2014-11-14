


%% 

Y=1;
N=0;
CONT = input('Continue (Y/N)? ');
while CONT == 1
    Channel = input('Channel?   ');
    ChDur = Channel(:,2);
    ChInt = Channel (:,3);
    ChStart = Channel(:,1);
    
    count = 1;
    for i = 1:length(Channel)-1
        if ChStart(i)-ChStart(i+1)< 310
            DataView_DCs(count) = ChDur(i)/ChInt(i+1);
            count = count+1;
        end
    end
    horzcat(TOTAL_DCs,DataView_DCs);
    
    CONT = input('Continue (Y/N)? ');
end

sugg_Period = median(Period_EMG) - iqr(Period_EMG);
    Period_Data = [Period_Data; sugg_Period];