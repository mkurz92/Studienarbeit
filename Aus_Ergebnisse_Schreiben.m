% Berechnung
% Datum: 13.08.2018
% Markus Kurz
%
% Changelog:
% 
% - Messdaten_Filterung_Log Datei hinzugefügt
% - Segmentdruck Feuersteg hinzugefügt
% 



% ----- Ergebnisse_Schreiben -----
fprintf('Ergebnisse werden geschrieben...%s\n', mfilename);

% Dateiendung Punkt entfernen
Dateiendung_ohne_punkt = strrep(Dateiendung,'.','');
% An gesetzten Ergebnissordner noch aktuelles Datum und Zeit anhängen
Folder_Erg = ['Ergebnisse_', Dateiendung_ohne_punkt, '_', datestr(now,'yyyymmdd_HHMMSS')];

% Segmentfläche Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_A_Fst],'dir')
        mkdir([Folder_Erg, '\', Folder_Seg_Mat_A_Fst]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:P_Anz
        eval(['csv_mat_temp = Seg_Mat_A_Fst(:, :, ', int2str(i),');']);
        % .csv Datei aus 2D Matrix schreiben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_A_Fst,'\Seg_Mat_A_Fst_',int2str(i),'.csv'],csv_mat_temp);
    end

        
% Segmentvolumen Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_V_Fst],'dir')
        mkdir([Folder_Erg, '\', Folder_Seg_Mat_V_Fst]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:P_Anz
        eval(['csv_mat_temp = Seg_Mat_V_Fst(:, :, ', int2str(i),');']);
        % .csv Datei aus 2D Matrix schreiben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_V_Fst,'\Seg_Mat_V_Fst_',int2str(i),'.csv'],csv_mat_temp);
    end


% Segmentdruck Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Druck_Fst],'dir')
        mkdir([Folder_Erg, '\', Folder_Seg_Druck_Fst]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:P_Anz
        csv_mat_temp = Seg_Mat_P_Fst(:,:,i);
        % .csv Datei aus 2D Matrix schreiben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Seg_Druck_Fst,'\Seg_Mat_P_Fst_',int2str(i),'.csv'],csv_mat_temp);
    end
    
        
% Abstand bei Mitte Feuersteg: Kolben - Buchse an Punkt P
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_P],'dir')
        mkdir([Folder_Erg, '\', Folder_Seg_Mat_Abs_K_P]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:P_Anz
        eval(['csv_mat_temp = Seg_Mat_Abs_K_P(:, :, ', int2str(i),');']);
        % .csv Datei aus 2D Matrix schreiben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_P,'\Seg_Mat_Abs_K_P_',int2str(i),'.csv'],csv_mat_temp);
    end 
    
    
% Abstand bei Kolbendach: Kolben - Buchse an Punkt P
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_o_P],'dir')
        mkdir([Folder_Erg, '\', Folder_Seg_Mat_Abs_K_o_P]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:P_Anz
        eval(['csv_mat_temp = Seg_Mat_Abs_K_o_P(:, :, ', int2str(i),');']);
        % .csv Datei aus 2D Matrix schreiben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Seg_Mat_Abs_K_o_P,'\Seg_Mat_Abs_K_o_P_',int2str(i),'.csv'],csv_mat_temp);
    end 
    
    
% Volumen Feuersteg komplett
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Fst_Mat_V_sum],'dir')
        mkdir([Folder_Erg, '\', Folder_Fst_Mat_V_sum]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Fst_Mat_V_sum,'\Feuer_Mat_V_sum.csv'],Feuer_Mat_V_sum);
    
    
% Kolbenmittelpunkt in x-Achse bei Mitte Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_Mat],'dir')
        mkdir([Folder_Erg, '\', Folder_Kolben_M_x_Mat]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_Mat,'\Kolben_M_x_Mat.csv'],Kolben_M_x_Mat);
    
    
% Kolbenmittelpunkt in x-Achse bei Kolbendach
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_o_Mat],'dir')
        mkdir([Folder_Erg, '\', Folder_Kolben_M_x_o_Mat]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_x_o_Mat,'\Kolben_M_x_o_Mat.csv'],Kolben_M_x_o_Mat);
    
     
% Kolbenmittelpunkt in y-Achse bei Mitte Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_Mat],'dir')
        mkdir([Folder_Erg, '\', Folder_Kolben_M_y_Mat]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_Mat,'\Kolben_M_y_Mat.csv'],Kolben_M_y_Mat);
    
    
% Kolbenmittelpunkt in y-Achse bei Kolbendach
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_o_Mat],'dir')
        mkdir([Folder_Erg, '\', Folder_Kolben_M_y_o_Mat]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Kolben_M_y_o_Mat,'\Kolben_M_y_o_Mat.csv'],Kolben_M_y_o_Mat);
    
    
% Verkippwinkel Kolben
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Winkel_Kolben_Mat],'dir')
        mkdir([Folder_Erg, '\', Folder_Winkel_Kolben_Mat]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Winkel_Kolben_Mat,'\Winkel_Kolben_Mat.csv'],Winkel_Kolben_Mat);
    
    
% Zu plottende Sensordaten
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Plot_Data],'dir')
        mkdir([Folder_Erg, '\', Folder_Plot_Data]);
    end
    % .csv Dateien aus 2D Matrix schreiben
    eval(['csv_plot_mat_temp_1 = ', Plot_Data_1, ';']);
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Plot_Data,'\Plot_Data_1.csv'],csv_plot_mat_temp_1);
    eval(['csv_plot_mat_temp_2 = ', Plot_Data_2, ';']);
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Plot_Data,'\Plot_Data_2.csv'],csv_plot_mat_temp_2);
        
    
% Anzahl Arbeitsspiele
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Eingabewerte],'dir')
        mkdir([Folder_Erg, '\', Folder_Eingabewerte]);
    end
    % .csv Datei aus 2D Matrix schreiben
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Eingabewerte,'\AnzASP.csv'],AnzASP);


