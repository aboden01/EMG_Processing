%EMG difference L/R sides%

%clear previous variables%
clear LeftEMG
clear LStart
clear LEnd
clear RightEMG
clear RStart
clear REnd
clear Difference

%variables%
LeftEMG = input('Vector with LEFT EMG on/offset data?');
LStart = LeftEMG(:,1);
LEnd = LeftEMG(:,2);
RightEMG = input('Vector with RIGHT EMG on/offset data?');
RStart = RightEMG(:,1);
REnd = RightEMG(:,2);

% time of L/R EMG overlap%
count = 1;
for i = 1:length(LeftEMG)
    for j = 1:length(RightEMG)
        if LStart(i) < RStart(j) && LEnd(i) > REnd(j)
            Difference(count) = LEnd(i) - RStart(j);
            count = count+1;
        end
    end
end

'Done.'

%duty cycle%

%clear previous variables%
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
EMGStartRaw = input('for duty cycle: name of vector/column for t start of EMGs?');
EMGStart = EMGStartRaw - Trigger(1,1);
Width = input('EMG width?  ');
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