% Funktion - Vis_Pushbutton_Draufsicht_Callback Callback
function Vis_Pushbutton_Draufsicht_Callback(~,~, Auswahl, ASP_KW_Beg, ASP_KW_End, R_Buchse)
    % Global Variablen
    global Folder_Erg_gui
    global Button_String
    global x
    global x_1_patch
    global y_1_patch
    global farbe_temp
    global KW_akt
    global ASP_akt
    global KW_in_Mat_gui
    global Kolben_M_x_o_Mat_gui
    global Kolben_M_y_o_Mat_gui
    global P_Anz_gui
    global Temp_Sensor_unten_gui
    global Temp_Sensor_oben_gui
    global Tempebene
    global temp_min
    global temp_max
    global P_Wi_0_gui
    global P_Wi_Ab_gui
    global P_x_gui
    global P_y_gui
    global Plot_D_Kolbenkrone_faktor_gui
    global R_Kolben_gui
    
    
    Fenster_fuer_Video = figure('Units', 'pixels', 'Position', [50 100 1820 620], 'Color','white');
    axes('Units', 'normalized', 'Position', [0.04 0.08 0.92 0.85])
    ylabel('Gegendruckseite');
    axis equal;
    axis([-R_Buchse-5 R_Buchse+5 -R_Buchse-5 R_Buchse+5]);
    % Axenbeschriftung
        xtickformat('%.0g mm')
        ytickformat('%.0g mm')
    hold on;
    caxis([temp_min temp_max]);
    % Colormap
        colormap_rot_seq = [255,247,236
                        254,232,200
                        253,212,158
                        253,187,132
                        252,141,89
                        239,101,72
                        215,48,31
                        179,0,0
                        127,0,0]/255;
        colormap(colormap_rot_seq)
    % Colorbar mit Einheiten
        cbar_handle = colorbar;
        % title(cbar_handle,'°C');
        cbar_ylabel = get(cbar_handle,'YTickLabel');
        cbar_mm = cellstr(repmat(' °C',size(cbar_ylabel,1),1));
        cbar_ylabel = strcat(cbar_ylabel, cbar_mm);
        set(cbar_handle,'YTickLabel',cbar_ylabel);
    
    N = ASP_KW_Beg-ASP_KW_End+1;
    % Speicher für Bilder initialisieren
    F = struct('cdata', cell(1,N), 'colormap', cell(1,N));
    
    % Unveränderte Darstellungen plotten
        % Äußerer Kreis
            plot(R_Buchse*sind(x),R_Buchse*cosd(x),'k', 'LineWidth', 3);
        % Segmentflächen ausfüllen
            x_1_patch_video = x_1_patch;
            y_1_patch_video = y_1_patch;
            if Auswahl == 0
                % Mittelpunkt der auszufüllenden Segmentflächen
                for k=1:P_Anz_gui
                    x_1_patch_video(101,k)=Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_KW_Beg);
                    y_1_patch_video(101,k)=Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_KW_Beg);
                end
                Seg_patch_video = patch(x_1_patch_video,y_1_patch_video,farbe_temp);
                % Ausgefüllten grauer Kreis um gefärbe Segmentflächen zu verdecken
                x_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*cosd(x)+Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_KW_Beg);
                y_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*sind(x)+Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,ASP_KW_Beg);
                Kreis_patch = patch(x_2_patch, y_2_patch, [120/255 120/255 120/255], 'EdgeColor', [120/255 120/255 120/255]);
            elseif Auswahl == 1
                % Mittelpunkt der auszufüllenden Segmentflächen
                for k=1:P_Anz_gui
                    x_1_patch_video(101,k)=Kolben_M_x_o_Mat_gui(ASP_KW_Beg*KW_in_Mat_gui,ASP_akt);
                    y_1_patch_video(101,k)=Kolben_M_y_o_Mat_gui(ASP_KW_Beg*KW_in_Mat_gui,ASP_akt);
                end
                Seg_patch_video = patch(x_1_patch_video,y_1_patch_video,farbe_temp);
                % Ausgefüllten grauer Kreis um gefärbe Segmentflächen zu verdecken
                x_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*cosd(x)+Kolben_M_x_o_Mat_gui(ASP_KW_Beg*KW_in_Mat_gui,ASP_akt);
                y_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*sind(x)+Kolben_M_y_o_Mat_gui(ASP_KW_Beg*KW_in_Mat_gui,ASP_akt);
                Kreis_patch = patch(x_2_patch, y_2_patch, [120/255 120/255 120/255], 'EdgeColor', [120/255 120/255 120/255]);
            else
            end
            
        
        % Einlassventile
            plot(0.35*R_Buchse*sind(x)-0.4*R_Buchse,0.38*R_Buchse*cosd(x)+0.47*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
            plot(0.35*R_Buchse*sind(x)-0.4*R_Buchse,0.38*R_Buchse*cosd(x)-0.47*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
        % Auslassventile
            plot(0.30*R_Buchse*sind(x)+0.38*R_Buchse,0.32*R_Buchse*cosd(x)+0.57*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
            plot(0.30*R_Buchse*sind(x)+0.38*R_Buchse,0.32*R_Buchse*cosd(x)-0.57*R_Buchse,'k', 'LineWidth', 1, 'LineStyle', '--');
        % Injektor
            splot_I = plot(0.1*R_Buchse*sind(x)-0.1*R_Buchse,0.1*R_Buchse*cosd(x),'k', 'LineWidth', 1, 'LineStyle', '--');
        % Zündkerze
            splot_Z = plot(0.13*R_Buchse*sind(x)+0.3*R_Buchse,0.15*R_Buchse*cosd(x),'k', 'LineWidth', 1, 'LineStyle', '--');
        % Punkte P
            for k=1:P_Anz_gui
                plot(P_x_gui, P_y_gui,'ko','MarkerSize',5,'MarkerFaceColor','k');
            end
        % Text für 1. und letzten Sensor
            text(cosd(P_Wi_0_gui)*R_Buchse*1.1, sind(P_Wi_0_gui)*R_Buchse*1.1, 'S_1', 'FontUnits', 'normalized', 'FontSize', 0.04);
            text(cosd(P_Wi_0_gui+(P_Anz_gui-1)*P_Wi_Ab_gui)*R_Buchse*1.1, sind(P_Wi_0_gui+(P_Anz_gui-1)*P_Wi_Ab_gui)*R_Buchse*1.1, ['S_{', num2str(P_Anz_gui), '}'], 'FontUnits', 'normalized', 'FontSize', 0.04);
                
                
    Zaehler_video = 0;
    for i = ASP_KW_Beg:ASP_KW_End
        % Über Arbeitsspiele
        if Auswahl == 0
        % Segmentflächen einfärben
            % Mittelpunkt der auszufüllenden Segmentflächen aktualisieren
            x_1_patch_video(101,:)=Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,i);
            y_1_patch_video(101,:)=Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,i);
            % X-Werte und Y-Werte für auszufüllenden Segmentflächen aktualisieren
            set(Seg_patch_video, 'XData', x_1_patch_video);
            set(Seg_patch_video, 'YData', y_1_patch_video);
            % Titel
            title([num2str(i),'. Arbeitsspiel']);
            % Patch Farben für Sensorwerte anpassen
            if Tempebene == 1
                farbe_temp(:,1) = Temp_Sensor_oben_gui(KW_akt*KW_in_Mat_gui,i,:);
                set(Seg_patch_video, 'CData', farbe_temp);
                % Dateiname Video
                Button_String = 'Obere Temperaturebene';
            elseif Tempebene == 0
                farbe_temp(:,1) = Temp_Sensor_unten_gui(KW_akt*KW_in_Mat_gui,i,:);
                set(Seg_patch_video, 'CData', farbe_temp);  
                % Dateiname Video
                Button_String = 'Untere Temperaturebene';
            else
            end
            % Ausgefüllten grauer Kreis um gefärbe Segmentflächen zu verdecken
            % X-Werte und Y-Werte für ausgefüllten Kreis neu berechnen
            x_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*cosd(x)+Kolben_M_x_o_Mat_gui(KW_akt*KW_in_Mat_gui,i);
            y_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*sind(x)+Kolben_M_y_o_Mat_gui(KW_akt*KW_in_Mat_gui,i);
            % X-Werte und Y-Werte für ausgefüllten Kreis aktualisieren
            set(Kreis_patch, 'XData', x_2_patch);
            set(Kreis_patch, 'YData', y_2_patch);
        % Über °KW
        elseif Auswahl == 1
            % Segmentflächen einfärben
            % Mittelpunkt der auszufüllenden Segmentflächen aktualisieren
            x_1_patch_video(101,:)=Kolben_M_x_o_Mat_gui(i*KW_in_Mat_gui,ASP_akt);
            y_1_patch_video(101,:)=Kolben_M_y_o_Mat_gui(i*KW_in_Mat_gui,ASP_akt);
            % X-Werte und Y-Werte für auszufüllenden Segmentflächen aktualisieren
            set(Seg_patch_video, 'XData', x_1_patch_video);
            set(Seg_patch_video, 'YData', y_1_patch_video);
            % Titel
            title([num2str(i),'°KW']);
            % Patch Farben für Sensorwerte anpassen
            if Tempebene == 1
                farbe_temp(:,1) = Temp_Sensor_oben_gui(i*KW_in_Mat_gui,ASP_akt,:);
                set(Seg_patch_video, 'CData', farbe_temp);
                % Dateiname Video
                Button_String = 'Obere Temperaturebene';
            elseif Tempebene == 0
                farbe_temp(:,1) = Temp_Sensor_unten_gui(i*KW_in_Mat_gui,ASP_akt,:);
                set(Seg_patch_video, 'CData', farbe_temp);  
                % Dateiname Video
                Button_String = 'Untere Temperaturebene';
            else
            end
            % Ausgefüllten grauer Kreis um gefärbe Segmentflächen zu verdecken
            % X-Werte und Y-Werte für ausgefüllten Kreis neu berechnen
            x_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*cosd(x)+Kolben_M_x_o_Mat_gui(i*KW_in_Mat_gui,ASP_akt);
            y_2_patch = Plot_D_Kolbenkrone_faktor_gui*R_Kolben_gui*sind(x)+Kolben_M_y_o_Mat_gui(i*KW_in_Mat_gui,ASP_akt);
            % X-Werte und Y-Werte für ausgefüllten Kreis aktualisieren
            set(Kreis_patch, 'XData', x_2_patch);
            set(Kreis_patch, 'YData', y_2_patch);
        else
        end 
        
        
        Zaehler_video = Zaehler_video+1;
        F(Zaehler_video) = getframe(gcf);
    end
    
    % create the video writer
    writerObj = VideoWriter([Folder_Erg_gui, '\', Button_String, '_', datestr(now,'yyyymmdd_HHMMSS'), '.avi'],'MPEG-4');
    % FPS setzen
    writerObj.FrameRate = (ASP_KW_End-ASP_KW_Beg+1)/10;
    % open the video writer
    open(writerObj);
    % write the frames to the video
    for i=1:length(F)
        % convert the image to a frame
        frame = F(i) ;    
        writeVideo(writerObj, frame);
    end
    % close the writer object
    close(writerObj);
    close(Fenster_fuer_Video);
end

