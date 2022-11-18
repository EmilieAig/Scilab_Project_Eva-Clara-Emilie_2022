function [DATA, INFO] = readTrial(trialName, phase)
    [lhs, rhs] = argn();
    txtFullPath = fullfile(DAT_PATH, trialName + ".txt");
    infFullPath = fullfile(DAT_PATH, trialName + ".inf");
    readInfFile = fscanfMat(infFullPath);
    INFO = readInfFile;
    readTxtFile = fscanfMat(txtFullPath);
    Beg_Effort = readInfFile(1,1) * 60;
    Dur_Effort = readInfFile(1,2)* 60;
    Fin_Effort_Sec = Beg_Effort + Dur_Effort
    iBeg_Effort = find (readTxtFile(:,1)>= Beg_Effort );
    D_Beg = readTxtFile([iBeg_Effort,$],:);
    iEnd_Effort = find (D_Beg(:,1)<= Fin_Effort_Sec);
    Period_Effort = D_Beg(iEnd_Effort,:);
    iechauffement = find (readTxtFile(:,1)<= Beg_Effort);
    iRecovery = find (readTxtFile(:,1)> Fin_Effort_Sec);
    echauffement = readTxtFile(iechauffement,:);
    effort = Period_Effort;
    recovery = readTxtFile(iRecovery,:);
    DATA = [];
    if rhs == 2 then
         if phase == 'echauffement' then 
                DATA = echauffement
            elseif phase == 'effort' then 
                DATA = effort
            elseif phase == 'recovery' then 
                DATA = recovery
            end
        end
    if rhs == 1 then
        disp(echauffement), disp(effort), disp(recovery);
     if phase == 'echauffement' then 
            DATA = echauffement
        elseif phase == 'effort' then 
            DATA = effort
        elseif phase == 'recovery' then 
            DATA = recovery
    end
endfunction
