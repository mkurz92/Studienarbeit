% Visualisierung Temperatur einzeln
% Datum: 17.12.2018
% Markus Kurz
%
% Changelog:
% 
% 
global ASP_Beg_plot
global ASP_End_plot
global Temp_Sensor_oben_gui
global Temp_Sensor_unten_gui %#ok<NUSED>
global P_Anz_gui


% --- Tab 3 - Temperatur - ASP einzeln ---
    % Buttongroup 3 - Obere Ebene
    buttongroup_3 = uibuttongroup(tab_3, 'Visible','off', 'Position',[0 0.05 .1 .9], 'BackgroundColor','white', 'BorderType', 'none', 'SelectionChangedFcn',@Vis_Button_3_Callback);
        % Obere Ebene
        gui_6_1 = uicontrol('Parent',buttongroup_3, 'Style','text', 'Units','normalized', 'Position',[0.01 0.95 0.9 0.03], 'HorizontalAlignment', 'left', 'FontUnits','normalized', 'FontSize',0.7, 'String', 'Obere Ebene', 'BackgroundColor','white');
        for i=1:P_Anz_gui
            eval(['radio_einzeln_', num2str(i), ' = uicontrol(buttongroup_3, ''Style'', ''radiobutton'', ''UserData'', ',int2str(i), ', ''String'', ''Sensor_', int2str(i), '_o'', ''Units'', ''normalized'', ''Position'', [0.05 0.95-', int2str(i), '*0.035 0.8 0.025], ''BackgroundColor'',''white'');']);
        end
        % Untere Ebene
        gui_6_2 = uicontrol('Parent',buttongroup_3, 'Style','text', 'Units','normalized', 'Position',[0.01 0.46 0.9 0.03], 'HorizontalAlignment', 'left', 'FontUnits','normalized', 'FontSize',0.7, 'String', 'Untere Ebene', 'BackgroundColor','white');
        for i=1:P_Anz_gui
            eval(['radio_1_einzeln_', num2str(i), ' = uicontrol(buttongroup_3, ''Style'', ''radiobutton'', ''UserData'', ',int2str(i+12), ', ''String'', ''Sensor_', int2str(i), '_u'', ''Units'', ''normalized'', ''Position'', [0.05 0.45-', int2str(i), '*0.035 0.8 0.025], ''BackgroundColor'',''white'');']);
        end
    buttongroup_3.Visible = 'on';     
           
            
    % Eingabefelder
        % ASP Beginn
        global gui_6_3
        gui_6_3 = uicontrol('Parent',tab_3, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_6_4
        gui_6_4 = uicontrol('Parent',tab_3, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_6_5 = uicontrol('Parent',tab_3, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_6_6 = uicontrol('Parent',tab_3, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
            
              
    % Koordinatensystem
        global ax6
        ax6= axes(tab_3, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax6,'ColorOrder',colororder_12)
        hold on
        
        % Arbeitsspiele einzeln von einem Sensor
        global splot_6_1
        splot_6_1 = plot(x_720, Temp_Sensor_oben_gui(:,:,1), 'LineWidth', 1, 'Visible', 'on');
        % Gemittelte Arbeitsspiele von einem Sensor
        global splot_6_2
        splot_6_2 = plot(x_720, sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot, 1),2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'Color', 'black', 'DisplayName', 'Temperatursensor oben 1 gemittelt', 'UserData', 1);
        % Plot transparenz setzen
        for k=1:AnzASP
            splot_6_1(k).Color(4)=Plot_Transp;
        end
        % Zünd-OT Markierung
            splot_6_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Temp_min y_Achs_Temp_max],'k--','LineWidth',1);
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_6_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Temp_min y_Achs_Temp_max],'k--','LineWidth',1);
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_6_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Temp_min y_Achs_Temp_max],'k--','LineWidth',1);
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_6_7 = uicontrol('Parent',tab_3, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_6_8 = uicontrol('Parent',tab_3, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_6_8 = uicontrol('Parent',tab_3, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_6_7 = uicontrol('Parent',tab_3, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
        
        
        % Axenbeschriftung    
        ylabel('Temperatur in °C');
        xlabel('Kurbelwinkel in °KW');
        xtickformat('%.0g')
        ytickformat('%.0g')
        % Achsenbegrenzungen
        ylim([y_Achs_Temp_min y_Achs_Temp_max]);
        xlim([0 720]);
        % Titel
        title(['Temperaturverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
        hold off
        
        
        % Pushbutton Video
        push_2 = uicontrol('Parent',tab_3, 'Style', 'pushbutton', 'String', 'Video erstellen', 'Units','normalized', 'Position',[0.0 0.0 0.1 0.05], 'Callback', {@Vis_Pushbutton_Callback, 'Kurbelwinkel in °KW', 'Temperatur in °C'});



 




















