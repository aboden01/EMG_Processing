%% Duty Cycle based on indivudual EMG duration and the total tailbeat
%%cycle based on time from one EMG to the next

    %clear previous variables
    clear DutyCycle_EMG
    
    %define variables
    TimeBrack = input('limit = ');
    Trigger = TRIGGER10;
    burston = bg3_009_DATA.burston(:,2);
    burstoff = bg3_009_DATA.burstoff(:,2);   
    EMGStart = burston - Trigger(1,2);
    n = 1:length(burston);
    EMGWidth = abs(burstoff(n)-burston(n));

    %calculate cycle duration and duty cycle for each EMG pair
    clear DutyCycle
    count = 1;
    for i = 1:length(EMGStart)-1
        if EMGStart(i) < 0
            if EMGStart(i)-EMGStart(i+1)> TimeBrack
                DutyCycle_EMG(count) = EMGWidth(i)/abs(EMGStart(i)-EMGStart(i+1));
                count = count+1;
            end
        end
    end
    
%the variable "DutyCycle_EMG" will list the duty cycle calculated for each EMG
%pair, the variable "average_DutyCycle_EMG" will indicate the average of those
%values.   
No_DataPoints = count-1
average_DutyCycle_EMG = mean(DutyCycle_EMG)
StandDev_DC_EMG = std(DutyCycle_EMG)