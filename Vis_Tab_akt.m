% Function - Tabelle aktualisieren
function Vis_Tab_akt ()
    % Globale Variablen einführen
    global data
    global Temp_Sensor_oben_gui
    global KW_akt
    global KW_in_Mat_gui
    global ASP_akt
    global Temp_Sensor_unten_gui
    global Seg_Mat_Abs_K_o_P_gui
    global gui_3
    global Seg_Mat_A_Fst_gui
    global Seg_Mat_V_Fst_gui

    % Temperatur obere Ebene
    data(:,1) = num2cell(ceil(Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:)));
    set(gui_3, 'Data', data)
    % Temperatur untere Ebene
    data(:,2) = num2cell(ceil(Temp_Sensor_unten_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:)));
    set(gui_3, 'Data', data)
    % Abstandswerte
    data(:,3) = num2cell(ceil(Seg_Mat_Abs_K_o_P_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:)));
    set(gui_3, 'Data', data)
    % Segmentflächen
    data(:,4) = num2cell(Seg_Mat_A_Fst_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:));
    set(gui_3, 'Data', data)
    % Segmentvolumen
    data(:,5) = num2cell(Seg_Mat_V_Fst_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:));
    set(gui_3, 'Data', data)
end