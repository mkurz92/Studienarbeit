% Funktion - Radiobuttongroup 2 Callback  
function Vis_Button_2_Callback (~, event)
    % Globale Variablen
    global ax2
    global ax4
    global splot_2_1
    global splot_2_2
    global splot_4_3
    global splot_4_4

    % Balkendiagramm für ausgewählte Sensoren
    if strcmp(event.NewValue.String, 'Balkendiagramm')
        ax4.Visible = 'off';
        splot_4_3.Visible = 'off';
        splot_4_4.Visible = 'off';
        ax2.Visible = 'on';
        splot_2_1.Visible = 'on';
        splot_2_2.Visible = 'on';
    % Scatterdiagramm für ausgewählte Sensoren
    elseif strcmp(event.NewValue.String, 'Scatterdiagramm')
        ax2.Visible = 'off';
        splot_2_1.Visible = 'off';
        splot_2_2.Visible = 'off';
        ax4.Visible = 'on';
        splot_4_3.Visible = 'on';
        splot_4_4.Visible = 'on';
    else
    end    
end