% Funktion - ASP_End_Callback
function Vis_ASP_End_Callback(src, ~)
    % Global Variablen
    global gui_5_4
    global gui_6_4
    global gui_7_2
    global gui_8_4
    global gui_9_4
    global gui_10_4
    global gui_11_4
    global gui_12_4
    global gui_13_4
    global ASP_End_plot

    current_string = get(src, 'String');
    ASP_End_plot = ceil(str2double(current_string));

    % Funktion um Temperaturen zu aktualisieren
    Vis_Temp_akt();
    % Funktion um Abstandssensoren zu aktualisieren
    Vis_Abstandssensoren_akt();
    % Funktikon um Drucksensoren zu aktualisieren
    Vis_Drucksensoren_akt();
    % Funktion um Kippwinkel zu aktualisieren
    Vis_Kippwinkel_akt();
    % Angezeigten String bei ASP Auswahl aktualisieren        
    gui_5_4.String = ASP_End_plot;
    gui_6_4.String = ASP_End_plot;    
    gui_7_2.String = ASP_End_plot;   
    gui_8_4.String = ASP_End_plot;   
    gui_9_4.String = ASP_End_plot;   
    gui_10_4.String = ASP_End_plot;   
    gui_11_4.String = ASP_End_plot;
    gui_12_4.String = ASP_End_plot;
    gui_13_4.String = ASP_End_plot;
end