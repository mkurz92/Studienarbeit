% Balken- und Scatterdiagramm
% Datum: 09.05.2019
% Markus Kurz
%
% Changelog:
% 




% --- Tab 10 - Balken- und Scatterdiagramm für Feuersteg Temperatur und Abstand ---
    % Globale Variablen in Skript einführen
        global P_Anz_gui
        global Temp_Sensor_oben_gui
        global KW_akt
        global KW_in_Mat_gui
        global ASP_akt
        global Seg_Mat_Abs_K_o_P_gui
        global FKFS_blau
        global FKFS_grau
        
        
    % Interaktive Elemente
        % Buttongroup 7 - Darzustellende Sensordaten
            global buttongroup_7
            buttongroup_7 = uibuttongroup(tab_10, 'Visible','off', 'Position',[0 0.85 .1 .08], 'BackgroundColor','white', 'SelectionChangedFcn',@Vis_Button_7_Callback);
            % Button 1 - Temperatur obere Ebene
            global button_7_1
            button_7_1 = uicontrol(buttongroup_7, 'Style', 'radiobutton', 'String','Temperatur obere Ebene', 'BackgroundColor','white', 'Units', 'normalized', 'Position',[0.05 0.5 0.8 0.4], 'HandleVisibility','off');
            % Button 2 - Temperatur untere Ebene
            global button_7_2
            button_7_2 = uicontrol(buttongroup_7, 'Style', 'radiobutton', 'String','Temperatur untere Ebene', 'BackgroundColor','white', 'Units', 'normalized', 'Position',[0.05 0.0 0.8 0.4], 'HandleVisibility','off');
            buttongroup_7.Visible = 'on';
        % Buttongroup 2 - Diagrammart
            buttongroup_2 = uibuttongroup(tab_10,'Visible','off', 'Position',[0 0.7 .1 .08], 'BackgroundColor','white', 'SelectionChangedFcn',@Vis_Button_2_Callback);
            % Button 1 - Balkendiagramm
            button_2_1 = uicontrol(buttongroup_2, 'Style', 'radiobutton', 'String','Balkendiagramm', 'BackgroundColor','white', 'Units', 'normalized', 'Position',[0.05 0.5 0.8 0.4], 'HandleVisibility','off');
            % Button 2 - Scatterdiagramm
            button_2_2 = uicontrol(buttongroup_2, 'Style', 'radiobutton', 'String','Scatterdiagramm', 'BackgroundColor','white', 'Units', 'normalized', 'Position',[0.05 0.0 0.8 0.4], 'HandleVisibility','off');
            buttongroup_2.Visible = 'on';
        
    % Koordinatensystem
        % Balkendiagramm
        global ax2
        ax2= axes(tab_10, 'Position', [0.16 0.12 0.75 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        hold on
        yyaxis 'left'
            % Temperaturebene festlegen: 1=obere, 0=untere
            global Tempebene
            Tempebene = 1;
            % Balkendiagramm plotten
            global splot_2_1
                % Temperaturdaten
                splot_2_1_vis_yData(1:P_Anz_gui) = Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
            splot_2_1 = bar(1:P_Anz_gui, splot_2_1_vis_yData, 'FaceColor', 'flat', 'BarWidth', 0.8, 'CData', FKFS_blau, 'EdgeColor', FKFS_blau);
            % Achsenbegrenzungen
            ylim([y_Achs_Temp_min y_Achs_Temp_max]);
            % Y-Achse Farbe setzen
            set(ax2,'YColor',FKFS_blau);
            % Axenbeschriftung
            ytickformat('%.0g')
            ylabel('Temperatur in °C');
        yyaxis 'right'
            % Balkendiagramm plotten
            global splot_2_2
                % Abstandsdaten
                splot_2_2_vis_yData(1:P_Anz_gui) = Seg_Mat_Abs_K_o_P_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
            splot_2_2 = bar(1:P_Anz_gui,splot_2_2_vis_yData, 'FaceColor', 'flat', 'BarWidth', 0.4, 'CData', FKFS_grau, 'EdgeColor', FKFS_grau);
            % Achsenbegrenzungen
            ylim([y_Achs_Abst_BK_min y_Achs_Abst_BK_max]);
            % Y-Achse Farbe setzen
            set(ax2,'YColor',FKFS_grau);
            % Axenbeschriftung
            ytickformat('%.0g')
            ylabel('Abstand zwischen Kolben und Buchse in µm');
        hold off
        title(['Temperatur und Abstand der oberen Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW']);
        xlabel('Temperatursensoren obere Ebene'); 
        
        % Scatterdiagramm
        global ax4
        ax4 = axes(tab_10, 'Position', [0.16 0.12 0.75 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02, 'Visible', 'off');
        title(['Temperatur über Abstand an der oberen Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW']);
        xlabel('Abstand zwischen Kolben und Buchse in µm')
        ylabel('Temperatur in °C');
        hold on
            % Scatterdiagramm plotten
            global splot_4_3
                % Abstandsdaten
                global splot_4_3_vis_xData
                splot_4_3_vis_xData(1:P_Anz_gui) = Seg_Mat_Abs_K_o_P_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
                % Temperaturdaten
                global splot_4_3_vis_yData
                splot_4_3_vis_yData(1:P_Anz_gui) = Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
            splot_4_3 = scatter(splot_4_3_vis_xData, splot_4_3_vis_yData, 'filled', 'MarkerEdgeColor', FKFS_blau, 'MarkerFaceColor', FKFS_blau, 'SizeData', 70, 'Visible', 'off');
            % Line of Best Fit plotten
            global splot_4_4
            splot_4_4 = plot(splot_4_3_vis_xData, polyval(polyfit(splot_4_3_vis_xData, splot_4_3_vis_yData, 1), splot_4_3_vis_xData), 'Color', FKFS_blau, 'LineWidth', 2, 'LineStyle', '-', 'Visible', 'off');
            % Achsenbegrenzungen
            xlim([y_Achs_Abst_BK_min y_Achs_Abst_BK_max]);
            ylim([y_Achs_Temp_min y_Achs_Temp_max]);
            % Y-Achse Farbe setzen
            set(ax4,'YColor',FKFS_blau);
        % Axenbeschriftung
        xtickformat('%.0g')
        ytickformat('%.0g')
        hold off 
        
   % Balken/Skatterdiagramm Sensornummerierung korrigieren
    set(splot_2_1, 'YData', Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:));  
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        