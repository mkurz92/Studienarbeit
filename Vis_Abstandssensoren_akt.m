% Funktion - Abstandssensoren gemittelt aktualisieren
function Vis_Abstandssensoren_akt()
    % Global Variablen
    global ax7
    global ax8
    global ASP_Beg_plot
    global ASP_End_plot
    global AnzASP_gui
    global Abst_Sens_DS_oben_gui
    global Abst_Sens_GDS_oben_gui
    global Abst_Sens_DS_unten_gui
    global Abst_Sens_GDS_unten_gui
    global splot_8_1
    global splot_8_2
    for k=1:4
        eval(['global splot_7_', int2str(k)]);
    end
    
    % Abstand gemittelt
        set(splot_7_1, 'YData', sum(Abst_Sens_DS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
        set(splot_7_2, 'YData', sum(Abst_Sens_GDS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
        set(splot_7_3, 'YData', sum(Abst_Sens_DS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
        set(splot_7_4, 'YData', sum(Abst_Sens_GDS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
        % Titel ändern
        title(ax7, ['Abstandsverlauf der einzelnen Sensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
    % Abstand einzeln
        % Einzelne Abstandssensoren ausblenden
        for k=1:ASP_Beg_plot-1
            set(splot_8_1(k), 'Visible', 'off');
        end
        for k=ASP_End_plot+1:AnzASP_gui
            set(splot_8_1(k), 'Visible', 'off');
        end
        % Einzelne Abstandssensoren einblenden
        for k=ASP_Beg_plot:ASP_End_plot
            set(splot_8_1(k), 'Visible', 'on');
        end
        % Gemittelter Wert auf ASP Bereich anpassen
        switch get(splot_8_2, 'UserData')
            case 1
                set(splot_8_2, 'YData', sum(Abst_Sens_DS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            case 2
                set(splot_8_2, 'YData', sum(Abst_Sens_GDS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            case 3
                set(splot_8_2, 'YData', sum(Abst_Sens_DS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            case 4
                set(splot_8_2, 'YData', sum(Abst_Sens_GDS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            otherwise
        end
        % Titel ändern
        title(ax8, ['Abstandsverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
end