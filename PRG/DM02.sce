// DM02

mode(0)

// Open the file S04C2E01.

fName = "S04C2E01.txt";
fullFileName = fullfile(DAT_PATH, fName);
data = fscanfMat(fullFileName);

// 2. Create VO2 containing data from the VO2 column of data.

VO2 = data(:,2);

// 3. Create end_100 containing the data of the last 100 ventilatory cycles.

time = data(:,1);
dataLength = length(time);
dataBeg_100 = dataLength - 99;
end_100 = data([dataBeg_100:dataLength],:);

// 4. Save end_100 in an ASCII file named end_100.txt.

fName_100 = "end_100.txt";
fullFileNameRES = fullfile(RES_PATH,fName_100);
fprintfMat(fullFileNameRES, end_100);

// 5. Create DATA_01To10 containing only the first 10 minutes of the test.

iFirst_10Minutes = find(time <= 600);
DATA_01To10 = data(iFirst_10Minutes,:);

// 6. See function "dataMeanOverPeriod.sci".

// 7. Show how to use this function in a script that displays the average values in 2 minute blocks until the end of the test.

// Starting points.

tBeg = 0;
tEnd = tBeg + (2*60);

// Calculation of moving averages per blocks of 2 minutes with a loop.

while tBeg <= time($);
    tBeg = tBeg + (2*60);
    tEnd = tEnd + (2*60);
    meanValues = dataMeanOverPeriod(data, tBeg, tEnd);
end

// 8. Write a script that displays (in the console) the duration of the test and "Good Candidate" if the time limit is over 15 minutes.

duration_Sec = time($);
duration_Min = duration_Sec / 60;
disp ("The duration of the test is " + string(duration_Sec) + " secondes, i.e "+ string(duration_Min) + " minutes.");

if duration_Min > 15;
    then disp ("Good Candidate !");
end

// 9. Write a script that displays the value and time of maximum respiratory frequency.

respFreq = data(:,4);
respFreqMax = max(respFreq); // Find the maximal respiratority frequency.
iRespFreqMax = find (respFreq == respFreqMax);
timeRespFreqMax_Sec = data(iRespFreqMax,1); // Find the time value that corresponds to the maximum respiratory frequency.
timeRespFreqMax_Min = timeRespFreqMax_Sec / 60;
disp ("The value at which the respiratory frequency is maximum is " + string(respFreqMax) + " cycles/minutes, and it was reached at " + string(timeRespFreqMax_Sec) + " secondes, i.e " + string(timeRespFreqMax_Min) + " minutes.");
