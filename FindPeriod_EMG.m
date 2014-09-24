    clear Period_EMG

    Trigger = input('Trigger = ' );
    burston = input('EMG Onset = ');
    burstoff = input('EMG Offset = ');   
    EMGStart = burston - Trigger(1,2);
    n = 1:length(burston);
    EMGWidth = abs(burstoff(n)-burston(n)); 

count = 1;
    for i = 1:length(EMGStart)-1
        if EMGStart(i) < 0
            if EMGStart(i)-EMGStart(i+1)> -0.4
                Period_EMG(count) = EMGStart(i)-EMGStart(i+1);
                count = count+1;
            end
        end
    end
    
    sugg_Period = median(Period_EMG) - iqr(Period_EMG)
   