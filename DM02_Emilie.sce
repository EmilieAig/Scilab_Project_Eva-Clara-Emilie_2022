// DM02

mode(0)

// Open the file S04C2E01.

fName = "S04C2E01.txt";
fullFileName = fullfile(DAT_PATH, fName);
data = fscanfMat(fullFileName);
time = data(:,1);

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
