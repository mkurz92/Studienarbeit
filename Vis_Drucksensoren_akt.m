% Funktion - Drucksensoren aktualisieren
function Vis_Drucksensoren_akt()
    % Global Variablen
    global ax9
    global ax10
    global Druck_Sensor_gui
    global Druck_Mess_Name_CH_gui
    global ASP_Beg_plot
    global ASP_End_plot
    global Drucksensor_Anz_gui
    global splot_9_1_0
    global splot_10_1
    global splot_10_2
    global AnzASP_gui
    for k=1:Drucksensor_Anz_gui
        eval(['global splot_9_1_', int2str(k)]);
    end
    eval(['global splot_9_1_', num2str(Drucksensor_Anz_gui+1)]);
    
    % Druck gemittelt
        % Alle Drucksensoren im Feuersteg gemittelt aktualisieren
        set(splot_9_1_0, 'YData', sum((sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot, :),2)/(ASP_End_plot-ASP_Beg_plot+1)),3)/Drucksensor_Anz_gui);
        % Einzelne Drucksensoren im Feuersteg aktualisieren
        for k=1:Drucksensor_Anz_gui
            eval(['set(splot_9_1_', int2str(k), ', ''YData'', sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot, ', int2str(k), '),2)/(ASP_End_plot-ASP_Beg_plot+1));']);
        end
        % Drucksensor im Brennraum aktualisieren
        eval(['global ', Druck_Mess_Name_CH_gui, '_0'])
        eval(['set(splot_9_1_', num2str(Drucksensor_Anz_gui+1), ', ''YData'',sum(', Druck_Mess_Name_CH_gui, '_0(:,ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1));']);
        % Titel ändern
        title(ax9, ['Druckverlauf der einzelnen Sensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
    % Druck einzeln
        % Einzelne Drucksensoren ausblenden
        for k=1:ASP_Beg_plot-1
            set(splot_10_1(k), 'Visible', 'off');
        end
        for k=ASP_End_plot+1:AnzASP_gui
            set(splot_10_1(k), 'Visible', 'off');
        end
        % Einzelne Drucksensoren einblenden
        for k=ASP_Beg_plot:ASP_End_plot
            set(splot_10_1(k), 'Visible', 'on');
        end
        % Gemittelter Wert auf ASP Bereich anpassen
            % Feuersteg
            if get(splot_10_2, 'UserData') <= Drucksensor_Anz_gui
                set(splot_10_2, 'YData', sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot, get(splot_10_2, 'UserData')),2)/(ASP_End_plot-ASP_Beg_plot+1));
            % Brennraum
            elseif get(splot_10_2, 'UserData') > Drucksensor_Anz_gui
                eval(['set(splot_10_2, ''YData'', sum(', Druck_Mess_Name_CH_gui, '_0(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));']);
            end
        % Titel ändern
        title(ax10, ['Druckverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
end