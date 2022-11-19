// Give the number of files.

mode(0);

PRG_PATH = get_absolute_file_path("main.sce");          
fullFileInitTRT = fullfile(PRG_PATH,"InitTRT.sce");
exec(fullFileInitTRT);

// exec the scripts

DM01 = exec(PRG_PATH + "DM01.sce", 'errcatch');
DM02 = exec(PRG_PATH + "DM02.sce", 'errcatch');
DM03 = exec(PRG_PATH + "DM03.sce", 'errcatch');
