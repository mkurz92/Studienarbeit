% Visualisierung Druck gemittelt
% Datum: 17.12.2018
% Markus Kurz
%
% Changelog:
% 
% 




% --- Tab 6 - Druck - ASP gemittelt ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Druck_Sensor_gui
        global Druck_Mess_Name_CH_gui


    % Checkboxen
        check_3_0 = uicontrol(tab_6, 'Style', 'checkbox', 'String', 'PS_TL gemittelt', 'Units', 'normalized', 'Value', 1, 'Position',[0.01 0.9 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_Druck_Callback, 0});
        for i=1:Drucksensor_Anz
            eval(['check_3_', num2str(i), ' = uicontrol(tab_6, ''Style'', ''checkbox'', ''String'', ''', Druck_Mess_Name,  int2str(i), ''', ''Units'', ''normalized'', ''Position'', [0.01 0.9-', int2str(i), '*0.03 0.09 0.03], ''BackgroundColor'',''white'', ''Callback'', {@Vis_Check_Druck_Callback, ', int2str(i), '});']);
        end
        eval(['check_3_', int2str(Drucksensor_Anz+1), ' = uicontrol(tab_6, ''Style'', ''checkbox'', ''String'', ''', Druck_Mess_Name_CH, ''', ''Units'', ''normalized'', ''Position'', [0.01 0.9-', int2str(Drucksensor_Anz+1), '*0.03 0.09 0.03], ''BackgroundColor'',''white'', ''Callback'', {@Vis_Check_Druck_Callback, ', int2str(Drucksensor_Anz+1), '});']);
            
            
    % Eingabefelder
        % ASP Beginn
        global gui_9_3
        gui_9_3 = uicontrol('Parent',tab_6, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_9_4
        gui_9_4 = uicontrol('Parent',tab_6, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_9_5 = uicontrol('Parent',tab_6, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_9_6 = uicontrol('Parent',tab_6, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
    
        
    % Koordinatensystem
        global ax9
        ax9 = axes(tab_6, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax9,'ColorOrder',colororder_12)
        hold on
  
        % Arbeitsspiele mitteln    
            % Gemittelter Druck Feuersteg plotten
            global splot_9_1_0
            splot_9_1_0 = plot(x_720, sum((sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot, :),2)/(ASP_End_plot-ASP_Beg_plot+1)),3)/Drucksensor_Anz, 'LineWidth', 2, 'DisplayName', 'PS_TL gemittelt');
            % Einzelne Drucksensoren Feuersteg plotten
            for k=1:Drucksensor_Anz
                eval(['global splot_9_1_', num2str(k)]);
                eval(['splot_9_1_', num2str(k), ' = plot(x_720, sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot,', num2str(k), '), 2)/(ASP_End_plot-ASP_Beg_plot+1), ''LineWidth'', 2, ''Visible'', ''off'', ''DisplayName'', [''', Druck_Mess_Name, num2str(k),''']);']);
            end
            % Drucksensor Brennraum plotten
            eval(['global splot_9_1_', num2str(Drucksensor_Anz+1)]);
            eval(['splot_9_1_', num2str(Drucksensor_Anz+1), ' = plot(x_720, sum(', Druck_Mess_Name_CH_gui, '_0(:,ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1), ''LineWidth'', 2, ''Visible'', ''off'', ''DisplayName'', [''', Druck_Mess_Name_CH, ''']);']);
        % Zünd-OT Markierung
            splot_9_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Druck_min y_Achs_Druck_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_9_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Druck_min y_Achs_Druck_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_9_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Druck_min y_Achs_Druck_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_9_7 = uicontrol('Parent',tab_6, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_9_8 = uicontrol('Parent',tab_6, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_9_8 = uicontrol('Parent',tab_6, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_9_7 = uicontrol('Parent',tab_6, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
            
        % Axenbeschriftung    
        ylabel('Druck in bar');
        xlabel('Kurbelwinkel in °KW');
        xtickformat('%.0g')
        ytickformat('%.0g')
        % Achsenbegrenzungen
        ylim([y_Achs_Druck_min y_Achs_Druck_max]);
        xlim([0 720]);
        % Legende
        legend_sichtbar = findobj(ax9,'type','line','visible','on');
        legende_set = legend(legend_sichtbar, 'Location','southeast');
        set(legende_set, 'Interpreter','none', 'Box','off');
        % Titel
        title(['Druckverlauf der einzelnen Sensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
        hold off






        
        
        
        
        
        