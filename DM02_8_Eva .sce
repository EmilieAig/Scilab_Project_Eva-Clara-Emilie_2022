// DM02

mode(0)

// Open the file S04C2E01.

fName = "S04C2E01.txt";
fullFileName = fullfile(DAT_PATH, fName);
data = fscanfMat(fullFileName);


// 8. Write a script that displays (in the console) the duration of the test and "Good Candidate" if the time limit is over 15 minutes.
time = data(:,1);

duration_Sec = time($);
duration_Min = duration_Sec / 60;
disp ("The duration of the test is " + string(duration_Sec) + " secondes, i.e "+ string(duration_Min) + " minutes.");

if duration_Min > 15;
    then disp ("Good Candidate !");
end
