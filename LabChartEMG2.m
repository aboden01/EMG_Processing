%EMG difference L/R sides%

%clear previous variables%
clear i
clear j
clear LeftEMG
clear LStart
clear LEnd
clear RightEMG
clear RStart
clear REnd
clear Difference

%variables%
LeftEMG = input('Vector with LEFT EMG on/offset data?');
LStart = LeftEMG(:,2);
LEnd = LeftEMG(:,3);
RightEMG = input('Vector with RIGHT EMG on/offset data?');
RStart = RightEMG(:,2);
REnd = RightEMG(:,3);

% time of L/R EMG overlap%
count = 1;
for i = 1:length(LeftEMG)
    for j = 1:length(RightEMG)
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
EMGX = input('EMG vector for Duty Cycle analysis?');
EMGStartRaw = EMGX(:,2);
EMGStart = EMGStartRaw - Trigger(1,1);
Width = EMGX(:,4);
EMGWidth = Width/1000;
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