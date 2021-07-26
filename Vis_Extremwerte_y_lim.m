% Visualisierung - Extremwerte
% Datum: 28.06.2019
% Markus Kurz

% Extremwerte der Temperatur beider Ebenen Feuersteg
    temp_min_mat = [min(min(min(Temp_Sensor_oben_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :)))) min(min(min(Temp_Sensor_unten_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :))))];
    temp_max_mat = [max(max(max(Temp_Sensor_oben_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :)))) max(max(max(Temp_Sensor_unten_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :))))];  
    global temp_min
    temp_min = min(temp_min_mat);
    global temp_max
    temp_max = max(temp_max_mat);
% Extremwerte von Buchse-Kolben Abstand beider Ebenen
    abst_BK_min_mat = [min(min(min(Seg_Mat_Abs_K_o_P_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :)))) min(min(min(Seg_Mat_Abs_K_o_P_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :))))];
    abst_BK_max_mat = [max(max(max(Seg_Mat_Abs_K_o_P_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :)))) max(max(max(Seg_Mat_Abs_K_o_P_gui([Fenster_Zuend_Beg_gui*KW_in_Mat_gui:Fenster_Zuend_End_gui*KW_in_Mat_gui Fenster_GasW_Beg_gui*KW_in_Mat_gui:Fenster_GasW_End_gui*KW_in_Mat_gui], ASP_Beg_gui:ASP_End_gui, :))))];  
    abst_BK_min = min(abst_BK_min_mat);
    abst_BK_max = max(abst_BK_max_mat);
% Extremwerte von Abstandssensoren
    Abst_Sens_Alle = horzcat(Abst_Sens_DS_oben_gui, Abst_Sens_GDS_oben_gui, Abst_Sens_DS_unten_gui, Abst_Sens_GDS_unten_gui);
    Abst_Sens_Alle_max = max(Abst_Sens_Alle(:));
    Abst_Sens_Alle_min = min(Abst_Sens_Alle(:));
% Extremwerte von Drucksensoren_FS
    Druck_Sens_FS_Alle_max = max(Druck_Sensor(:));
    Druck_Sens_FS_Alle_min = min(Druck_Sensor(:));
% Extremwerte von Temperatursensoren Brennraum
    temp_CH_min = 100000;
    temp_CH_max = -100000;
    for i=1:Temp_Anz_Lanz
        for k=1:Temp_Anz_pro_Lanz
            if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                if eval(['min(', Temp_CH_Name, int2str(k), '_', int2str(i), '(:)) < temp_CH_min'])    
                    temp_CH_min = min(eval([Temp_CH_Name, int2str(k), '_', int2str(i), '(:)']));
                end
            end
        end
    end
    for i=1:Temp_Anz_Lanz
        for k=1:Temp_Anz_pro_Lanz
            if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                if eval(['max(', Temp_CH_Name, int2str(k), '_', int2str(i), '(:)) > temp_CH_max'])    
                    temp_CH_max = max(eval([Temp_CH_Name, int2str(k), '_', int2str(i), '(:)']));
                end
            end
        end
    end
% y-Achsen Begrenzungen für die verschiedenen Sensoren festlegen
    % Temperatur - Feuersteg
        y_Achs_Temp_max = temp_max+0.1*(temp_max-temp_min);
        y_Achs_Temp_min = temp_min-0.1*(temp_max-temp_min);
    % Temperatur - Brennraum
        y_Achs_Temp_CH_max = temp_CH_max+0.1*(temp_CH_max-temp_CH_min);
        y_Achs_Temp_CH_min = temp_CH_min-0.1*(temp_CH_max-temp_CH_min);
    % Abstand Buchse-Kolben
        y_Achs_Abst_BK_max = abst_BK_max+0.1*(abst_BK_max-abst_BK_min);
        y_Achs_Abst_BK_min = abst_BK_min-0.1*(abst_BK_max-abst_BK_min);
    % Abstandsensoren
        y_Achs_Abst_max = Abst_Sens_Alle_max+0.1*(Abst_Sens_Alle_max-Abst_Sens_Alle_min);
        y_Achs_Abst_min = Abst_Sens_Alle_min-0.1*(Abst_Sens_Alle_max-Abst_Sens_Alle_min);
    % Druck
        y_Achs_Druck_max = Druck_Sens_FS_Alle_max+0.1*(Druck_Sens_FS_Alle_max-Druck_Sens_FS_Alle_min);
        y_Achs_Druck_min = Druck_Sens_FS_Alle_min-0.1*(Druck_Sens_FS_Alle_max-Druck_Sens_FS_Alle_min);

