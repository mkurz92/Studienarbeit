% Funktion - Abstandssensoren gemittelt aktualisieren
function Vis_Kippwinkel_akt()
    % Global Variablen
    global ax13
    global ASP_Beg_plot
    global ASP_End_plot
    global Winkel_Kolben_Mat_gui
    global splot_13_1
    
    
    % Verkippwinkel aktualisieren
    set(splot_13_1, 'YData', sum(Winkel_Kolben_Mat_gui(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1));
    % Titel ändern
    title(ax13, ['Verkippwinkel Kolben im Bereich der Fensterung von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen']);
end