% Berechnung
% Datum: 20.08.2018
% Markus Kurz
%
% Changelog:
% 
% - Ergebnisse_Lesen_v2
% - Ergebnissordner suchen und für Skript setzen hinzugefügt
% - Gespeicherte Eingabewerte einlesen
% - Ausgabematrizen initialisieren hinzugefügt
% - Reihenfolge geändert
% - Segmentdruck Feuersteg hinzugefügt


% ----- Ergebnisse_Lesen -----
fprintf('Ergebnisse werden eingelesen...%s\n', mfilename);

        
% Segmentfläche Feuersteg
    % .csv Datei in Matrix einlesen
    for i=1:P_Anz
        % Überprüfen ob Datei vorhanden ist
        if exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_A_Fst,'\Seg_Mat_A_Fst_',int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_A_Fst,'\Seg_Mat_A_Fst_',int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            eval(['Seg_Mat_A_Fst(:,:,', int2str(i),') = csv_mat_temp;']);
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end
    
    
% Segmentvolumen Feuersteg
    % .csv Datei in Matrix einlesen
    for i=1:P_Anz
        % Überprüfen ob Datei vorhanden ist
        if exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_V_Fst,'\Seg_Mat_V_Fst_',int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_V_Fst,'\Seg_Mat_V_Fst_',int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            eval(['Seg_Mat_V_Fst(:,:,', int2str(i),') = csv_mat_temp;']);
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end
    
    
% Segmentdruck Feuersteg
    % .csv Datei in Matrix einlesen
    Seg_Mat_P_Fst = zeros(WerteASP, AnzASP, P_Anz);
    for i=1:P_Anz
        % Überprüfen ob Datei vorhanden ist
        if exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Druck_Fst,'\Seg_Mat_P_Fst_',int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Seg_Druck_Fst,'\Seg_Mat_P_Fst_',int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            Seg_Mat_P_Fst(:,:,i) = csv_mat_temp;
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end
    
    
% Abstand bei Mitte Feuersteg: Kolben - Buchse an Punkt P
    % .csv Datei in Matrix einlesen
    Seg_Mat_Abs_K_P = zeros(WerteASP, AnzASP, P_Anz);
    for i=1:P_Anz
        % Überprüfen ob Datei vorhanden ist
        if exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_P,'\Seg_Mat_Abs_K_P_',int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_P,'\Seg_Mat_Abs_K_P_',int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            Seg_Mat_Abs_K_P(:,:,i) = csv_mat_temp;
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end
    
    
% Abstand bei Kolbendach: Kolben - Buchse an Punkt P
    % .csv Datei in Matrix einlesen
    Seg_Mat_Abs_K_o_P = zeros(WerteASP, AnzASP, P_Anz);
    for i=1:P_Anz
        % Überprüfen ob Datei vorhanden ist
        if exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_o_P,'\Seg_Mat_Abs_K_o_P_',int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_o_P,'\Seg_Mat_Abs_K_o_P_',int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            Seg_Mat_Abs_K_o_P(:,:,i) = csv_mat_temp;
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end
    
     
% Volumen Feuersteg komplett
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Fst_Mat_V_sum,'\Feuer_Mat_V_sum.csv'],'file')
        % .csv Datei in Matrix einlesen
        Feuer_Mat_V_sum = csvread([pwd,'\',Folder_Erg,'\',Folder_Fst_Mat_V_sum,'\Feuer_Mat_V_sum.csv']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end
    
    
% Kolbenmittelpunkt in x-Achse bei Mitte Feuersteg
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_Mat,'\Kolben_M_x_Mat.csv'],'file')
        % .csv Datei in Matrix einlesen
        Kolben_M_x_Mat = csvread([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_Mat,'\Kolben_M_x_Mat.csv']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end
    
    
% Kolbenmittelpunkt in x-Achse bei Kolbendach
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_o_Mat,'\Kolben_M_x_o_Mat.csv'],'file')
        % .csv Datei in Matrix einlesen
        Kolben_M_x_o_Mat = csvread([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_o_Mat,'\Kolben_M_x_o_Mat.csv']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end
    
    
% Kolbenmittelpunkt in y-Achse bei Mitte Feuersteg
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_Mat,'\Kolben_M_y_Mat.csv'],'file')
        % .csv Datei in Matrix einlesen
        Kolben_M_y_Mat = csvread([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_Mat,'\Kolben_M_y_Mat.csv']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end
    
    
% Kolbenmittelpunkt in y-Achse bei Kolbendach
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_o_Mat,'\Kolben_M_y_o_Mat.csv'],'file')
        % .csv Datei in Matrix einlesen
        Kolben_M_y_o_Mat = csvread([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_o_Mat,'\Kolben_M_y_o_Mat.csv']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end
    
    
% Verkippwinkel Kolben
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Winkel_Kolben_Mat,'\Winkel_Kolben_Mat.csv'],'file')
        % .csv Datei in Matrix einlesen
        Winkel_Kolben_Mat = csvread([pwd,'\',Folder_Erg,'\',Folder_Winkel_Kolben_Mat,'\Winkel_Kolben_Mat.csv']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end
    
    
% Zu plottende Sensordaten
    % Überprüfen ob Datei vorhanden ist
        % Plot_Data_1
        if exist([pwd,'\',Folder_Erg,'\',Folder_Plot_Data,'\Plot_Data_1.csv'],'file')
            % .csv Datei in Matrix einlesen
            csv_plot_mat_temp_1 = csvread([pwd,'\',Folder_Erg,'\',Folder_Plot_Data,'\Plot_Data_1.csv']);
            eval([Plot_Data_1, '= csv_plot_mat_temp_1;']);
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
        % Plot_Data_2
        if exist([pwd,'\',Folder_Erg,'\',Folder_Plot_Data,'\Plot_Data_2.csv'],'file')
            % .csv Datei in Matrix einlesen
            csv_plot_mat_temp_2 = csvread([pwd,'\',Folder_Erg,'\',Folder_Plot_Data,'\Plot_Data_2.csv']);
            eval([Plot_Data_2, '= csv_plot_mat_temp_2;']);
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
        
        
% Temperatursensordaten Feuersteg
    % .csv Dateien in Matrix einlesen
    Temp_Sensor_oben = zeros(WerteASP, AnzASP, P_Anz);
    Temp_Sensor_unten = zeros(WerteASP, AnzASP, P_Anz);
    for i=1:P_Anz
        % Überprüfen ob Datei vorhanden ist - Obere Ebene
        if exist([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens,'\', Temp_Mess_Name_oben, int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens,'\', Temp_Mess_Name_oben, int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            Temp_Sensor_oben(:,:,i) = csv_mat_temp;
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
        % Überprüfen ob Datei vorhanden ist - unten
        if exist([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens,'\', Temp_Mess_Name_unten, int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens,'\', Temp_Mess_Name_unten, int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            Temp_Sensor_unten(:,:,i) = csv_mat_temp;
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end
 
    
% Abstandssensordaten
    % .csv Dateien in Matrix einlesen
        % DS_oben
            % Überprüfen ob Datei vorhanden ist
            if exist([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_DS_oben.csv'],'file')
                Abst_Sens_DS_oben = csvread([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\', 'Abst_Sens_DS_oben.csv']);
            else
                Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
            end
        % DS_unten
            % Überprüfen ob Datei vorhanden ist
            if exist([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_DS_unten.csv'],'file')
                Abst_Sens_DS_unten = csvread([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\', 'Abst_Sens_DS_unten.csv']);
            else
                Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
            end
        % GDS_oben
            % Überprüfen ob Datei vorhanden ist
            if exist([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_GDS_oben.csv'],'file')
                Abst_Sens_GDS_oben = csvread([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\', 'Abst_Sens_GDS_oben.csv']);
            else
                Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
            end
        % GDS_unten
            % Überprüfen ob Datei vorhanden ist
            if exist([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_GDS_unten.csv'],'file')
                Abst_Sens_GDS_unten = csvread([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\', 'Abst_Sens_GDS_unten.csv']);
            else
                Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
            end
    
    
% Drucksensordaten Feuersteg
    % .csv Dateien in Matrix einlesen
    Druck_Sensor = zeros(WerteASP, AnzASP, Drucksensor_Anz);
    for i=1:Drucksensor_Anz
        % Überprüfen ob Datei vorhanden ist
        if exist([pwd,'\',Folder_Erg,'\',Folder_Druck_Sens,'\', Druck_Mess_Name, int2str(i),'.csv'],'file')
            csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Druck_Sens,'\', Druck_Mess_Name, int2str(i),'.csv']);
            % Matrizen von 2D in 3D umwandeln
            Druck_Sensor(:,:,i) = csv_mat_temp;
        else
            Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
        end
    end

    
% Temperatursensordaten Brennraum
    % .csv Dateien in Matrix einlesen
    for i=1:Temp_Anz_Lanz
        for k=1:Temp_Anz_pro_Lanz
            % Überprüfen ob Datei vorhanden ist
            if eval(['exist([''', pwd, '\', Folder_Erg, '\', Folder_Temp_CH_Sens, '\', Temp_CH_Name, int2str(k), '_', int2str(i), '.csv''],''file'')'])
                csv_mat_temp = csvread([pwd, '\', Folder_Erg, '\', Folder_Temp_CH_Sens, '\', Temp_CH_Name, int2str(k), '_', int2str(i), '.csv']);
                eval([Temp_CH_Name, int2str(k), '_', int2str(i), '= csv_mat_temp;']);
            end
        end
    end
    
    
% Drucksensordaten Brennraum
    % Überprüfen ob Datei vorhanden ist
    if exist([pwd,'\',Folder_Erg,'\',Folder_Druck_CH_Sens,'\', Druck_Mess_Name_CH,'.csv'],'file')
        csv_mat_temp = csvread([pwd,'\',Folder_Erg,'\',Folder_Druck_CH_Sens,'\', Druck_Mess_Name_CH,'.csv']);
        % .csv Dateien in Matrix einlesen
        eval([Druck_Mess_Name_CH, ' = csv_mat_temp;']);
    else
        Ergebnisse_Lesen_Check = Ergebnisse_Lesen_Check + 1;
    end

    
    
    
 