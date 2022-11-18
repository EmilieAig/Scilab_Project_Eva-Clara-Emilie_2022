// DM03

mode(0)

// Open the file S04C2E01.

trialName = "S04C2E01";
fullFileName = fullfile(DAT_PATH, trialName + ".txt");
fullFileNameInf = fullfile(DAT_PATH, trialName + ".inf");
data = fscanfMat(fullFileName);
dataInf = fscanfMat(fullFileNameInf);

// 3. Repeat all DM02 analyses only during the exercise period.

// Select only the effort period.

time = data(:,1);

// We use the .inf file to find the limits of the effort period.

begEffort_Min = dataInf(1,1);
begEffort_Sec = begEffort_Min * 60;
effortDuration_Min = dataInf(1,2);
effortDuration_Sec = effortDuration_Min * 60;
endEffort_Sec = begEffort_Sec + effortDuration_Sec;

// We create the variable containing the period of effort on the .txt file.

iBegEffort = find (time >= begEffort_Sec);
dataBegEffort = data([iBegEffort,$],:);
iEndEffort = find (dataBegEffort(:,1) <= endEffort_Sec);
periodEffort = dataBegEffort(iEndEffort,:);

// 3.2. Create VO2 containing the data from the VO2 column of Data.

VO2 = periodEffort(:,2);

// 3.3. Create end_100 containing the data of the last 100 ventilation cycles.

timePeriodEffort = periodEffort(:,1);
dataLength = length(timePeriodEffort);
dataBeg_100 = dataLength - 99;
end_100 = periodEffort([dataBeg_100:dataLength],:);

// 3.4. Save end_100 in an ASCII file named end_100Effort.txt.

fName_100 = "end_100Effort.txt";
fullFileNameRES = fullfile(RES_PATH,fName_100);
fprintfMat(fullFileNameRES, end_100);

// 3.5. Create DATA_01To10 containing only the first 10 minutes of the test.

iFirst_10Minutes = find(timePeriodEffort <= 600);
DATA_01To10 = periodEffort(iFirst_10Minutes,:);

// 3.7. Show how to use this function in a script that displays the average values in 2 minute blocks until the end of the test.

// Starting points.

tBeg = begEffort_Sec;
tEnd = tBeg + (2*60);

// Calculation of moving averages per blocks of 2 minutes with a loop.

while tBeg <= timePeriodEffort($);
    tBeg = tBeg + (2*60);
    tEnd = tEnd + (2*60);
    meanValues = dataMeanOverPeriod(periodEffort, tBeg, tEnd);
end

// 3.8. Write a script that displays (in the console) the duration of the test and "Good Candidate" if the time limit is over 15 minutes.

// Not coherent for the period of effort.

// 3.9. Write a script that displays the value and time of maximum respiratory frequency.

respFreq = periodEffort(:,4);
respFreqMax = max(respFreq); // Find the maximal respiratority frequency.
iRespFreqMax = find (respFreq == respFreqMax);
timeRespFreqMax_Sec = data(iRespFreqMax,1); // Find the time value that corresponds to the maximum respiratory frequency.
timeRespFreqMax_Min = timeRespFreqMax_Sec / 60;
disp ("The value at which the respiratory frequency is maximum is " + string(respFreqMax) + " cycles/minutes, and it was reached at " + string(timeRespFreqMax_Sec) + " secondes, i.e " + string(timeRespFreqMax_Min) + " minutes");

// 4. and 5. See function "readTrial".

trialName = "S04C2E01";

[DATA, INFO] = readTrial(trialName,'echauffement')

// 6. Perform an average per block of 30s, then display the plateaus obtained for each signal in the console. At what plateau of 30s do we obtain the VO2 max.

tBeg_30s = 1;
tEnd_30s = max(data(:,1));

timeEnd_30s = tBeg_30s + (30);

listTest = [];
trays = 0;

