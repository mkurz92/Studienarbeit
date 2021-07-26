% Funktion - Radiobutton Druck einzeln Callback
function Vis_Button_5_Callback(~, event)
    % Global Variablen
    global splot_10_1
    global splot_10_2
    global Drucksensor_Anz_gui
    global Druck_Mess_Name_CH_gui
    global Druck_Sensor_gui
    global ASP_Beg_plot
    global ASP_End_plot
    eval(['global ', Druck_Mess_Name_CH_gui, '_0'])
    global push_plotdata
    global Button_String

    selecRadioButt = event.NewValue.UserData;
    Button_String = event.NewValue.String;
    
    % Drucksensoren im Feuersteg
    if selecRadioButt <= Drucksensor_Anz_gui
        set(splot_10_1, {'YData'}, num2cell(Druck_Sensor_gui(:,:,selecRadioButt)',2));
        set(splot_10_2, 'YData', sum(Druck_Sensor_gui(:, ASP_Beg_plot:ASP_End_plot, selecRadioButt),2)/(ASP_End_plot-ASP_Beg_plot+1));
        set(splot_10_2, 'UserData', selecRadioButt);
        % Video Daten setzen
        push_plotdata = Druck_Sensor_gui(:,:,selecRadioButt);
    % Drucksensor im Brennraum
    elseif selecRadioButt > Drucksensor_Anz_gui
        eval(['set(splot_10_1, {''YData''}, num2cell(',Druck_Mess_Name_CH_gui, '_0(:,:)'',2));']);
        eval(['set(splot_10_2, ''YData'', sum(',Druck_Mess_Name_CH_gui, '_0(:,ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));']);
        set(splot_10_2, 'UserData', selecRadioButt);
        % Video Daten setzen
        eval(['push_plotdata = ',Druck_Mess_Name_CH_gui, '_0(:,:);']);
    end
end
