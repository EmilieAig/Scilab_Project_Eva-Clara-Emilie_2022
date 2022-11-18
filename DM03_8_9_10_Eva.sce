// DM03

mode(0)

// Open the file S04C2E01.

trialName = "S04C2E01";
fullFileName = fullfile(DAT_PATH, trialName + ".txt");
fullFileNameInf = fullfile(DAT_PATH, trialName + ".inf");
data = fscanfMat(fullFileName);
dataInf = fscanfMat(fullFileNameInf);

/////Need to variables of question 3 for question 8
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


////Need to variables of question 6 for question 8
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
