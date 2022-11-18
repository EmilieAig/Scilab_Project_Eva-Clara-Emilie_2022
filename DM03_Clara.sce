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
