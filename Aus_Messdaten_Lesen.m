% Messdaten_Lesen
% Datum: 13.09.2018
% Markus Kurz
%
% Changelog:
% - Messdaten einlesen komplett überarbeitet. Namen der Messdateien schon
%   vor dem Einlesen bekannt




% Dat_file_read
fprintf('Dateien werden gesucht und eingelesen...%s\n', mfilename);

% Anzahl der Werte pro Arbeitsspiel
global WerteASP
WerteASP = 720/Winkelaufloesung;

% AnzASP initialisieren
global AnzASP

% Benutzereingabe anfordern 
fprintf('\nAus folgenden Dateitypen können die Messdaten bestehen:\n\n');
fprintf('(1) %s Messdaten\n',Dateiendung_1);
fprintf('(2) %s Messdaten\n',Dateiendung_2);
prompt = '\n\nBitte wählen Sie durch Eingabe der entsprechenden Zahl den zu ladenden Messdatentyp aus:   ';
Auswahl = input(prompt);
% Auswahl überprüfen
    if Auswahl == 1
        % Dateiendung auf ausgewählte Dateiendung setzen
        Dateiendung = Dateiendung_1;
        fprintf('%s wurde als Dateiendung ausgewählt.\n\n',Dateiendung);
    elseif Auswahl == 2
        % Dateiendung auf ausgewählte Dateiendung setzen
        Dateiendung = Dateiendung_2;
        fprintf('%s wurde als Dateiendung ausgewählt.\n\n',Dateiendung);
    else
        fprintf('Der eingegebene Wert liegt außerhalt des Eingabebereichs!\n');
        fprintf('Es können keine Messdaten eingelesen werden.\n\n');
        error('Fehler in Eingabe erkannt! Programm wird beendet!');
    end


