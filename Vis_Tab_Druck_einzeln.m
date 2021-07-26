% Visualisierung Druck gemittelt
% Datum: 17.12.2018
% Markus Kurz
%
% Changelog:
% 
% 




% --- Tab 7 - Druck - ASP einzeln ---
    % Globale Variablen in Skript einführen
        global ASP_Beg_plot
        global ASP_End_plot
        global Druck_Sensor_gui


    % Buttongroup 5
    buttongroup_5 = uibuttongroup(tab_7, 'Visible','off', 'Position',[0 0.05 .1 .9], 'BackgroundColor','white', 'BorderType', 'none', 'SelectionChangedFcn',@Vis_Button_5_Callback);
        % Drucksensoren Feuersteg
        for i=1:Drucksensor_Anz
            eval(['radio_2_einzeln_', num2str(i), ' = uicontrol(buttongroup_5, ''Style'', ''radiobutton'', ''UserData'', ',int2str(i), ', ''String'', ''', Druck_Mess_Name,  int2str(i), ''', ''Units'', ''normalized'', ''Position'', [0.05 0.985-', int2str(i), '*0.035 0.8 0.03], ''BackgroundColor'',''white'');']);
        end
        % Drucksensor Brennraum
        eval(['radio_2_einzeln_', num2str(Drucksensor_Anz+1), ' = uicontrol(buttongroup_5, ''Style'', ''radiobutton'', ''UserData'', ',int2str(Drucksensor_Anz+1), ', ''String'', ''', Druck_Mess_Name_CH, ''', ''Units'', ''normalized'', ''Position'', [0.05 0.985-', int2str(Drucksensor_Anz+1), '*0.035 0.8 0.03], ''BackgroundColor'',''white'');']);
    buttongroup_5.Visible = 'on';
    
    
    % Eingabefelder
        % ASP Beginn
        global gui_10_3
        gui_10_3 = uicontrol('Parent',tab_7, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_10_4
        gui_10_4 = uicontrol('Parent',tab_7, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_10_5 = uicontrol('Parent',tab_7, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_10_6 = uicontrol('Parent',tab_7, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        
        
    % Koordinatensystem
        global ax10
        ax10= axes(tab_7, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax10,'ColorOrder',colororder_12)
        hold on
        
        % Arbeitsspiele einzeln von einem Sensor
        global splot_10_1
        splot_10_1 = plot(x_720, Druck_Sensor_gui(:,:,1), 'LineWidth', 1, 'Visible', 'on');
        % Gemittelte Arbeitsspiele von einem Sensor
        global splot_10_2
        splot_10_2 = plot(x_720, sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot, 1),2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'Color', 'black', 'DisplayName', 'Drucksensor 1 gemittelt', 'UserData', 1);
        % Plot transparenz setzen
        for k=1:AnzASP
            splot_10_1(k).Color(4)=Plot_Transp;
        end
        % Zünd-OT Markierung
            splot_10_3 = plot([Beg_MD_KW Beg_MD_KW], [y_Achs_Druck_min y_Achs_Druck_max],'k--','LineWidth',1);
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_10_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [y_Achs_Druck_min y_Achs_Druck_max],'k--','LineWidth',1);
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_10_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [y_Achs_Druck_min y_Achs_Druck_max],'k--','LineWidth',1);
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_10_7 = uicontrol('Parent',tab_7, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_10_8 = uicontrol('Parent',tab_7, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_10_8 = uicontrol('Parent',tab_7, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_10_7 = uicontrol('Parent',tab_7, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
            
            
        % Axenbeschriftung    
        ylabel('Druck in bar');
        xlabel('Kurbelwinkel in °KW');
        xtickformat('%.0g')
        ytickformat('%.0g')
        % Achsenbegrenzungen
        ylim([y_Achs_Druck_min y_Achs_Druck_max]);
        xlim([0 720]);
        % Titel
        title(['Druckverlauf von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen eines Sensors']);
        hold off
            
        
        % Pushbutton Video
        push_4 = uicontrol('Parent',tab_7, 'Style', 'pushbutton', 'String', 'Video erstellen', 'Units','normalized', 'Position',[0.0 0.0 0.1 0.05], 'Callback', {@Vis_Pushbutton_Callback, 'Kurbelwinkel in °KW', 'Druck in bar'});
              





        
        
        
        
        
        