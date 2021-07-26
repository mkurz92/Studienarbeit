% Kippwinkel Kolben
% Datum: 10.05.2019
% Markus Kurz
%
% Changelog:
% 



% --- Tab 11 - Balken- und Scatterdiagramm für Feuersteg Temperatur und Abstand ---
    % Globale Variablen in Skript einführen
        global FKFS_blau
        global Winkel_Kolben_Mat_gui
        global ASP_Beg_plot
        global ASP_End_plot
        
        
        
     % Eingabefelder
        % ASP Beginn
        global gui_13_3
        gui_13_3 = uicontrol('Parent',tab_11, 'Style','edit', 'Units','normalized', 'Position',[0.45 0.01 0.05 0.03], 'String', ASP_Beg_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_Beg_Callback);
        % ASP Ende
        global gui_13_4
        gui_13_4 = uicontrol('Parent',tab_11, 'Style','edit', 'Units','normalized', 'Position',[0.65 0.01 0.05 0.03], 'String', ASP_End_plot, 'FontUnits','normalized', 'FontSize',0.55, 'BackgroundColor','white', 'Callback', @Vis_ASP_End_Callback);
        % Eingabefelder Beschriftung
        gui_13_5 = uicontrol('Parent',tab_11, 'Style','text', 'Units','normalized', 'Position',[0.45 0.04 0.05 0.03], 'String', 'ASP Beginn', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');
        gui_13_6 = uicontrol('Parent',tab_11, 'Style','text', 'Units','normalized', 'Position',[0.65 0.04 0.05 0.03], 'String', 'ASP Ende', 'FontUnits','normalized', 'FontSize',0.5, 'BackgroundColor','white');   
        
        

    % Koordinatensystem
        global ax13
        ax13= axes(tab_11, 'Position', [0.16 0.12 0.81 0.8], 'FontUnits', 'normalized', 'FontSize', 0.02);
        set(ax13,'ColorOrder',colororder_12)
        hold on
        
        % Verkippwinkel ausgewähltes Arbeitsspiel
        global splot_13_1
        splot_13_1 = plot(x_720, sum(Winkel_Kolben_Mat_gui(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1), 'LineWidth', 2, 'Color', FKFS_blau);


        % Zünd-OT Markierung
            splot_13_3 = plot([Beg_MD_KW Beg_MD_KW], [floor(Winkel_Kolben_min) ceil(Winkel_Kolben_max)],'k--','LineWidth',1, 'HandleVisibility', 'off');
        % Gaswechsel-OT Markierung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                splot_13_4 = plot([Beg_MD_KW+360 Beg_MD_KW+360], [floor(Winkel_Kolben_min) ceil(Winkel_Kolben_max)],'k--','LineWidth',1, 'HandleVisibility', 'off');
            % Gaswechsel-OT vor Zünd-OT
            else
                splot_13_4 = plot([Beg_MD_KW-360 Beg_MD_KW-360], [floor(Winkel_Kolben_min) ceil(Winkel_Kolben_max)],'k--','LineWidth',1, 'HandleVisibility', 'off');
            end
        % Gaswechsel-OT und Zünd-OT Beschriftung
            % Gaswechsel-OT nach Zünd-OT
            if (Beg_MD_KW < 360)
                gui_13_7 = uicontrol('Parent',tab_11, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_13_8 = uicontrol('Parent',tab_11, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            % Gaswechsel-OT vor Zünd-OT
            else
                gui_13_8 = uicontrol('Parent',tab_11, 'Style','text', 'Units','normalized', 'Position',[0.35 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','GOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
                gui_13_7 = uicontrol('Parent',tab_11, 'Style','text', 'Units','normalized', 'Position',[0.759 0.095 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','ZOT', 'BackgroundColor','white', 'HorizontalAlignment', 'center');
            end
        title(['Verkippwinkel des Kolbens im Bereich der Fensterung von ', num2str(ASP_End_plot-ASP_Beg_plot+1),' Arbeitsspielen']);
        xlabel('Kurbelwinkel in °KW');
        ylabel({'Verkippung zur GDS | Verkippung zur DS';'in °'});
        axis([0 720 Kolben_Verk_Min Kolben_Verk_Max]);
        hold off























