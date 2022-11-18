// 6. Write the code for the meanValues function that calculates the average values of VO2, VCO2, FR and VT over a recording period between tBeg and tEnd (inclusive).

function meanValues = dataMeanOverPeriod (data, tBeg, tEnd)
    time = data(:,1);
    iTimeBeg = find(tBeg <= time);
    dataBeg = data([iTimeBeg,$],:); // After finding the index of values greater than tBeg, we create a new variable that starts at tBeg.
    iTimeEnd = find(dataBeg(:,1) <= tEnd);
    dataBound = dataBeg(iTimeEnd,:); // After having found the index of the values lower than tEnd, we create a new variable which starts at tBeg and ends at tEnd.
    meanValues = mean(dataBound,"r");
endfunction
