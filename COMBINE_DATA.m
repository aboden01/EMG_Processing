%DC data for SINGLE CHANNEL vs. speed

Speed = input('Speed (BL/sec) = ');
Raw_Data = input('DC data set = ');

CombData = [Speed mean(Raw_Data) std(Raw_DATA)];

Y=1;
N=0;
CONT = input('Continue (Y/N)? ');
while CONT == 1
    Speed = input('Speed (BL/sec) = ');
    Raw_Data = input('DC data set = ');
    CombData = [CombData; Speed mean(Raw_Data) std(Raw_DATA)];
    
    CONT = input('Continue (Y/N)? ');
end

x = CombData(:,2);
y = CombSata(:,1);
e = DataProcessed(:,3);

figure
errorbar(y,x,e)
title('Total DC Data')
xlabel('Speed (BL/s)')
ylabel('Mean Duty Cycle')