% Function - Scatterdiagramm aktualisieren
function Vis_Scat_akt()
    % Globale Variablen einführen
    global Temp_Sensor_oben_gui
    global KW_akt
    global KW_in_Mat_gui
    global ASP_akt
    global Temp_Sensor_unten_gui
    global Seg_Mat_Abs_K_o_P_gui
    global splot_4_3
    global splot_4_4
    global splot_4_3_vis_xData
    global Tempebene
    global P_Anz_gui
    global splot_4_3_vis_yData

    % Abstandsdaten aktualisieren
    splot_4_3_vis_xData(1:P_Anz_gui) = Seg_Mat_Abs_K_o_P_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
    set(splot_4_3, 'XData', splot_4_3_vis_xData);
    % Temperaturdaten aktualisieren
    if Tempebene == 1
        splot_4_3_vis_yData(1:P_Anz_gui) = Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
    elseif Tempebene == 0
        splot_4_3_vis_yData(1:P_Anz_gui) = Temp_Sensor_unten_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
    else
    end
    set(splot_4_3, 'YData', splot_4_3_vis_yData);
    % Line of Best Fit aktualisieren
    set(splot_4_4, 'YData', polyval(polyfit(splot_4_3_vis_xData, splot_4_3_vis_yData, 1), splot_4_3_vis_xData));
end