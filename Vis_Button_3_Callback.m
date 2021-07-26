% Funktion - Radiobutton Temperatur einzeln Callback
function Vis_Button_3_Callback(~, event)
    % Global Variablen
    global splot_6_1
    global splot_6_2
    global Temp_Sensor_oben_gui
    global Temp_Sensor_unten_gui
    global P_Anz_gui
    global ASP_Beg_plot
    global ASP_End_plot
    global push_plotdata
    global Button_String

    selecRadioButt = event.NewValue.UserData;
    Button_String = event.NewValue.String;
    
    if selecRadioButt <= P_Anz_gui
        % Arbeitsspiele einzeln von einem Sensor
        set(splot_6_1, {'YData'}, num2cell(Temp_Sensor_oben_gui(:,:,selecRadioButt)',2));
        % Video Daten setzen
        push_plotdata = Temp_Sensor_oben_gui(:,:,selecRadioButt);
        % Gemittelte Arbeitsspiele von einem Sensor
        set(splot_6_2, 'YData', sum(Temp_Sensor_oben_gui(:, ASP_Beg_plot:ASP_End_plot, selecRadioButt),2)/(ASP_End_plot-ASP_Beg_plot+1));
        set(splot_6_2, 'UserData', selecRadioButt);
    elseif selecRadioButt > P_Anz_gui
        % Arbeitsspiele einzeln von einem Sensor
        set(splot_6_1, {'YData'}, num2cell(Temp_Sensor_unten_gui(:,:,selecRadioButt-12)',2));
        % Video Daten setzen
        push_plotdata = Temp_Sensor_unten_gui(:,:,selecRadioButt-12);
        % Gemittelte Arbeitsspiele von einem Sensor
        set(splot_6_2, 'YData', sum(Temp_Sensor_unten_gui(:, ASP_Beg_plot:ASP_End_plot, selecRadioButt-12),2)/(ASP_End_plot-ASP_Beg_plot+1));
        set(splot_6_2, 'UserData', selecRadioButt);
    end
end