% Überprüfen ob Folder_Messdaten existiert
if ~exist([pwd,'\',Folder_Messdaten],'dir')
    error('Messdatenordner existiert nicht! Programm wird beendet!');
end    


% --- Messdaten einlesen ---

    % .DAT Datei einlesen
    if strcmp(Dateiendung,'.DAT')
         % Drucksensoren Feuersteg Messdaten einlesen
         Druck_Sensor =zeros(WerteASP, AnzASP, Drucksensor_Anz);
         for k=1:Drucksensor_Anz
             % .DAT Datei einlesen
             tmp = datread([Druck_Mess_Name,int2str(k),Dateiendung]);
             % Datensatz in Matrix mit WerteASP und AnzASP formatieren
             Druck_Sensor(:, :, k) = sortasp(tmp,Winkelaufloesung);
         end
         % Temperatursensor Messdaten einlesen
         Temp_Sensor_oben = zeros(WerteASP, AnzASP, P_Anz);
         Temp_Sensor_unten = zeros(WerteASP, AnzASP, P_Anz);
         for k=1:P_Anz
             % Obere Ebene
                 % .DAT Datei einlesen
                 tmp = datread([Temp_Mess_Name_oben,int2str(k),Dateiendung]);
                 % Datensatz in Matrix mit WerteASP und AnzASP formatieren
                 Temp_Sensor_oben(:,:,k) = sortasp(tmp,Winkelaufloesung);
             % Untere Ebene
                 % .DAT Datei einlesen
                 tmp = datread([Temp_Mess_Name_unten,int2str(k),Dateiendung]);
                 % Datensatz in Matrix mit WerteASP und AnzASP formatieren
                 Temp_Sensor_unten(:,:,k) = sortasp(tmp,Winkelaufloesung);
         end
        % Abstandssensor Messdaten einlesen
            % GDS_oben
                % .DAT Datei einlesen
                tmp = datread([Abst_Mess_Name_GDS_oben,Dateiendung]);
                % Datensatz in Matrix mit WerteASP und AnzASP formatieren
                Abst_Sens_GDS_oben = sortasp(tmp,Winkelaufloesung);
            % GDS_unten
                % .DAT Datei einlesen
                tmp = datread([Abst_Mess_Name_GDS_unten,Dateiendung]);
                % Datensatz in Matrix mit WerteASP und AnzASP formatieren
                Abst_Sens_GDS_unten = sortasp(tmp,Winkelaufloesung);
            % DS_oben
                % .DAT Datei einlesen
                tmp = datread([Abst_Mess_Name_DS_oben,Dateiendung]);
                % Datensatz in Matrix mit WerteASP und AnzASP formatieren
                Abst_Sens_DS_oben = sortasp(tmp,Winkelaufloesung);
            % DS_unten
                % .DAT Datei einlesen
                tmp = datread([Abst_Mess_Name_DS_unten,Dateiendung]);
                % Datensatz in Matrix mit WerteASP und AnzASP formatieren
                Abst_Sens_DS_unten = sortasp(tmp,Winkelaufloesung);
  
    % .csv Datei einlesen    
    elseif strcmp(Dateiendung,'.csv')
        % Matrixgröße ermitteln
            csv_mat_temp = csvread([pwd,'\',Folder_Messdaten,'\',Druck_Mess_Name,int2str(1),Dateiendung]);
            Size_csv_mat_temp = size(csv_mat_temp(1,:));
            % AnzASP ermitteln
            AnzASP = Size_csv_mat_temp(1,2);
        % Drucksensoren Feuersteg Messdaten einlesen
        Druck_Sensor = zeros(WerteASP, AnzASP, Drucksensor_Anz);
        for k=1:Drucksensor_Anz
            csv_mat_temp = csvread([pwd,'\',Folder_Messdaten,'\',Druck_Mess_Name,int2str(k),Dateiendung]);
            Druck_Sensor(:, :, k) = csv_mat_temp;
        end
        % Drucksensor Brennraum Messdaten einlesen
        if eval(['exist([''', pwd, '\', Folder_Messdaten, '\', Druck_Mess_Name_CH, Dateiendung, '''],''file'')'])
            csv_mat_temp = csvread([pwd, '\', Folder_Messdaten, '\', Druck_Mess_Name_CH, Dateiendung]);
            eval([Druck_Mess_Name_CH, ' = csv_mat_temp;']);
        end
        % Temperatursensor Feuersteg Messdaten einlesen
        Temp_Sensor_oben = zeros(WerteASP, AnzASP, P_Anz);
        Temp_Sensor_unten = zeros(WerteASP, AnzASP, P_Anz);
        for k=1:P_Anz
            % Obere Ebene
            Temp_Sensor_oben(:,:,k) = csvread([pwd,'\',Folder_Messdaten,'\', Temp_Mess_Name_oben,int2str(k),Dateiendung]);
            % Untere Ebene
            Temp_Sensor_unten(:,:,k) = csvread([pwd,'\',Folder_Messdaten,'\', Temp_Mess_Name_unten,int2str(k),Dateiendung]);
        end
        % Temperatursensoren Brennraum Messdaten einlesen
        for i=1:Temp_Anz_Lanz
            for k=1:Temp_Anz_pro_Lanz
                if eval(['exist([''', pwd, '\', Folder_Messdaten, '\', Temp_CH_Name, int2str(k), '_', int2str(i), Dateiendung, '''],''file'')'])
                    csv_mat_temp = csvread([pwd, '\', Folder_Messdaten, '\', Temp_CH_Name, int2str(k), '_', int2str(i), Dateiendung]);
                    eval([Temp_CH_Name, int2str(k), '_', int2str(i), '= csv_mat_temp;']);
                end
            end
        end
        % Abstandssensor Messdaten einlesen
            % GDS_oben
            Abst_Sens_GDS_oben = csvread([pwd,'\',Folder_Messdaten,'\', Abst_Mess_Name_GDS_oben, Dateiendung]);
            %eval([Abst_Var_Name_GDS_oben, ' = csv_mat_temp;']);
            % GDS_unten
            Abst_Sens_GDS_unten = csvread([pwd,'\',Folder_Messdaten,'\', Abst_Mess_Name_GDS_unten, Dateiendung]);
            %eval([Abst_Var_Name_GDS_unten, ' = csv_mat_temp;']);
            % DS_oben
            Abst_Sens_DS_oben = csvread([pwd,'\',Folder_Messdaten,'\', Abst_Mess_Name_DS_oben, Dateiendung]);
            %eval([Abst_Var_Name_DS_oben, ' = csv_mat_temp;']);
            % DS_unten
            Abst_Sens_DS_unten = csvread([pwd,'\',Folder_Messdaten,'\', Abst_Mess_Name_DS_unten, Dateiendung]);
            %eval([Abst_Var_Name_DS_unten, ' = csv_mat_temp;']);
    else
        error('Für ausgewählte Dateiendung steht keine Einleseroutine zur Verfügung! Programm wird beendet!');
    end

    
    
    
% Matlabfunktion zum lesen eines KBK-dat-Files
% Marco Leonetti
% Stuttgart den 09.06.2011
%
% Geändert: Markus Kurz
% Stuttgart, 13.03.2018
%
% Changelog:
% - Variablen global gemacht (Debug)
%
% Out = datread(Filename, Skip, Anzahl);
%
% Filename Name des zu ladenden Datfiles                <String>
% Skip      Werte die übersprungen werden sollen        <Skalar>
% Anzahl    Anzahl Werte die eingelesen werden sollen   <Skalar>

function Out = datread(Filename, varargin)

altPfad = pwd;
% Momentanes Verzeichnis auf Folder_Messdaten setzen
global Folder_Messdaten
cd([pwd,'\', Folder_Messdaten]);


if ~exist(Filename,'file')
    error('> Falscher Filename');
end

fid = fopen(Filename,'r');
% Header lesen

Kal_Float = fread(fid,3,'float32');
global Debug_Kal_Float;
Debug_Kal_Float = Kal_Float;


% fseek(fid,3*4,'bof');

Kal_Int = fread(fid,4,'int16');
global Debug_Kal_Int;
Debug_Kal_Int = Kal_Int;

Kal = Kal_Float(1)*Kal_Float(2)*Kal_Float(3)/Kal_Int(2);
global Debug_Kal;
Debug_Kal = Kal;


switch nargin
    case 1
       fseek(fid,512,'bof');
       Out = fread(fid,'int16');
    case 2
        SW = varargin{1};
        fseek(fid,SW*2+512,'bof');
        clear('varargin');
        Out = fread(fid,'int16');
    case 3
        SW = varargin{1};           
        AnzW = varargin{2};
        clear('varargin');
        fseek(fid,SW*2+512,'bof'); 
        Out = fread(fid, AnzW, 'int16');   
    otherwise
    error('Fehler zu viele eingabeparameter!');
end
% Skalieren der AD-Werte
global Debug_Out_vorher;
Debug_Out_vorher = Out;

Out = (Out-Kal_Int(1))*Kal;

global Debug_Out_nacher;
Debug_Out_nacher = Out;

% Schließen des Files
fclose(fid);

cd(altPfad);
end




% INPUT
% Signal[-] <1xn>    Winkelkontinuierliches Signel
% Wal   [-] <1x1>    Winkelauflösung  
%
% Signale aus Zeilenvektor in KWxASP aufteilen
% Marco Leonetti
% Stuttgart, 02.03.2007
%
% Geändert: Markus Kurz
% Stuttgart, 13.03.2018

% Sortiert = sortasp(Signal,Winaufloes)
function Sortiert = sortasp(Signal,~)


% Anzahl der Werte pro Arbeitsspiel
global WerteASP

% Anzahl der Arbeitsspiele bis zu denen gerechnet werden soll
global ASP_End

% Anzahl der vollständigen Arbeitsspiele
global AnzASP
AnzASP    = floor(length(Signal)/WerteASP);

% Sortierte Matrix: Werte_pro_Arbeitsspiel x vollständige_Arbeitsspiele
Sortiert  = reshape(Signal(1:WerteASP*AnzASP), [WerteASP,AnzASP]);

if AnzASP < ASP_End
    error('Das Ende der Arbeitsspiele für die Auswertung übersteigt die Anzahl der eingelesenen Arbeitsspiele!');
end

end






