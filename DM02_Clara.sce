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
