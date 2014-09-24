
%presents user w/ data analysis options
choice = questdlg('Select a Process','EMG Processing Options','L/R EMG Overlap',...
    'Duty Cycle w/ Video','Duty Cycle w/ EMG Only','default') 
    
if strcmp(choice,'L/R EMG Overlap')
    %% EMG difference L/R sides

    %clear previous variables%
    clear i
    clear j
    clear LStart
    clear LEnd
    clear RStart
    clear REnd
    clear Difference

    %define variables%
    LStart = input('Left EMG burston = ');
    LEnd = input('Left EMG burstoff = ');
    RStart = input('Right EMG burston = ');
    REnd = input('Right EMG burstoff = ');

    %calculate time of L/R EMG overlap%
    count = 1;
    for i = 1:length(LStart)
        for j = 1:length(RStart)
            if LStart(i) < RStart(j) && LEnd(i) > RStart(j)
                Difference(count) = LEnd(i) - RStart(j);
                count = count+1;
            end
        end
    end

    'Done.'
    
    %"Difference" will contain the complete list of values calculated, i.e.
    %for each time there is an overlap, and the variable average_Difference
    %will indicate the average overlap.
    Difference
    average_Difference = mean(Difference)

elseif strcmp(choice,'Duty Cycle w/ Video')
    %% Duty Cycle based on individual EMG burst duration and the total 
    %%tailbeat cycle period calculated from the video

    %clear previous variables%
    clear i
    clear j
    clear Trigger
    clear EMGStartRaw
    clear EMGStart
    clear EMGEndRaw
    clear EMGEnd
    clear TailBeatRaw
    clear TailRec
    clear TailBeat

    %define variables%
    Trigger = input('Trigger = ');
    EMGStartRaw = input('EMG burston = ');
    EMGEndRaw = input('EMG burstoff = ');

    EMGStart = EMGStartRaw - Trigger(1,2);
    i = 1:length(EMGStartRaw);
    EMGWidth = EMGEndRaw(i)-EMGStartRaw(i);
    TailBeatRaw = input('Tail beat cycle vector (peak times) = ');
    TailFrames = input('Total number frames recorded = ');
    FPS = input('Frames per second = ');
    TailRec = TailFrames / FPS; %length of video recording in seconds%
    TailBeat = TailBeatRaw - TailRec;


    %ID tailbeat cycle associated with burst and calculate duty cycle%
    clear DutyCycle
    count = 1;
    for i = 1:length(EMGStart)
        for j = 1:length(TailBeat)-2
            if EMGStart(i) > TailBeat(j) && EMGStart(i) < TailBeat(j+2)
               DutyCycle(count)= EMGWidth(i)/abs(TailBeat(j+2)-TailBeat(j));
                count = count+1;
            end
        end
    end

    'Done.'

%the variable "DutyCycle" will list the duty cycle calculated for each EMG
%pair, the variable "average_DutyCycle" will indicate the average of those
%values.
    DutyCycle
    average_DutyCycle = mean(DutyCycle)
    StandDev_DC = std(DutyCycle)

elseif strcmp(choice,'Duty Cycle w/ EMG Only')
%% Duty Cycle based on indivudual EMG duration and the total tailbeat
%%cycle based on time from one EMG to the next

    %clear previous variables
    clear DutyCycle_EMG
    
    %define variables
    Trigger = input('Trigger = ' );
    burston = input('EMG Onset = ');
    burstoff = input('EMG Offset = ');   
    EMGStart = burston - Trigger(1,2);
    n = 1:length(burston);
    EMGWidth = abs(burstoff(n)-burston(n));

    %calculate cycle duration and duty cycle for each EMG pair
    clear DutyCycle
    count = 1;
    for i = 1:length(EMGStart)-1
        if EMGStart(i) < 0
            if EMGStart(i)-EMGStart(i+1)> -0.33
                DutyCycle_EMG(count) = EMGWidth(i)/abs(EMGStart(i)-EMGStart(i+1));
                count = count+1;
            end
        end
    end
    
%the variable "DutyCycle_EMG" will list the duty cycle calculated for each EMG
%pair, the variable "average_DutyCycle_EMG" will indicate the average of those
%values.   
DutyCycle_EMG
average_DutyCycle_EMG = mean(DutyCycle_EMG)
StandDev_DC_EMG = std(DutyCycle_EMG)
end

 
