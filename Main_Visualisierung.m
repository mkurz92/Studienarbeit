% Visualisierung Main
% Datum: 15.11.2018
% Markus Kurz


% ----- Visualisierung der Ergebnisse -----
fprintf('Visualisierung Unterprogramm wird ausgeführt...%s\n', mfilename);

% Variablen und Berechnungen für Plot
    % Globale Variablen in Skript einführen
        global ASP_End
        % Aktueller Kurbelwinkel
        global KW_akt;
        KW_akt = ceil((Fenster_Zuend_Beg+Fenster_Zuend_End)/2);
        % Aktuelles Arbeitsspiel
        global ASP_akt;
        ASP_akt = ceil((ASP_Beg+ASP_End)/2);
        % X-Werte für Kreise
        global x
        x  = linspace(0,360);
        global KW_in_Mat_gui;
        KW_in_Mat_gui = KW_in_Mat;
        global R_Kolben_gui;
        R_Kolben_gui = R_Kolben;
        global Kolben_M_x_o_Mat_gui;
        Kolben_M_x_o_Mat_gui = Kolben_M_x_o_Mat*Plot_delta_x_faktor;
        global Kolben_M_y_o_Mat_gui;
        Kolben_M_y_o_Mat_gui = Kolben_M_y_o_Mat*Plot_delta_y_faktor;
        % Temperatursensoren Feuersteg
            global Temp_Sensor_oben_gui;
            Temp_Sensor_oben_gui = Temp_Sensor_oben;
            global Temp_Sensor_unten_gui;
            Temp_Sensor_unten_gui = Temp_Sensor_unten;
        % Abstandssensor Umrechnung von [mm] in [µm]
            global Seg_Mat_Abs_K_o_P_gui;
            Seg_Mat_Abs_K_o_P_gui = Seg_Mat_Abs_K_o_P*1000;
            global Abst_Sens_DS_oben_gui
            Abst_Sens_DS_oben_gui = Abst_Sens_DS_oben*1000;
            global Abst_Sens_DS_unten_gui
            Abst_Sens_DS_unten_gui = Abst_Sens_DS_unten*1000;
            global Abst_Sens_GDS_oben_gui
            Abst_Sens_GDS_oben_gui = Abst_Sens_GDS_oben*1000;
            global Abst_Sens_GDS_unten_gui
            Abst_Sens_GDS_unten_gui = Abst_Sens_GDS_unten*1000;
        % Drucksensor
            global Drucksensor_Anz_gui
            Drucksensor_Anz_gui = Drucksensor_Anz;
            global Druck_Sensor_gui;
            Druck_Sensor_gui = Druck_Sensor;
        global Winkel_Kolben_Mat_gui
        Winkel_Kolben_Mat_gui = Winkel_Kolben_Mat;
        Winkel_Kolben_max = max(Winkel_Kolben_Mat_gui(:));
        Winkel_Kolben_min = min(Winkel_Kolben_Mat_gui(:));
        % Maximalwert Kolbenverkippung
        Kolben_Verk_Max = max(Winkel_Kolben_Mat(:));
        Kolben_Verk_Min = min(Winkel_Kolben_Mat(:));
        global Seg_Mat_A_Fst_gui;
        Seg_Mat_A_Fst_gui = Seg_Mat_A_Fst;
        global Seg_Mat_V_Fst_gui;
        Seg_Mat_V_Fst_gui = Seg_Mat_V_Fst;
        global P_Anz_gui;
        P_Anz_gui = P_Anz;
        global Fenster_Zuend_Beg_gui;
        Fenster_Zuend_Beg_gui = Fenster_Zuend_Beg;
        global Fenster_Zuend_End_gui;
        Fenster_Zuend_End_gui = Fenster_Zuend_End;
        global Fenster_GasW_Beg_gui;
        Fenster_GasW_Beg_gui = Fenster_GasW_Beg;
        global Fenster_GasW_End_gui;
        Fenster_GasW_End_gui = Fenster_GasW_End;
        global ASP_Beg_gui;
        ASP_Beg_gui = ASP_Beg;
        global ASP_End_gui;
        ASP_End_gui = ASP_End;
        global ASP_Beg_plot
        ASP_Beg_plot = ASP_Beg;
        global ASP_End_plot
        ASP_End_plot = ASP_End;
        global Plot_D_Kolbenkrone_faktor;
        global AnzASP_gui
        AnzASP_gui = AnzASP;
        global WerteASP
        global Folder_Erg_gui
        Folder_Erg_gui = Folder_Erg;
        global Temp_Anz_pro_Lanz_gui
        Temp_Anz_pro_Lanz_gui = Temp_Anz_pro_Lanz;
        global Temp_Anz_Lanz_gui
        Temp_Anz_Lanz_gui = Temp_Anz_Lanz;
        % Brennraumtemperaturen für GUI kopieren
        global Brennraumtemp_vorhanden
        Brennraumtemp_vorhanden = zeros(Temp_Anz_pro_Lanz_gui, Temp_Anz_Lanz_gui);
        global Temp_CH_Name_gui
        Temp_CH_Name_gui = [Temp_CH_Name, 'gui_'];
        for i=1:Temp_Anz_Lanz_gui
            for k=1:Temp_Anz_pro_Lanz_gui
                if eval(['exist([''', Temp_CH_Name, int2str(k), '_', int2str(i), '''],''var'')'])
                    eval(['global ', Temp_CH_Name_gui, int2str(k), '_', int2str(i)])
                    eval([Temp_CH_Name_gui, int2str(k), '_', int2str(i), ' = ', Temp_CH_Name, int2str(k), '_', int2str(i), ';']);
                    Brennraumtemp_vorhanden(k, i) = 1;
                end
            end
        end
        % Brennraumdruck für GUI kopieren
        global Druck_Mess_Name_CH_gui
        Druck_Mess_Name_CH_gui = [Druck_Mess_Name_CH, '_gui'];
        eval(['global ', Druck_Mess_Name_CH_gui, '_0'])
        eval([Druck_Mess_Name_CH_gui, '_0 =', Druck_Mess_Name_CH, ';'])
    % X-Werte für Messdaten ein Arbeitsspiel
    x_720 = linspace(Winkelaufloesung,720,WerteASP);
    global x_720_gui
    x_720_gui = x_720;
    % Pushbutton Video erstellen Data initialisieren
    global Button_String
    Button_String = 'Sensorname_';
    global push_plotdata
    push_plotdata = Temp_Sensor_oben_gui(:,:,1);
    global temp_min
    global temp_max
    global P_Wi_0_gui
    P_Wi_0_gui = P_Wi_0;
    global P_Wi_Ab_gui
    P_Wi_Ab_gui = P_Wi_Ab;
    global P_x_gui
    P_x_gui = P_x;
    global P_y_gui
    P_y_gui = P_y;
    global Plot_D_Kolbenkrone_faktor_gui
    Plot_D_Kolbenkrone_faktor_gui = Plot_D_Kolbenkrone_faktor;

% --- Skript Aufruf - Extremwerte_y_lim
Vis_Extremwerte_y_lim;

% Fenster erzeugen
close;
fig1 = figure('Name','Auswertung', 'NumberTitle','off', 'Color','white', 'Units','normalized', 'Position',[0.05 0.05 0.9 0.85]);

% --- Skript Aufruf - Colormap_Colororder
Vis_Colormap_Colororder;

% --- Interaktive Elemente ---
    % Tabs
    tabgroup = uitabgroup(fig1, 'Position', [0 0 1 1]);
        % Thermodynamische Größen
        tab_1 = uitab(tabgroup, 'Title', 'Übersicht', 'BackgroundColor', 'w');
        % Temperatur - ASP gemittelt
        tab_2 = uitab(tabgroup, 'Title', 'TC_TL - ASP_m', 'BackgroundColor', 'w');
        % Temperatur - ASP einzeln
        tab_3 = uitab(tabgroup, 'Title', 'TC_TL - ASP_e', 'BackgroundColor', 'w');
        % Abstand - ASP gemittelt
        tab_4 = uitab(tabgroup, 'Title', 'ASM - ASP_m', 'BackgroundColor', 'w');
        % Abstand - ASP einzeln
        tab_5 = uitab(tabgroup, 'Title', 'ASM - ASP_e', 'BackgroundColor', 'w');
        % Druck - ASP gemittelt
        tab_6 = uitab(tabgroup, 'Title', 'PS - ASP_m', 'BackgroundColor', 'w');
        % Druck - ASP einzeln
        tab_7 = uitab(tabgroup, 'Title', 'PS - ASP_e', 'BackgroundColor', 'w');
        % Brennraum Temperatur - ASP gemittelt
        tab_8 = uitab(tabgroup, 'Title', 'TC_CH - ASP_m', 'BackgroundColor', 'w');
        % Brennraum Temperatur - ASP einzeln
        tab_9 = uitab(tabgroup, 'Title', 'TC_CH - ASP_e', 'BackgroundColor', 'w');
        % Balken- und Scatterdiagramm
        tab_10 = uitab(tabgroup, 'Title', 'TC_TL/ASM', 'BackgroundColor', 'w');
        % Kippwinkel Kolben
        tab_11 = uitab(tabgroup, 'Title', 'Kippwinkel', 'BackgroundColor', 'w');
    % Buttongroup 1 - Darzustellende Sensordaten
    global buttongroup_1
    buttongroup_1 = uibuttongroup(tab_1, 'Visible','off', 'Position',[0 0.85 .15 .08], 'BackgroundColor','white', 'BorderType', 'none', 'SelectionChangedFcn',@Vis_Button_1_Callback);
        % Button 1 - Temperatur obere Ebene
        global button_1_1
        button_1_1 = uicontrol(buttongroup_1, 'Style', 'radiobutton', 'String','Temperatur obere Ebene', 'BackgroundColor','white', 'Units', 'normalized', 'Position',[0.05 0.5 0.8 0.4], 'HandleVisibility','off');
        % Button 2 - Temperatur untere Ebene
        global button_1_2
        button_1_2 = uicontrol(buttongroup_1, 'Style', 'radiobutton', 'String','Temperatur untere Ebene', 'BackgroundColor','white', 'Units', 'normalized', 'Position',[0.05 0.0 0.8 0.4], 'HandleVisibility','off');
    buttongroup_1.Visible = 'on';
    % Slider
        % Slider AnzASP
        gui_1 = uicontrol('Parent',tab_1, 'Style','slider', 'Units','normalized', 'Position',[0.54 0.02 0.4 0.02], 'value',ASP_akt, 'min',1, 'max',AnzASP, 'SliderStep',[1/(AnzASP-1) 10/(AnzASP-1)], 'Callback',@Vis_Slider_ASP_Callback);
        gui_1_1 = uicontrol('Parent',tab_1, 'Style','text', 'Units','normalized', 'Position',[0.52 0.02 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','1', 'BackgroundColor','white');
        gui_1_2 = uicontrol('Parent',tab_1, 'Style','text', 'Units','normalized', 'Position',[0.94 0.02 0.03 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String',AnzASP, 'BackgroundColor','white');
        global gui_1_3;
        gui_1_3 = uicontrol('Parent',tab_1, 'Style','text', 'Units','normalized', 'Position',[0.59 0.04 0.3 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String',['Ausgewähltes Arbeitsspiel: ', num2str(ASP_akt)], 'BackgroundColor','white');
        % Slider WerteASP(=KW)
        gui_2 = uicontrol('Parent',tab_1, 'Style','slider', 'Units','normalized', 'Position',[0.06 0.02 0.4 0.02], 'value',KW_akt, 'min',1, 'max',WerteASP*Winkelaufloesung, 'SliderStep',[1/(WerteASP*Winkelaufloesung-1) 10/(WerteASP*Winkelaufloesung-1)], 'Callback',@Vis_Slider_Werte_Callback);
        gui_2_1 = uicontrol('Parent',tab_1, 'Style','text', 'Units','normalized', 'Position',[0.04 0.02 0.02 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String','1', 'BackgroundColor','white');       
        gui_2_2 = uicontrol('Parent',tab_1, 'Style','text', 'Units','normalized', 'Position',[0.46 0.02 0.03 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String',WerteASP*Winkelaufloesung, 'BackgroundColor','white'); 
        global gui_2_3;
        gui_2_3 = uicontrol('Parent',tab_1, 'Style','text', 'Units','normalized', 'Position',[0.11 0.04 0.3 0.02], 'FontUnits','normalized', 'FontSize',0.8, 'String',['Ausgewählter Kurbelwinkel: ', num2str(KW_akt), '°KW'], 'BackgroundColor','white');
    
        
     
% --- Tab 1 - Übersicht ---    
    % Draufsicht von oben auf Kolben
    global ax1;
    ax1 = axes(tab_1, 'OuterPosition', [0.0 0.15 0.75 0.75]);
    title({'Übertriebene Darstellung von Buchse und Kolben von oben';['für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW']});
    ylabel('Gegendruckseite');
    axis equal;
    axis([-R_Buchse-5 R_Buchse+5 -R_Buchse-5 R_Buchse+5]);
    hold on;
        % Äußerer Kreis
            splot_1_2 = plot(R_Buchse*sind(x),R_Buchse*cosd(x),'k', 'LineWidth', 3);
        % Segmentflächen einfärben
            % Colormap Begrenzungen nach min. und max. Werten der Sensordaten beider Ebenen auwählen
            caxis([temp_min temp_max]);
            global x_1_patch
            global y_1_patch
            x_1_patch = zeros(101, P_Anz);
            y_1_patch = zeros(101, P_Anz);
            Winkel_patch = zeros(100, P_Anz);
            global farbe_temp
            farbe_temp(1:P_Anz,1) = Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:);
            % Eckpunkte für Patches berechnen
            for k=1:P_Anz
                % Temperatursegment in 100 kleine Stücke aufteilen
                Winkel_patch(:,k) = linspace(P_Wi(k)-P_Wi_Ab/2, P_Wi(k)+P_Wi_Ab/2)';
                % X- und Y-Werte für die 100 kleinen Stücke berechnen
                x_1_patch(1:100,k) = R_Buchse*cosd(Winkel_patch(:,k));
                y_1_patch(1:100,k) = R_Buchse*sind(Winkel_patch(:,k));
                % Mittelpunkt der auszufüllenden Segmentflächen
                x_1_patch(101,k)=Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
                y_1_patch(101,k)=Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
            end
            % Segmentflächen ausfüllen
            global Seg_patch
            Seg_patch = patch(x_1_patch,y_1_patch,farbe_temp);
        % Ausgefüllten grauer Kreis um gefärbe Segmentflächen zu verdecken
            global x_2_patch
            x_2_patch = Plot_D_Kolbenkrone_faktor*R_Kolben_gui*cosd(x)+Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
            global y_2_patch
            y_2_patch = Plot_D_Kolbenkrone_faktor*R_Kolben_gui*sind(x)+Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_akt);
            global Kreis_patch
            Kreis_patch = patch(x_2_patch, y_2_patch, [120/255 120/255 120/255], 'EdgeColor', [120/255 120/255 120/255]);
        % Punkte P
            for k=1:P_Anz
                plot(P_x, P_y,'ko','MarkerSize',5,'MarkerFaceColor','k');
            end
        % Einlassventile
            splot_EV_1 = plot(0.35*R_Buchse*sind(x)-0.4*R_Buchse,0.38*R_Buchse*cosd(x)+0.47*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
            splot_EV_2 = plot(0.35*R_Buchse*sind(x)-0.4*R_Buchse,0.38*R_Buchse*cosd(x)-0.47*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
        % Auslassventile
            splot_AV_1 = plot(0.30*R_Buchse*sind(x)+0.38*R_Buchse,0.32*R_Buchse*cosd(x)+0.57*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
            splot_AV_2 = plot(0.30*R_Buchse*sind(x)+0.38*R_Buchse,0.32*R_Buchse*cosd(x)-0.57*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
        % Injektor
            splot_I = plot(0.1*R_Buchse*sind(x)-0.1*R_Buchse,0.1*R_Buchse*cosd(x),'k', 'LineWidth', 1, 'LineStyle', '--');
        % Zündkerze
            splot_Z = plot(0.13*R_Buchse*sind(x)+0.3*R_Buchse,0.15*R_Buchse*cosd(x),'k', 'LineWidth', 1, 'LineStyle', '--');
        % 1. von 360 Punkten für Näherungslösung der Flächenberechnung
            %splot_1_5 = plot(P_x_360(1), P_y_360(1),'ko','MarkerSize',3,'MarkerFaceColor','k');
        % Text für 1. und letzten Sensor
            text_Temp_1 = text(cosd(P_Wi_0)*R_Buchse*1.1, sind(P_Wi_0)*R_Buchse*1.1, 'S_1', 'FontUnits', 'normalized', 'FontSize', 0.04);
            text_Temp_end = text(cosd(P_Wi_0+(P_Anz-1)*P_Wi_Ab)*R_Buchse*1.1, sind(P_Wi_0+(P_Anz-1)*P_Wi_Ab)*R_Buchse*1.1, ['S_{', num2str(P_Anz), '}'], 'FontUnits', 'normalized', 'FontSize', 0.04);
    % Axenbeschriftung
        xtickformat('%.0g mm')
        ytickformat('%.0g mm')
    % Colorbar mit Einheiten
        cbar_handle = colorbar;
        % title(cbar_handle,'°C');
        cbar_ylabel = get(cbar_handle,'YTickLabel');
        cbar_mm = cellstr(repmat(' °C',size(cbar_ylabel,1),1));
        cbar_ylabel = strcat(cbar_ylabel, cbar_mm);
        set(cbar_handle,'YTickLabel',cbar_ylabel);
    hold off;

    % Tabelle
    format short
    global data
        % Reihen benennen
        T_table = cell(1, P_Anz_gui);
        for k=1:P_Anz_gui
            T_table{k} = ['Segment_', int2str(k)];
            eval(['rowname{', int2str(k), '} = T_table{', int2str(k), '};']);
        end
        % Temperatur obere Ebene
        data = cell(P_Anz_gui, 5);
        data(:,1) = num2cell(ceil(Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:)));
        % Temperatur untere Ebene
        data(:,2) = num2cell(ceil(Temp_Sensor_unten_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:)));
        % Abstandswerte
        data(:,3) = num2cell(ceil(Seg_Mat_Abs_K_o_P_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:)));
        % Segmentflächen
        data(:,4) = num2cell(Seg_Mat_A_Fst_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:), 2);
        % Segmentvolumen
        data(:,5) = num2cell(Seg_Mat_V_Fst_gui(KW_akt*KW_in_Mat_gui,ASP_akt,:), 2);
        
        % Spalten benennen
        columnname = {'T_o [°C]', 'T_u [°C]', 'Abs_K-B [µm]', 'A_Seg [mm^2]', 'V_Seg [mm^3]'};
        columnformat = {'numeric', 'numeric', 'numeric', 'numeric', 'numeric'};
        global gui_3
        gui_3 = uitable(tab_1, 'Data', data, 'ColumnName', columnname, 'ColumnFormat', columnformat, 'RowName', rowname, 'Units', 'normalized', 'Position',[0.65 0.12 0.3 0.3]);
    
        
    
    % Pushbutton Video KW
    push_0 = uicontrol('Parent',tab_1, 'Style', 'pushbutton', 'String', 'Video über °KW erstellen', 'Units','normalized', 'Position',[0.0 0.15 0.1 0.05], 'Callback', {@Vis_Pushbutton_Draufsicht_Callback, 1, Fenster_Zuend_Beg, Fenster_Zuend_End, R_Buchse});     
    % Pushbutton Video ASP
    push_1 = uicontrol('Parent',tab_1, 'Style', 'pushbutton', 'String', 'Video über ASP erstellen', 'Units','normalized', 'Position',[0.0 0.1 0.1 0.05], 'Callback', {@Vis_Pushbutton_Draufsicht_Callback, 0, ASP_Beg, ASP_End, R_Buchse});

        
        
        
        
% --- Skript Aufruf - Tab 2 - Temperatur - ASP gemittelt ---
Vis_Tab_Temperatur_gemittelt;
    
% --- Skript Aufruf - Tab 3 - Temperatur - ASP einzeln ---    
Vis_Tab_Temperatur_einzeln;    

% --- Skript Aufruf - Tab 4 - Abstand - ASP gemittelt ---
Vis_Tab_Abstand_gemittelt;

% --- Skript Aufruf - Tab 5 - Abstand - ASP einzeln ---
Vis_Tab_Abstand_einzeln;

% --- Skript Aufruf - Tab 6 - Druck - ASP gemittelt ---
Vis_Tab_Druck_gemittelt;

% --- Skript Aufruf - Tab 7 - Druck - ASP gemittelt ---
Vis_Tab_Druck_einzeln;

% --- Skript Aufruf - Tab 8 - Brennraum - Temperatur - ASP gemittelt ---
Vis_Tab_Brennraum_Temperatur_gemittelt;
    
% --- Skript Aufruf - Tab 9 - Brennraum - Temperatur - ASP einzeln ---
Vis_Tab_Brennraum_Temperatur_einzeln;

% --- Skript Aufruf - Tab 10 - Balken- und Scatterdiagramm für Feuersteg Temperatur und Abstand ---
Vis_Tab_Balk_Scat;
    
% --- Skript Aufruf - Tab 11 - Kippwinkel Kolben ---
Vis_Tab_Kippwinkel;


