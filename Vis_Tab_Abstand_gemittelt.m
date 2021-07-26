% Visualisierung Abstand gemittelt
% Datum: 15.01.2019
% Markus Kurz
%
% Changelog:
% 
% 


% --- Tab 4 - Temperatur - ASP gemittelt ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Abst_Sens_DS_oben_gui
        global Abst_Sens_DS_unten_gui
        global Abst_Sens_GDS_oben_gui
        global Abst_Sens_GDS_unten_gui
        
        
    % Checkboxen
        check_2_1 = uicontrol(tab_4, 'Style', 'checkbox', 'String', 'Druckseite oben', 'Units', 'normalized', 'Value', 1, 'Position',[0.01 0.9 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_Abst_Callback, 1});
        check_2_2 = uicontrol(tab_4, 'Style', 'checkbox', 'String', 'Gegendruckseite oben', 'Units', 'normalized', 'Value', 0, 'Position',[0.01 0.87 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_Abst_Callback, 2});
        check_2_3 = uicontrol(tab_4, 'Style', 'checkbox', 'String', 'Druckseite unten', 'Units', 'normalized', 'Value', 1, 'Position',[0.01 0.84 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_Abst_Callback, 3});
        check_2_4 = uicontrol(tab_4, 'Style', 'checkbox', 'String', 'Gegendruckseite unten', 'Units', 'normalized', 'Value', 0, 'Position',[0.01 0.81 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_Abst_Callback, 4});
    
        
    % Eingabefelder
        % ASP Beginn
        global gui_7_1
        gui_7_1 = uicontrol('Parent',tab_4, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_7_2
        gui_7_2 = uicontrol('Parent',tab_4, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_7_3 = uicontrol('Parent',tab_4, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_7_4 = uicontrol('Parent',tab_4, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        
        
    % Koordinatensystem
        global ax7
        ax7 = axes(tab_4, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax7,'ColorOrder',colororder_12)
        hold on
        
        % Arbeitsspiele mitteln
            ax7.ColorOrderIndex = get(ax7, 'ColorOrderIndex')+1;
            % Druckseite oben
            global splot_7_1
            splot_7_1 = plot(x_720, sum(Abst_Sens_DS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'DisplayName', 'Druckseite oben gemittelt');
            ax7.ColorOrderIndex = get(ax7, 'ColorOrderIndex')+1;
            % Gegendruckseite oben
            global splot_7_2
            splot_7_2 = plot(x_720, sum(Abst_Sens_GDS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1), 'Visible', 'off', 'LineWidth', 2, 'DisplayName', 'Gegendruckseite oben gemittelt');
            ax7.ColorOrderIndex = get(ax7, 'ColorOrderIndex')+1;
            % Druckseite unten
            global splot_7_3
            splot_7_3 = plot(x_720, sum(Abst_Sens_DS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'DisplayName', 'Druckseite unten gemittelt');
            ax7.ColorOrderIndex = get(ax7, 'ColorOrderIndex')+1;
            % Gegendruckseite unten
            global splot_7_4
            splot_7_4 = plot(x_720, sum(Abst_Sens_GDS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1), 'Visible', 'off', 'LineWidth', 2, 'DisplayName', 'Gegendruckseite unten gemittelt');
        % Zünd-OT Markierung
            splot_7_5 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Abst_min y_Achs_Abst_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_7_6 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Abst_min y_Achs_Abst_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_7_6 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Abst_min y_Achs_Abst_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_7_7 = uicontrol('Parent',tab_4, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_7_8 = uicontrol('Parent',tab_4, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_7_8 = uicontrol('Parent',tab_4, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_7_7 = uicontrol('Parent',tab_4, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
            
            
        % Axenbeschriftung    
        ylabel('Abstand in µm');
        xlabel('Kurbelwinkel in °KW');
        xtickformat('%.0g')
        ytickformat('%.0g')
        % Achsenbegrenzungen
        ylim([y_Achs_Abst_min y_Achs_Abst_max]);
        xlim([0 720]);
        % Legende
        legend_sichtbar = findobj(ax7,'type','line','visible','on');
        legende_set = legend(legend_sichtbar, 'Location','southeast');
        set(legende_set, 'Interpreter','none', 'Box','off');
        % Titel
        title(['Abstandsverlauf der einzelnen Sensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
        hold off
            
            
            
            
            
            
            
            
            
            
        