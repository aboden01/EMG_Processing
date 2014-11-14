%DC data for SINGLE CHANNEL vs. speed

Speed = input('Speed (BL/sec) = ');
Raw_Data = input('DC data set = ');

CombData = [Speed mean(Raw_Data) std(Raw_Data)];

Y=1;
N=0;
CONT = input('Continue (Y/N)? ');
while CONT == 1
    Speed = input('Speed (BL/sec) = ');
    Raw_Data = input('DC data set = ');
    CombData = [CombData; Speed mean(Raw_Data) std(Raw_Data)];
    
    CONT = input('Continue (Y/N)? ');
end

x = CombData(:,2);
y = CombData(:,1);
e = CombData(:,3);

figure
errorbar(y,x,e)
title('Total DC Data')
xlabel('Speed (BL/s)')
ylabel('Mean Duty Cycle')