% Funktion - ASP_Beg_Callback
function Vis_ASP_Beg_Callback(src, ~)
    % Global Variablen
    global gui_5_3
    global gui_6_3
    global gui_7_1
    global gui_8_3
    global gui_9_3
    global gui_10_3
    global gui_11_3
    global gui_12_3
    global gui_13_3
    global ASP_Beg_plot

    current_string = get(src, 'String');
    ASP_Beg_plot = ceil(str2double(current_string));

    % Funktion um Temperaturen zu aktualisieren
    Vis_Temp_akt();
    % Funktion um Abstandssensoren zu aktualisieren
    Vis_Abstandssensoren_akt();
    % Funktikon um Drucksensoren zu aktualisieren
    Vis_Drucksensoren_akt();
    % Funktion um Kippwinkel zu aktualisieren
    Vis_Kippwinkel_akt();
    % Angezeigten String bei ASP Auswahl aktualisieren        
    gui_5_3.String = ASP_Beg_plot;
    gui_6_3.String = ASP_Beg_plot;
    gui_7_1.String = ASP_Beg_plot;
    gui_8_3.String = ASP_Beg_plot;
    gui_9_3.String = ASP_Beg_plot;
    gui_10_3.String = ASP_Beg_plot;
    gui_11_3.String = ASP_Beg_plot;
    gui_12_3.String = ASP_Beg_plot;
    gui_13_3.String = ASP_Beg_plot;
end