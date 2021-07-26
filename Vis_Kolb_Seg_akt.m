% Function - Kolben und Segmente aktualisieren
function Vis_Kolb_Seg_akt()
    % Globale Variablen einf�hren
    global KW_in_Mat_gui
    global Seg_patch
    global x_1_patch
    global y_1_patch
    global Kreis_patch
    global x_2_patch
    global y_2_patch
    global Plot_D_Kolbenkrone_faktor
    global R_Kolben_gui
    global Tempebene
    global Temp_Sensor_oben_gui
    global Temp_Sensor_unten_gui
    global farbe_temp
    global x
    global ASP_akt
    global Kolben_M_x_o_Mat_gui
    global Kolben_M_y_o_Mat_gui
    global KW_akt

    % Segmentfl�chen einf�rben
        % Mittelpunkt der auszuf�llenden Segmentfl�chen aktualisieren
        x_1_patch(101,:)=Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
        y_1_patch(101,:)=Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
        % X-Werte und Y-Werte f�r auszuf�llenden Segmentfl�chen aktualisieren
        set(Seg_patch, 'XData', x_1_patch);
        set(Seg_patch, 'YData', y_1_patch);
        % Patch Farben f�r Sensorwerte anpassen
        if Tempebene == 1
            farbe_temp(:,1) = Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
            set(Seg_patch, 'CData', farbe_temp);
        elseif Tempebene == 0
            farbe_temp(:,1) = Temp_Sensor_unten_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
            set(Seg_patch, 'CData', farbe_temp);  
        else
        end
    % Ausgef�llten grauer Kreis um gef�rbe Segmentfl�chen zu verdecken
        % X-Werte und Y-Werte f�r ausgef�llten Kreis neu berechnen
        x_2_patch = Plot_D_Kolbenkrone_faktor*R_Kolben_gui*cosd(x)+Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
        y_2_patch = Plot_D_Kolbenkrone_faktor*R_Kolben_gui*sind(x)+Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
        % X-Werte und Y-Werte f�r ausgef�llten Kreis aktualisieren
        set(Kreis_patch, 'XData', x_2_patch);
        set(Kreis_patch, 'YData', y_2_patch);
end