% Visualisierung Brennraum - Temperatur einzeln
% Datum: 22.04.2019
% Markus Kurz
%
% Changelog:
% 
% 



% --- Tab 9 - Brennraum - Temperatur - ASP gemittelt ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Temp_Anz_Lanz_gui
        global Temp_Anz_pro_Lanz_gui
        global Temp_CH_Name_gui

        
    % Buttongroup 6
    buttongroup_6 = uibuttongroup(tab_9, 'Visible','off', 'Position',[0 0.05 .1 .9], 'BackgroundColor','white', 'BorderType', 'none', 'SelectionChangedFcn',@Vis_Button_6_Callback);
        % Temperatursensoren
        tab_9_zaehler = 1;
        for i=1:Temp_Anz_Lanz_gui
            for k=1:Temp_Anz_pro_Lanz_gui
                if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                    eval(['radio_CH_', num2str(tab_9_zaehler), ' = uicontrol(buttongroup_6, ''Style'', ''radiobutton'', ''UserData'', {',int2str(k),',', int2str(i),'}, ''String'', ''',Temp_CH_Name, int2str(k), '_', int2str(i), ''', ''Units'', ''normalized'', ''Position'', [0.05 0.95-', int2str(tab_9_zaehler), '*0.035 0.8 0.025], ''BackgroundColor'',''white'');']);
                    tab_9_zaehler = tab_9_zaehler + 1;
                end
            end
        end
    buttongroup_6.Visible = 'on';


    % Eingabefelder
        % ASP Beginn
        global gui_12_3
        gui_12_3 = uicontrol('Parent',tab_9, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_12_4
        gui_12_4 = uicontrol('Parent',tab_9, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_12_5 = uicontrol('Parent',tab_9, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_12_6 = uicontrol('Parent',tab_9, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        
        
    % Koordinatensystem
        global ax12
        ax12= axes(tab_9, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax12,'ColorOrder',colororder_12)
        hold on
        
        
        % Arbeitsspiele einzeln von einem Sensor
        global splot_12_1
        for i=1:Temp_Anz_Lanz_gui
            break_flag = 0;
            for k=1:Temp_Anz_pro_Lanz_gui
                if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                    eval(['splot_12_1 = plot(x_720, ', Temp_CH_Name, int2str(k), '_', int2str(i), '(:,:), ''LineWidth'', 1, ''Visible'', ''on'');']);
                    break_flag = 1;
                    break
                end
            end
            if break_flag == 1
                break
            end
        end
        % Gemittelte Arbeitsspiele von einem Sensor
        global splot_12_2 %#ok<NUSED>
        for i=1:Temp_Anz_Lanz_gui
            break_flag = 0;
            for k=1:Temp_Anz_pro_Lanz_gui
                if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                    eval(['splot_12_2 = plot(x_720, sum(', Temp_CH_Name_gui, int2str(k), '_', int2str(i), '(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1), ''LineWidth'', 2, ''Color'', ''black'', ''Visible'', ''on'', ''DisplayName'', [''', Temp_CH_Name, int2str(k), '_', int2str(i), '''], ''UserData'', {',int2str(k),',', int2str(i),'});']);
                    break_flag = 1;
                    break
                end
            end
            if break_flag == 1
                break
            end
        end
        % Plot transparenz setzen
        for k=1:AnzASP
            splot_12_1(k).Color(4)=Plot_Transp;
        end
        % Zünd-OT Markierung
            splot_12_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Temp_CH_min y_Achs_Temp_CH_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_12_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Temp_CH_min y_Achs_Temp_CH_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_12_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Temp_CH_min y_Achs_Temp_CH_max],'k--','LineWidth',1, 'HandleVisibility', 'off');
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_12_7 = uicontrol('Parent',tab_9, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_12_8 = uicontrol('Parent',tab_9, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_12_8 = uicontrol('Parent',tab_9, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_12_7 = uicontrol('Parent',tab_9, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
            
            % Axenbeschriftung    
            ylabel('Temperatur in °C');
            xlabel('Kurbelwinkel in °KW');
            xtickformat('%.0g')
            ytickformat('%.0g')
            % Achsenbegrenzungen
            ylim([y_Achs_Temp_CH_min y_Achs_Temp_CH_max]);
            xlim([0 720]);
            % Titel
            title(['Temperaturverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
            hold off
        
        
            % Pushbutton Video
            push_5 = uicontrol('Parent',tab_9, 'Style', 'pushbutton', 'String', 'Video erstellen', 'Units','normalized', 'Position',[0.0 0.0 0.1 0.05], 'Callback', {@Vis_Pushbutton_Callback, 'Kurbelwinkel in °KW', 'Temperatur in °C'});
        
        