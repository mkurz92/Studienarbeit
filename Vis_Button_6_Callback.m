% Funktion - Radiobutton Brennraum Temperatur einzeln Callback
function Vis_Button_6_Callback(~, event)
    % Global Variablen
    global splot_12_1 %#ok<NUSED>
    global splot_12_2
    global ASP_Beg_plot %#ok<NUSED>
    global ASP_End_plot %#ok<NUSED>
    global Temp_CH_Name_gui
    global Temp_Anz_Lanz_gui
    global Temp_Anz_pro_Lanz_gui
    global Brennraumtemp_vorhanden
    global push_plotdata %#ok<NUSED>
    global Button_String

    selecRadioButt = event.NewValue.UserData;
    selecRadioButtMat = cell2mat(selecRadioButt);
    Button_String = event.NewValue.String;
    
        % Arbeitsspiele einzeln von einem Sensor
        for i=1:Temp_Anz_Lanz_gui
            for k=1:Temp_Anz_pro_Lanz_gui
                if Brennraumtemp_vorhanden(k, i) == 1
                    eval(['global ', Temp_CH_Name_gui, int2str(k), '_', int2str(i)])
                end
            end
        end
        eval(['set(splot_12_1, {''YData''}, num2cell(', Temp_CH_Name_gui, int2str(selecRadioButtMat(1,1)), '_', int2str(selecRadioButtMat(1,2)), '(:,:)'',2));'])
        % Gemittelte Arbeitsspiele von einem Sensor
        eval(['set(splot_12_2, ''YData'', sum(', Temp_CH_Name_gui, int2str(selecRadioButtMat(1,1)), '_', int2str(selecRadioButtMat(1,2)), '(:, ASP_Beg_plot:ASP_End_plot), 2)/(ASP_End_plot-ASP_Beg_plot+1));']);
        set(splot_12_2, 'UserData', {selecRadioButtMat(1,1), selecRadioButtMat(1,2)});
    % Video Daten setzen
    eval(['push_plotdata = ', Temp_CH_Name_gui, int2str(selecRadioButtMat(1,1)), '_', int2str(selecRadioButtMat(1,2)), '(:,:);'])
end
