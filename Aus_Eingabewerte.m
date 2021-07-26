% Eingabewerte
% Datum: 11.12.2018
% Markus Kurz
%
% Changelog:
% 
% - Abstandssensoren Ergebnissordner

fprintf('Eingabewerte werden geladen...%s\n', mfilename);
Dateiname_Eingabewerte = mfilename;


    % --- Buchse ---
        % Durchmesser [mm]
        D_Buchse = 79;
        
    % --- Kolben ---
        % Durchmesser [mm]
        D_Kolbenkrone = 78.293;
      % D_Kolbenkrone = 78.293;
      % D_Kolbenkrone = 78.293;
      % D_Kolbenkrone = 78.293;
        % Hoehe Feuersteg [mm]
        H_Fst = 5.1;
      % H_Fst = 5.1;
      % H_Fst = 5.1;
      % H_Fst = 5.1;
        % Abstand Kolbenbolzen zu Kolbendach [mm]
        KolbenB_KD = 30.95;
                
    % --- Kinematik Kurbeltrieb ---
        % Hub oder Kurbelradius [mm]
        Hub = 81.5;
      % Kurb_Rad = 81.5/2;
        % Pleullänge [mm]
        Pleul_L = 148.2;
        % Abstand Kolbendach zu Oberkante Zylinderbuchse in OT [mm]
        Abs_KD_Zyl_o = 0.1;
        % Desaxierung, positiv Richtung Druckseite[mm]
        Desax = 0.3;
        
    % --- Drucksensoren Feuersteg ---
        % Namenskonvention der Messdatenbenennung der Drucksensoren
        Druck_Mess_Name = 'PS_TL_';
        % Anzahl Drucksensoren
        Drucksensor_Anz = 4;
        % Winkel des ersten Drucksensors aus der Horizontalen gegen
         % Uhrzeigersinn [°]
         Drucksensor_Wi_0 = 90;
         
    % --- Drucksensor Brennraum ---
        % Namenskonvention der Messdatenbenennung der Drucksensors im Brennraum
        Druck_Mess_Name_CH = 'PS_CC_5';
                     
    % --- Temperatursensoren Feuersteg ---
        % Namenskonvention der Messdatenbenennung der Temperatursensoren
        Temp_Mess_Name_oben = 'Temp_oben_real_';
        Temp_Mess_Name_unten = 'Temp_unten_real_';
        % Anzahl Temperatursensoren pro Ebene
        P_Anz = 12;
        % Winkel Punkt P1 aus der Horizontalen gegen Uhrzeigersinn [°]
        P_Wi_0 = 105;
    
    % --- Temperatursensoren Brennraum ---
        % Namenskonvention der Messdatenbenennung der Temperatursensoren
        Temp_CH_Name = 'TC_CH_';
        % Anzahl Temperatursensoren pro Lanze
        Temp_Anz_pro_Lanz = 4;
        % Anzahl Temperatursensorlanzen
        Temp_Anz_Lanz = 5;
        
    % --- Abstandssensoren ---
        % Sensorabstand [mm]
        Sensor_Abstand = 15.5; 
        % Untere Abstandssensoren z-Position [mm]
         % 0 bei Oberkante Zylinderbuchse, positiv Richtung Kurbelwelle
         Sens_Abst_Unten_OT = 14.45;
         Sens_Abst_Unten = 45.5;
        % Messdaten Einheit auswählen
            % Millimeter (.csv Datei)
            %Sensor_Einheit = 1;
            % Mikrometer (.DAT Datei)
            Sensor_Einheit = 1/1000;
        % Namenskonvention der Messdatenbenennung der Abstandssensoren
            % Messdaten Sensor GDS oben (Einlass oben)
            Abst_Mess_Name_GDS_oben = 'GDS60mm_dat';
            % Messdaten Sensor GDS unten (Einlass unten)
            Abst_Mess_Name_GDS_unten = 'GDS95mm_dat';
            % Messdaten Sensor DS oben (Auslass oben)
            Abst_Mess_Name_DS_oben = 'DS60mm_dat';
            % Messdaten Sensor DS unten (Auslass unten)
            Abst_Mess_Name_DS_unten = 'DS95mm_dat';
                    
    % --- Messdaten allgemein ---
        % Abtastrate [°KW]
        %Winkelaufloesung = 1/10;
        Winkelaufloesung = 1/4;
        % Beginn Messdaten vor Zünd-OT [°KW]
        Beg_MD_KW = 180;
        % Ordnername für Messdaten
        global Folder_Messdaten
        Folder_Messdaten = 'Messdaten';
        % Dateiendung KBK Datei (.dat)
        Dateiendung_1 = '.DAT';
        % Dateiendung XXX Datei (.csv)
        Dateiendung_2 = '.csv';
        % Beginn Arbeitsspiel für Auswertung
        ASP_Beg = 1;
        % Ende Arbeitsspiel für Auswertung
        global ASP_End
        ASP_End = 1066;
        % Anzahl der Fenster
        Fenster_Anz = 2;
        % Fensterung WerteASP um Zünd OT
            % Beginn Fensterung Zünd OT [°KW]
            Fenster_Zuend_Beg = 150;
            % Ende Fensterung Zünd OT [°KW]
            Fenster_Zuend_End = 210;
        % Fensterung WerteASP um Gaswechsel OT
            % Beginn Fensterung Gaswechsel OT [°KW]
            Fenster_GasW_Beg = 510;
            % Ende Fensterung Gaswechsel OT [°KW]
            Fenster_GasW_End = 570;
        % Anzahl negativer Werte ab denen Offset auf Messdaten hinzugefügt
        % wird
        Anz_neg_Werte_Offset = 5;
        
    % --- Plot ---
        % Zu plottende Sensordaten
        Plot_Data_1 = 'Abst_Sens_GDS_oben_gefiltert';
        Plot_Data_2 = 'Abst_Sens_GDS_unten_gefiltert';
        % Übertreibung der Verschiebung
        global Plot_delta_y_faktor;
        Plot_delta_y_faktor = 45;
        global Plot_delta_x_faktor;
        Plot_delta_x_faktor = 45;
        % Verkleinungsfaktor Kolbendurchmesser
        global Plot_D_Kolbenkrone_faktor;
        Plot_D_Kolbenkrone_faktor = 0.70;
        % Transparenz
        Plot_Transp = 0.15;
        
        
    % --- Ergebnisse speichern ---
        % Ordnername für Segmentflaeche Feuersteg
        Folder_Seg_Mat_A_Fst = 'Segmentflaeche_Feuersteg';
        % Ordnername für Segmentflaeche Feuersteg
        Folder_Seg_Mat_V_Fst = 'Segmentvolumen_Feuersteg';
        % Ordnername für Abstand bei Mitte Feuersteg: Buchse - Kolben
        Folder_Seg_Mat_Abs_K_P = 'Abstand_Feuersteg_Mitte_Buchse-Kolben';
        % Ordnername für Abstand bei Kolbendach: Buchse - Kolben
        Folder_Seg_Mat_Abs_K_o_P = 'Abstand_Feuersteg_Oben_Buchse-Kolben';
        % Ordnername für Volumen Feuersteg komplett
        Folder_Fst_Mat_V_sum = 'Feuerstegvolumen_komplett';
        % Ordnername für Kolbenmittelpunkt in x-Achse bei Mitte Feuersteg
        Folder_Kolben_M_x_Mat = 'Kolbenmittelpunktverschiebung_Mitte_Feuersteg_x-Achse';
        % Ordnername für Kolbenmittelpunkt in x-Achse bei Kolbendach
        Folder_Kolben_M_x_o_Mat = 'Kolbenmittelpunktverschiebung_Kolbendach_x-Achse';
        % Ordnername für Kolbenmittelpunkt in y-Achse bei Mitte Feuersteg
        Folder_Kolben_M_y_Mat = 'Kolbenmittelpunktverschiebung_Mitte_Feuersteg_y-Achse';
        % Ordnername für Kolbenmittelpunkt in y-Achse bei Kolbendach
        Folder_Kolben_M_y_o_Mat = 'Kolbenmittelpunktverschiebung_Kolbendach_y-Achse';
        % Ordnername für Verkippwinkel Kolben
        Folder_Winkel_Kolben_Mat = 'Verkippwinkel_Kolben';
        % Ordnername für zu plottende Sensordaten
        Folder_Plot_Data = 'Plot_Messdaten';
        % Ordnername für WerteASP und AnzASP
        Folder_Eingabewerte = 'Config';
        % Ordnername für Segmentdruck Feuersteg
        Folder_Seg_Druck_Fst = 'Segmentdruck_Feuersteg';
        % Ordnername für Temperatursensoren Feuersteg
        Folder_Temp_Sens = 'Temperatursensordaten_Feuersteg_gefiltert';
        % Ordnername für Abstandssensoren
        Folder_Abst_Sens = 'Abstandssensordaten_gefiltert';
        % Ordnername für Drucksensoren Feuersteg
        Folder_Druck_Sens = 'Drucksensordaten_Feuersteg_gefilter';
        % Ordnername für Drucksensoren Brennraum
        Folder_Druck_CH_Sens = 'Drucksensordaten_Brennraum_gefilter';
        % Ordnername für Temperatursensordaten Brennraum
        Folder_Temp_CH_Sens = 'Temperatursensordaten_Brennraum_gefiltert';
        % Dateiname für Textdatei der Messdatenfilterung
        File_MessFilt_txt = 'Messdaten_Filterung_Log.txt';
        
        
        
        
        
        