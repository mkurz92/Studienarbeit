% Visualisierung Temperatur einzeln
% Datum: 17.12.2018
% Markus Kurz
%
% Changelog:
% 
% 



% --- Tab 5 - Temperatur - ASP einzeln ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Abst_Sens_DS_oben_gui
        

    % Buttongroup 4
    buttongroup_4 = uibuttongroup(tab_5, 'Visible','off', 'Position',[0 0.05 .1 .9], 'BackgroundColor','white', 'BorderType', 'none', 'SelectionChangedFcn',@Vis_Button_4_Callback);
        % Abstandssensoren
        Abst_Sens_DS_oben_gui_radio = uicontrol(buttongroup_4, 'Style', 'radiobutton', 'UserData', 1, 'String', 'Druckseite oben', 'Units', 'normalized', 'Position',[0.05 0.95 0.8 0.03], 'BackgroundColor','white');
        Abst_Sens_GDS_oben_gui_radio = uicontrol(buttongroup_4, 'Style', 'radiobutton', 'UserData', 2, 'String', 'Gegendruckseite oben', 'Units', 'normalized', 'Position',[0.05 0.915 0.8 0.03], 'BackgroundColor','white');
        Abst_Sens_DS_unten_gui_radio = uicontrol(buttongroup_4, 'Style', 'radiobutton', 'UserData', 3, 'String', 'Druckseite unten', 'Units', 'normalized', 'Position',[0.05 0.88 0.8 0.03], 'BackgroundColor','white');
        Abst_Sens_GDS_unten_gui_radio = uicontrol(buttongroup_4, 'Style', 'radiobutton', 'UserData', 4, 'String', 'Gegendruckseite unten', 'Units', 'normalized', 'Position',[0.05 0.845 0.8 0.03], 'BackgroundColor','white');
    buttongroup_4.Visible = 'on';        
            
    
    % Eingabefelder
        % ASP Beginn
        global gui_8_3
        gui_8_3 = uicontrol('Parent',tab_5, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_8_4
        gui_8_4 = uicontrol('Parent',tab_5, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_8_5 = uicontrol('Parent',tab_5, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_8_6 = uicontrol('Parent',tab_5, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
            
              
    % Koordinatensystem
        global ax8
        ax8= axes(tab_5, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax8,'ColorOrder',colororder_12)
        hold on
        
        % Arbeitsspiele einzeln von einem Sensor
        global splot_8_1
        splot_8_1 = plot(x_720, Abst_Sens_DS_oben_gui(:,:), 'LineWidth', 1, 'Visible', 'on');
        % Gemittelte Arbeitsspiele von einem Sensor
        global splot_8_2
        splot_8_2 = plot(x_720, sum(Abst_Sens_DS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'Color', 'black', 'DisplayName', 'Druckseite oben gemittelt', 'UserData', 1);
        % Plot transparenz setzen
        for k=1:AnzASP
            splot_8_1(k).Color(4)=Plot_Transp;
        end
        % Zünd-OT Markierung
            splot_8_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Abst_min y_Achs_Abst_max],'k--','LineWidth',1);
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_8_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Abst_min y_Achs_Abst_max],'k--','LineWidth',1);
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_8_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Abst_min y_Achs_Abst_max],'k--','LineWidth',1);
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_8_7 = uicontrol('Parent',tab_5, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_8_8 = uicontrol('Parent',tab_5, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_8_8 = uicontrol('Parent',tab_5, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_8_7 = uicontrol('Parent',tab_5, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
        
        
        % Axenbeschriftung    
        ylabel('Abstand in µm');
        xlabel('Kurbelwinkel in °KW');
        xtickformat('%.0g')
        ytickformat('%.0g')
        % Achsenbegrenzungen
        ylim([y_Achs_Abst_min y_Achs_Abst_max]);
        xlim([0 720]);
        % Titel
        title(['Abstandsverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
        hold off

        
        % Pushbutton Video
        push_3 = uicontrol('Parent',tab_5, 'Style', 'pushbutton', 'String', 'Video erstellen', 'Units','normalized', 'Position',[0.0 0.0 0.1 0.05], 'Callback', {@Vis_Pushbutton_Callback, 'Kurbelwinkel in °KW', 'Abstand in µm'});























