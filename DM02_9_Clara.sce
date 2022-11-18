// DM02

mode(0)

// Open the file S04C2E01.

fName = "S04C2E01.txt";
fullFileName = fullfile(DAT_PATH, fName);
data = fscanfMat(fullFileName);

// 9. Write a script that displays the value and time of maximum respiratory frequency.

respFreq = data(:,4);
respFreqMax = max(respFreq); // Find the maximal respiratority frequency.
iRespFreqMax = find (respFreq == respFreqMax);
timeRespFreqMax_Sec = data(iRespFreqMax,1); // Find the time value that corresponds to the maximum respiratory frequency.
timeRespFreqMax_Min = timeRespFreqMax_Sec / 60;
disp ("The value at which the respiratory frequency is maximum is " + string(respFreqMax) + " cycles/minutes, and it was reached at " + string(timeRespFreqMax_Sec) + " secondes, i.e " + string(timeRespFreqMax_Min) + " minutes.");
