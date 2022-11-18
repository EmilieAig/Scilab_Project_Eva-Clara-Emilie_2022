// DM03

mode(0)

// Open the file S04C2E01.

trialName = "S04C2E01";
fullFileName = fullfile(DAT_PATH, trialName + ".txt");
data = fscanfMat(fullFileName);

// 6. Perform an average per block of 30s, then display the trays obtained for each signal in the console. At what plateau of 30s do we obtain the VO2 max.

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

