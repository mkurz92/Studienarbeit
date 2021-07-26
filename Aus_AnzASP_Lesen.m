% Anzahl Arbeitsspiele einlesen
% Datum: 22.08.2018
% Markus Kurz
%
% Changelog:
% 
%



% ----- AnzASP_Lesen -----
fprintf('Anzahl Arbeitsspiele werden eingelesen...%s\n', mfilename);

% Ergebnisse einlesen Check Variable
Ergebnisse_Lesen_Check = 0;


% Anzahl Arbeitsspiele einlesen
global AnzASP
    % AnzASP
    if exist([pwd,'\',Folder_Erg,'\',Folder_Eingabewerte,'\AnzASP.csv'],'file')
        % .csv Datei in Matrix einlesen
        AnzASP = csvread([pwd,'\',Folder_Erg,'\',Folder_Eingabewerte,'\AnzASP.csv']);
        fprintf('- AnzASP zu %d eingelesen.\n', AnzASP);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end