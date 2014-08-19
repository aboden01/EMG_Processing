%EMG difference L/R sides%

%clear previous variables%
clear i
clear j
clear LStart
clear LEnd
clear RStart
clear REnd
clear Difference

%variables%

LStart = input('Left EMG burston? ');
LEnd = LeftEMG(:,3);
RStart = input('Right EMG burston? ');
REnd = RightEMG(:,3);

% time of L/R EMG overlap%
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


%duty cycle%

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

%variables%
Trigger = input('Trigger vector?');
EMGStartRaw = input('EMG burston? ');
EMGEndRaw = input('EMG burstoff? ');
EMGStart = EMGStartRaw - Trigger(1,1);
EMGWidth = (EMGEndRaw(i)-EMGStartRaw(i))/1000
TailBeatRaw = input('Tail beat cycle vector (peak times)?');
TailFrames = input('Total number frames recorded?');
FPS = input('Frames per second?');
TailRec = TailFrames / FPS; %length of video recording in seconds%
TailBeat = TailBeatRaw - TailRec;


%ID tailbeat cycle associated with burst and calculate duty cycle%
clear DutyCycle;
count = 1;
for i = 1:length(EMGStart)
    for j = 1:length(TailBeat)-1
        if EMGStart(i) > TailBeat(j) && EMGStart(i) < TailBeat(j+1)
           DutyCycle(count)= EMGWidth(i)/abs(TailBeat(j+1)-TailBeat(j));
            count = count+1;
        end
    end
end

'Done.'
   

Difference
average_Difference = mean(Difference)

DutyCycle
average_DutyCycle = mean(DutyCycle)