while tBeg_30s <= tEnd_30s;
    tBeg_30s = tBeg_30s + (30);
    timeEnd_30s = timeEnd_30s + (30);
    trays = trays + 1;
    meanValues_30s = dataMeanOverPeriod(data, tBeg_30s, timeEnd_30s);
    listTest = [listTest;trays,meanValues_30s];
end

VO2Trays = listTest(:,3);
maxVO2 = max(VO2Trays);
imaxVO2 = find(VO2Trays == maxVO2);

traysVO2 = listTest(imaxVO2,1);

disp("The tray of 30s where we obtain the maximum VO2 is tray number : " + string(traysVO2));

// 7. Make a graph with the signal and its average per tray of 30s, with all legends.

figure();
plot (data(:,1),data(:,[2]),'b');
plot (listTest(:,2),listTest(:,3),'*-r');
title("Characteristics as a function of time");
title fontsize 4;
xlabel ("Time(sec)");
ylabel ("VO2(L/min)");
legend("Oxygen flow, VO2 (L/min)","Mean of VO2 (L/min) by trays of 30s");

// 8. Display in the console, using a loop on the 4 variables measured: VO2 max at tray 21 (10.5 minutes in effort).

allVariables = [];

MaxVariablesTrays = [];

variables = ["trays","time","VO2","VCO2","FR","VT"];

for k = 3:6;
    column_variables = listTest(:,k);
    maxVariables = max(listTest(:,k));
    allVariables = [allVariables; maxVariables];
    imaxVariables = find(column_variables == maxVariables);//plateau
    timeTrays = listTest(imaxVariables,2);
    timeTraysMin = timeTrays / 60;
    if timeTrays < periodEffort(:,1);
        then phase1 = 'echauffement';
    elseif timeTrays > periodEffort(:,1);
        then phase1 = 'recovery';
    else phase1 = 'effort';
        end
    disp (variables(k) + " max on set " + string(imaxVariables) + " (" + string(timeTraysMin) + " minutes in " + phase1 + ")");
    MaxVariablesTrays =[MaxVariablesTrays;imaxVariables,timeTraysMin,maxVariables];
end

// 9. Save previous results to file/files. How to name this file? Where to store them.

fName_Max = "TraysParametersMax.txt";
fullFileNameRES = fullfile(RES_PATH,fName_Max);
fprintfMat(fullFileNameRES, MaxVariablesTrays);

//10. Is analysis better with 1 min plateaus? Or with trays of 15 seconds? Make a comparative graph of the two to support the decision.

tBeg_60s = 1;
tEnd_60s = max(data(:,1));

timeEnd_60s = tBeg_60s + (60);

listTest_60 = [];
trays_60 = 0;

while tBeg_60s <= tEnd_60s;
    tBeg_60s = tBeg_60s + (60);
    timeEnd_60s = timeEnd_60s + (60);
    trays_60 = trays_60 + 1;
    meanValues_60s = dataMeanOverPeriod(data, tBeg_60s, timeEnd_60s);
    listTest_60 = [listTest_60;trays_60,meanValues_60s];
end

tBeg_15s = 1;
tEnd_15s = max(data(:,1));

timeEnd_15s = tBeg_15s + (15);

listTest_15 = [];
trays_15 = 0;

while tBeg_15s <= tEnd_15s;
    tBeg_15s = tBeg_15s + (15);
    timeEnd_15s = timeEnd_15s + (15);
    trays_15 = trays_15 + 1;
    meanValues_15s = dataMeanOverPeriod(data, tBeg_15s, timeEnd_15s);
    listTest_15 = [listTest_15;trays_15,meanValues_15s];
end

figure();
plot (listTest_60(:,2),listTest_60(:,3),'-r');
plot (listTest_15(:,2),listTest_15(:,3),'-b');
title("Analysis by different trays of the VO2");
title fontsize 4;
xlabel ("Time(sec)");
ylabel ("VO2(L/min)");
legend("VO2 average (L/min) per 60s trays","VO2 average (L/min) per 15s trays");
