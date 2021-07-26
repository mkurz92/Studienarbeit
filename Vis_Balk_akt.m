 % Function - Balkendiagramm aktualisieren
function Vis_Balk_akt()
    % Globale Variablen einführen
    global Temp_Sensor_oben_gui
    global KW_akt
    global KW_in_Mat_gui
    global ASP_akt
    global Temp_Sensor_unten_gui
    global Seg_Mat_Abs_K_o_P_gui
    global Tempebene
    global splot_2_1
    global splot_2_2

    % Abstandsdaten aktualisieren
    set(splot_2_2, 'YData', Seg_Mat_Abs_K_o_P_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:));
    % Temperaturdaten aktualisieren
    if Tempebene == 1
        set(splot_2_1, 'YData', Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:));
    elseif Tempebene == 0
        set(splot_2_1, 'YData', Temp_Sensor_unten_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:));
    else
    end
end