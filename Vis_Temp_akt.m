% Funktion - Temperaturtabs Plots aktualisieren
function Vis_Temp_akt()
    % Global Variablen
    global ASP_End_plot
    global ASP_Beg_plot
    global ax5
    global ax6
    global ax11
    global ax12
    global P_Anz_gui
    global AnzASP_gui
    global Temp_Sensor_oben_gui
    global Temp_Sensor_unten_gui
    global splot_5_1_0
    global splot_5_2_0
    global splot_6_1
    global splot_6_2
    global splot_11_1_0_0
    global splot_12_1
    global splot_12_2
    global Alle_Brennraumtemperaturen_mittel
    global Temp_Anz_Lanz_gui
    global Temp_Anz_pro_Lanz_gui
    global Brennraumtemp_vorhanden
    global Temp_CH_Name_gui

    % Temperatur Feuersteg gemittelt
        % Alle Temperatursensoren gemittelt aktualisieren
        set(splot_5_1_0, 'YData', sum((sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot, :),2)/(ASP_End_plot-ASP_Beg_plot+1)),3)/P_Anz_gui);
        set(splot_5_2_0, 'YData', sum((sum(Temp_Sensor_unten_gui(:, ASP_Beg_plot:ASP_End_plot, :),2)/(ASP_End_plot-ASP_Beg_plot+1)),3)/P_Anz_gui);
        % Einzelne Temperatursensoren aktualisieren
        for k=1:P_Anz_gui
            % Obere Ebene
            eval(['global splot_5_1_', num2str(k)]);
            eval(['set(splot_5_1_', num2str(k), ',''YData'', sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot,', num2str(k), '), 2)/(ASP_End_plot-ASP_Beg_plot+1));']);
            % Untere Ebene
            eval(['global splot_5_2_', num2str(k)]);
            eval(['set(splot_5_2_', num2str(k), ',''YData'', sum(Temp_Sensor_unten_gui(:, ASP_Beg_plot:ASP_End_plot,', num2str(k), '), 2)/(ASP_End_plot-ASP_Beg_plot+1));']);
        end
        % Titel ändern
        title(ax5, ['Temperaturverlauf der einzelnen Sensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
    % Temperatur Feuersteg einzeln
        % Einzelne Temperatursensoren ausblenden
        for k=1:ASP_Beg_plot-1
            set(splot_6_1(k), 'Visible', 'off');
        end
        for k=ASP_End_plot+1:AnzASP_gui
            set(splot_6_1(k), 'Visible', 'off');
        end
        % Einzelne Temperatursensoren einblenden
        for k=ASP_Beg_plot:ASP_End_plot
            set(splot_6_1(k), 'Visible', 'on');
        end
        % Gemittelter Wert auf ASP Bereich anpassen
        if get(splot_6_2, 'UserData') <= P_Anz_gui
            set(splot_6_2, 'YData', sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot, get(splot_6_2, 'UserData')),2)/(ASP_End_plot-ASP_Beg_plot+1));
        elseif get(splot_6_2, 'UserData') > P_Anz_gui
            set(splot_6_2, 'YData', sum(Temp_Sensor_unten_gui(:, ASP_Beg_plot:ASP_End_plot, get(splot_6_2, 'UserData')-12),2)/(ASP_End_plot-ASP_Beg_plot+1));
        end
        % Titel ändern
        title(ax6, ['Temperaturverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
    % Temperatur Brennraum gemittelt
        % Alle Temperatursensoren gemittelt aktualisieren
        set(splot_11_1_0_0, 'YData', sum(Alle_Brennraumtemperaturen_mittel(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1));
        % Einzelne Temperatursensoren aktualisieren
        for i=1:Temp_Anz_Lanz_gui
            for k=1:Temp_Anz_pro_Lanz_gui
                if Brennraumtemp_vorhanden(k, i) == 1
                    eval(['global splot_11_1_', int2str(k), '_', int2str(i)])
                    eval(['global ', Temp_CH_Name_gui, int2str(k), '_', int2str(i)])
                    eval(['set(splot_11_1_', int2str(k), '_', int2str(i), ', ''YData'', sum(', Temp_CH_Name_gui, int2str(k), '_', int2str(i), '(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1));'])
                end
            end
        end
        % Titel ändern
        title(ax11, ['Temperaturverlauf der einzelnen Brennraumsensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
    % Temperatur Brennraum einzeln
        % Einzelne Temperatursensoren ausblenden
        for k=1:ASP_Beg_plot-1
            set(splot_12_1(k), 'Visible', 'off');
        end
        for k=ASP_End_plot+1:AnzASP_gui
            set(splot_12_1(k), 'Visible', 'off');
        end
        % Einzelne Temperatursensoren einblenden
        for k=ASP_Beg_plot:ASP_End_plot
            set(splot_12_1(k), 'Visible', 'on');
        end
        % Gemittelter Wert auf ASP Bereich anpassen
        UserDat = get(splot_12_2, 'UserData');
        UserDatMat = cell2mat(UserDat);
        eval(['set(splot_12_2, ''YData'', sum(', Temp_CH_Name_gui, int2str(UserDatMat(1,1)), '_', int2str(UserDatMat(1,2)), '(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1));']);
        % Titel ändern
        title(ax12, ['Temperaturverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
end