% Temperatursensordaten Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens],'dir')
        mkdir([Folder_Erg, '\', Folder_Temp_Sens]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:P_Anz
        % .csv Datei aus 3D Matrix schreiben - Obere Ebene
        csv_mat_temp = Temp_Sensor_oben(:,:,i);
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens,'\',Temp_Mess_Name_oben, int2str(i),'.csv'],csv_mat_temp);
        % .csv Datei aus 3D Matrix schreiben - Untere Ebene
        csv_mat_temp = Temp_Sensor_unten(:,:,i);
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Temp_Sens,'\',Temp_Mess_Name_unten, int2str(i),'.csv'],csv_mat_temp);
    end 
    
    
% Abstandssensordaten
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens],'dir')
        mkdir([Folder_Erg, '\', Folder_Abst_Sens]);
    end
    % .csv Datei aus 2D Matrix schreiben
        % DS_oben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_DS_oben.csv'],Abst_Sens_DS_oben_gefiltert);
        % DS_unten
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_DS_unten.csv'],Abst_Sens_DS_unten_gefiltert);
        % GDS_oben
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_GDS_oben.csv'],Abst_Sens_GDS_oben_gefiltert);
        % GDS_unten
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Abst_Sens,'\','Abst_Sens_GDS_unten.csv'],Abst_Sens_GDS_unten_gefiltert);

    
% Drucksensordaten Feuersteg
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Druck_Sens],'dir')
        mkdir([Folder_Erg, '\', Folder_Druck_Sens]);
    end
    % Matrix von 3D in 2D für .csv umwandeln
    for i=1:Drucksensor_Anz
        % .csv Datei aus 3D Matrix schreiben - Druck Feuersteg
        csv_mat_temp = Druck_Sensor(:, :, i);
        csvwrite([pwd,'\',Folder_Erg,'\',Folder_Druck_Sens,'\',Druck_Mess_Name, int2str(i),'.csv'],csv_mat_temp);
    end 
    
    
% Drucksensordaten Brennraum
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Druck_CH_Sens],'dir')
        mkdir([Folder_Erg, '\', Folder_Druck_CH_Sens]);
    end
    % .csv Datei schreiben - Druck Brennraum
    eval(['csv_mat_temp = ', Druck_Mess_Name_CH, '(:, :);']);
    csvwrite([pwd,'\',Folder_Erg,'\',Folder_Druck_CH_Sens,'\',Druck_Mess_Name_CH ,'.csv'],csv_mat_temp);
    
    
% Temperatursensordaten Brennraum
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Temp_CH_Sens],'dir')
        mkdir([Folder_Erg, '\', Folder_Temp_CH_Sens]);
    end
    % Falls vorhanden .csv Dateien schreiben
    for i=1:Temp_Anz_Lanz
        for k=1:Temp_Anz_pro_Lanz
            if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                eval(['csv_mat_temp = ', Temp_CH_Name, int2str(k), '_', int2str(i), ';']);
                csvwrite([pwd, '\',Folder_Erg, '\', Folder_Temp_CH_Sens,'\',Temp_CH_Name,int2str(k),'_',int2str(i),'.csv'],csv_mat_temp);
            end
        end
    end
    
    
% Eingabewerte Datei in Ergebnisse kopieren um später davon einzulesen
    % Eingabewerte Datei speichern
    copyfile([pwd,'\',Dateiname_Eingabewerte,'.m'], [pwd,'\',Folder_Erg,'\',Dateiname_Eingabewerte,'_Ergebnisse.m']);
    
     
% Messdaten Filterung Log Datei
    % Unterordner erstellen wenn nicht vorhanden
    if ~exist([pwd,'\',Folder_Erg,'\',Folder_Eingabewerte],'dir')
        mkdir([Folder_Erg, '\', Folder_Eingabewerte]);
    end
    % .txt Datei aus File_MessFilt_txt schreiben
    fileID = fopen([pwd,'\',Folder_Erg,'\',Folder_Eingabewerte, '\', File_MessFilt_txt],'w+');
        % Anzahl der Strings in Cell Array ermitteln
        Cell_Size = size(Messdaten_gefiltert_txt);
        Cell_String_count = Cell_Size(1, 1);
        for i=1:Cell_String_count
            Cell2Str = char(Messdaten_gefiltert_txt{i, 1});
            fprintf(fileID, '%s\r\n', Cell2Str);
        end
    fclose(fileID);
    




    
    
    