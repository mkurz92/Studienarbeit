% Funktion - Vis_Pushbutton_Callback Callback
function Vis_Pushbutton_Callback(~, ~, xlabel_string, ylabel_string)
    % Global Variablen
    global x_720_gui
    global push_plotdata
    global ASP_Beg_plot
    global ASP_End_plot
    global Folder_Erg_gui
    global Button_String
    
    Fenster_fuer_Video = figure('Units', 'pixels', 'Position', [50 100 1820 620], 'Color','white');
    axes('Units', 'normalized', 'Position', [0.04 0.08 0.92 0.85])
    xlabel(xlabel_string);
    ylabel(ylabel_string);
    N = ASP_End_plot-ASP_Beg_plot+1;
    % Speicher für Bilder initialisieren
    F = struct('cdata', cell(1,N), 'colormap', cell(1,N));
    for i = ASP_Beg_plot:ASP_End_plot
        figure(Fenster_fuer_Video)  
        hold on
        plot(x_720_gui,push_plotdata(:,i), 'LineWidth', 1)
        % Titel
        title([num2str(i),' Arbeitsspiele']);
        F(i) = getframe(gcf) ;
    end
    
    % create the video writer
    writerObj = VideoWriter([Folder_Erg_gui, '\', Button_String, '_', datestr(now,'yyyymmdd_HHMMSS'), '.avi'],'MPEG-4');
    % FPS setzen
    writerObj.FrameRate = (ASP_End_plot-ASP_Beg_plot+1)/10;
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
