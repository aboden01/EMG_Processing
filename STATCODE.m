x = DataProcessed(:,2);
y = DataProcessed(:,1);
e = DataProcessed(:,3);

figure
errorbar(y,x,e)
title('Steady Swimming Data')
xlabel('Speed (BL/s)')
ylabel('Mean Duty Cycle')