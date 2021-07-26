% Funktion - Radiobutton Abstand einzeln Callback
function Vis_Button_4_Callback(~, event)
    % Global Variablen
    global splot_8_1
    global splot_8_2
    global Abst_Sens_DS_oben_gui
    global Abst_Sens_DS_unten_gui
    global Abst_Sens_GDS_oben_gui
    global Abst_Sens_GDS_unten_gui
    global ASP_Beg_plot
    global ASP_End_plot
    global push_plotdata
    global Button_String

    selecRadioButt = event.NewValue.UserData;
    Button_String = event.NewValue.String;
    switch selecRadioButt
        case 1
            set(splot_8_1, {'YData'}, num2cell(Abst_Sens_DS_oben_gui(:,:)',2));
            set(splot_8_2, 'YData', sum(Abst_Sens_DS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            set(splot_8_2, 'UserData', 1);
            % Video Daten setzen
            push_plotdata = Abst_Sens_DS_oben_gui(:,:);
        case 2
            set(splot_8_1, {'YData'}, num2cell(Abst_Sens_GDS_oben_gui(:,:)',2));
            set(splot_8_2, 'YData', sum(Abst_Sens_GDS_oben_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            set(splot_8_2, 'UserData', 2);
            % Video Daten setzen
            push_plotdata = Abst_Sens_GDS_oben_gui(:,:);
        case 3
            set(splot_8_1, {'YData'}, num2cell(Abst_Sens_DS_unten_gui(:,:)',2));
            set(splot_8_2, 'YData', sum(Abst_Sens_DS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            set(splot_8_2, 'UserData', 3);
            % Video Daten setzen
            push_plotdata = Abst_Sens_DS_unten_gui(:,:);
        case 4
            set(splot_8_1, {'YData'}, num2cell(Abst_Sens_GDS_unten_gui(:,:)',2));
            set(splot_8_2, 'YData', sum(Abst_Sens_GDS_unten_gui(:, ASP_Beg_plot:ASP_End_plot),2)/(ASP_End_plot-ASP_Beg_plot+1));
            set(splot_8_2, 'UserData', 4);
            % Video Daten setzen
            push_plotdata = Abst_Sens_GDS_unten_gui(:,:);
        otherwise
    end
end
