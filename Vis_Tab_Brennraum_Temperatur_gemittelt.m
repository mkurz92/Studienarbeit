% Visualisierung Brennraum - Temperatur gemittelt
% Datum: 22.04.2019
% Markus Kurz
%
% Changelog:
% 
% 



% --- Tab 8 - Brennraum - Temperatur - ASP gemittelt ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Temp_Anz_Lanz_gui
        global Temp_Anz_pro_Lanz_gui
        global Temp_CH_Name_gui


    % Checkboxen Lanzen
        tab_8_zaehler = 1;
        check_4_0 = uicontrol(tab_8, 'Style', 'checkbox', 'String', 'Alle Sensoren gemittelt', 'Units', 'normalized', 'Value', 1, 'Position',[0.01 0.9 0.09 0.03], 'BackgroundColor','white', 'Callback', {@Vis_Check_Temp_CH_Callback, 0, 0});
        for i=1:Temp_Anz_Lanz_gui
            for k=1:Temp_Anz_pro_Lanz_gui
                if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                    eval(['check_4_', num2str(tab_8_zaehler), ' = uicontrol(tab_8, ''Style'', ''checkbox'', ''String'', ''', Temp_CH_Name, int2str(k), '_', int2str(i), ''', ''Units'', ''normalized'', ''Position'', [0.01 0.9-', int2str(tab_8_zaehler), '*0.03 0.09 0.03], ''BackgroundColor'',''white'', ''Callback'', {@Vis_Check_Temp_CH_Callback, ', int2str(k), ', ', int2str(i),'});']);
                    tab_8_zaehler = tab_8_zaehler + 1;
                end
            end
        end


    % Eingabefelder
        % ASP Beginn
        global gui_11_3
        gui_11_3 = uicontrol('Parent',tab_8, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_11_4
        gui_11_4 = uicontrol('Parent',tab_8, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_11_5 = uicontrol('Parent',tab_8, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_11_6 = uicontrol('Parent',tab_8, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        
        
    % Koordinatensystem
        global ax11
        ax11= axes(tab_8, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax11,'ColorOrder',colororder_12)
        hold on
        
        % Vorhandene Temperatursensoren der Lanzen mitteln
            for i=1:Temp_Anz_Lanz_gui
                eval(['Lanze_', int2str(i), '_summe = zeros(WerteASP, AnzASP);'])
                tab_8_zaehler = 0;
                for k=1:Temp_Anz_pro_Lanz_gui
                    if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                        eval(['Lanze_', int2str(i), '_summe = Lanze_', int2str(i), '_summe + ', Temp_CH_Name, int2str(k), '_', int2str(i), ';'])
                        tab_8_zaehler = tab_8_zaehler + 1;
                    end
                end
                if tab_8_zaehler ~= 0
                    eval(['Lanze_', int2str(i), '_gemittelt = Lanze_', int2str(i), '_summe / tab_8_zaehler;'])
                end
            end
        % Alle Brennraumtemperaturen mitteln
            tab_8_zaehler = 0;
            Alle_Brennraumtemperaturen_summe = zeros(WerteASP, AnzASP);
            for i=1:Temp_Anz_Lanz_gui
                for k=1:Temp_Anz_pro_Lanz_gui
                    if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                        eval(['Alle_Brennraumtemperaturen_summe = Alle_Brennraumtemperaturen_summe + ', Temp_CH_Name, int2str(k), '_', int2str(i), ';'])
                        tab_8_zaehler = tab_8_zaehler + 1;
                    end
                end
            end
            global Alle_Brennraumtemperaturen_mittel
            Alle_Brennraumtemperaturen_mittel = Alle_Brennraumtemperaturen_summe / tab_8_zaehler;
            % Alle Brennraumtemperaturen mitteln plotten
            global splot_11_1_0_0
            splot_11_1_0_0 = plot(x_720, sum(Alle_Brennraumtemperaturen_mittel(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'DisplayName', 'Alle Brennraumsensoren gemittelt');
        % Einzelne Brennraumtemperaturen mitteln
            for i=1:Temp_Anz_Lanz_gui
                for k=1:Temp_Anz_pro_Lanz_gui
                    if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                        eval(['global splot_11_1_', int2str(k), '_', int2str(i)])
                        eval(['splot_11_1_', int2str(k), '_', int2str(i), ' = plot(x_720, sum(', Temp_CH_Name_gui, int2str(k), '_', int2str(i), '(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1), ''LineWidth'', 2, ''Visible'', ''off'', ''DisplayName'', [''', Temp_CH_Name, int2str(k), '_', int2str(i), ''']);']);
                    end
                end
            end
        % Zünd-OT Markierung
            splot_11_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Temp_CH_min y_Achs_Temp_CH_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_11_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Temp_CH_min y_Achs_Temp_CH_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_11_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Temp_CH_min y_Achs_Temp_CH_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_11_7 = uicontrol('Parent',tab_8, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_11_8 = uicontrol('Parent',tab_8, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_11_8 = uicontrol('Parent',tab_8, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_11_7 = uicontrol('Parent',tab_8, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
            
            % Axenbeschriftung    
            ylabel('Temperatur in °C');
            xlabel('Kurbelwinkel in °KW');
            xtickformat('%.0g')
            ytickformat('%.0g')
            % Achsenbegrenzungen
            ylim([y_Achs_Temp_CH_min y_Achs_Temp_CH_max]);
            xlim([0 720]);
            % Legende
            legend_sichtbar = findobj(ax11,'type','line','visible','on');
            legende_set = legend(legend_sichtbar, 'Location','southeast');
            set(legende_set, 'Interpreter','none', 'Box','off');
            % Titel
            title(['Temperaturverlauf der einzelnen Brennraumsensoren über ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspiele gemittelt']);
            hold off
        
        
        
        