% Visualisierung Temperatur gemittelt
% Datum: 17.12.2018
% Markus Kurz
%
% Changelog:
% 
% 




% --- Tab 2 - Temperatur - ASP gemittelt ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Temp_Sensor_oben_gui
        global Temp_Sensor_unten_gui


    % Checkboxen
        % Obere Ebene
            gui_5_1 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.01 0.94 0.09 0.02], 'HorizontalAlignment', 'left', 'FontUnits','normalized', 'FontSize',0.9, 'String', 'Obere Ebene', 'BackgroundColor','white');
            check_0 = uicontrol(tab_2, 'Style', 'checkbox', 'String', 'Alle Sensoren gemittelt', 'Units', 'normalized', 'Value', 1, 'Position',[0.01 0.9 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_oben_Callback, 0});
            for i=1:P_Anz
                eval(['check_', num2str(i), ' = uicontrol(tab_2, ''Style'', ''checkbox'', ''String'', ''Sensor_', int2str(i), ''', ''Units'', ''normalized'', ''Position'', [0.01 0.9-', int2str(i), '*0.03 0.09 0.03], ''BackgroundColor'',''white'', ''Callback'', {@Vis_Check_oben_Callback, ', int2str(i), '});']);
            end
        % Untere Ebene
            gui_5_2 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.01 0.47 0.09 0.02], 'HorizontalAlignment', 'left', 'FontUnits','normalized', 'FontSize',0.9, 'String', 'Untere Ebene', 'BackgroundColor','white');
            check_1_0 = uicontrol(tab_2, 'Style', 'checkbox', 'String', 'Alle Sensoren gemittelt', 'Units', 'normalized', 'Value', 1, 'Position',[0.01 0.43 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_unten_Callback, 0});
            for i=1:P_Anz
                eval(['check_1_', num2str(i), ' = uicontrol(tab_2, ''Style'', ''checkbox'', ''String'', ''Sensor_', int2str(i), ''', ''Units'', ''normalized'', ''Position'', [0.01 0.43-', int2str(i), '*0.03 0.09 0.03], ''BackgroundColor'',''white'', ''Callback'', {@Vis_Check_unten_Callback, ', int2str(i), '});']);
            end
            
            
    % Eingabefelder
        % ASP Beginn
        global gui_5_3
        gui_5_3 = uicontrol('Parent',tab_2, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_5_4
        gui_5_4 = uicontrol('Parent',tab_2, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_5_5 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_5_6 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
    
        
    % Koordinatensystem
        global ax5
        ax5 = axes(tab_2, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax5,'ColorOrder',colororder_12)
        hold on
  
        % Arbeitsspiele mitteln    
            % Temperatursensoren obere Ebene
                % Gemittelte Temperatur plotten
                global splot_5_1_0
                splot_5_1_0 = plot(x_720, sum((sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot, :),2)/(ASP_End_plot-ASP_Beg_plot+1)),3)/P_Anz_gui, 'LineWidth', 2, 'DisplayName', 'Alle Sensoren obere Ebene gemittelt');
                % Einzelne Temperatursensoren plotten
                for k=1:P_Anz_gui
                    eval(['global splot_5_1_', num2str(k)]);
                    eval(['splot_5_1_', num2str(k), ' = plot(x_720, sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot,', num2str(k), '), 2)/(ASP_End_plot-ASP_Beg_plot+1), ''LineWidth'', 2, ''Visible'', ''off'', ''DisplayName'', [''Sensor_', num2str(k),' obere Ebene'']);']);
                end
            % Temperatursensoren untere Ebene
                % Gemittelte Temperatur plotten
                global splot_5_2_0
                splot_5_2_0 = plot(x_720, sum((sum(Temp_Sensor_unten_gui(:, ASP_Beg_plot:ASP_End_plot, :),2)/(ASP_End_plot-ASP_Beg_plot+1)),3)/P_Anz_gui, 'LineWidth', 2, 'DisplayName', 'Alle Sensoren untere Ebene gemittelt');
                % Einzelne Temperatursensoren plotten
                for k=1:P_Anz_gui
                    eval(['global splot_5_2_', int2str(k)]);
                    eval(['splot_5_2_', num2str(k), ' = plot(x_720, sum(Temp_Sensor_unten_gui(:, ASP_Beg_plot:ASP_End_plot,', num2str(k), '), 2)/(ASP_End_plot-ASP_Beg_plot+1), ''LineWidth'', 2, ''Visible'', ''off'', ''DisplayName'', [''Sensor_', num2str(k),' untere Ebene'']);']);
                end
        % Zünd-OT Markierung
            splot_5_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Temp_min y_Achs_Temp_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_5_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Temp_min y_Achs_Temp_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_5_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Temp_min y_Achs_Temp_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_5_7 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_5_8 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_5_8 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_5_7 = uicontrol('Parent',tab_2, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
            
        % Axenbeschriftung    
        ylabel('Temperatur in °C');
        xlabel('Kurbelwinkel in °KW');
        xtickformat('%.0g')
        ytickformat('%.0g')
        % Achsenbegrenzungen
        ylim([y_Achs_Temp_min y_Achs_Temp_max]);
        xlim([0 720]);
        % Legende
        legend_sichtbar = findobj(ax5,'type','line','visible','on');
        legende_set = legend(legend_sichtbar, 'Location','southeast');
        set(legende_set, 'Interpreter','none', 'Box','off');
        % Titel
        title(['Temperaturverlauf der einzelnen Feuerstegsensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
        hold off






        
        
        
        
        
        