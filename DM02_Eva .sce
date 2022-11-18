// DM02

mode(0)

// Open the file S04C2E01.

fName = "S04C2E01.txt";
fullFileName = fullfile(DAT_PATH, fName);
data = fscanfMat(fullFileName);


// 5. Create DATA_01To10 containing only the first 10 minutes of the test.

time = data(:,1);
iFirst_10Minutes = find(time <= 600);
DATA_01To10 = data(iFirst_10Minutes,:);
