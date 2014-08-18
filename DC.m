function DutyCycle = DC(Trigger,EMGX)

EMGStartRaw = EMGX(:,2);
EMGStart = EMGStartRaw - Trigger(1,2);
Width = EMGX(:,4);
EMGWidth = Width/1000;

clear DutyCycle
count = 1;
for i = 1:length(EMGStart)-1
    if EMGStart(i) < 0
        if EMGStart(i)-EMGStart(i+1)< 0.5
            DutyCycle(count) = EMGWidth(i)/abs(EMGStart(i)-EMGStart(i+1));
            count = count+1;
        end
    end
end

