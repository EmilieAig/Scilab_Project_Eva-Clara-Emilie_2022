// DM01

mode(0)

// 1. Create a (empty) graphical window with a randomly selected number between 1 and 100 with the function "grand".

randomNum = grand(1, "uin", 1, 100);

figure (randomNum);
clf;
xtitle 'Creation of an empty window with a random number between 1 and 100';
title fontsize 4;
