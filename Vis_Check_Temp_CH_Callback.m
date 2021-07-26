% Funktion - Checkboxen Temperaturen Brennraum gemittelt
function Vis_Check_Temp_CH_Callback(src, ~, data, data_2)

    % globale Variablen
    global ax11
    eval(['global splot_11_1_', int2str(data), '_', int2str(data_2)])


    if (get(src,'Value') == get(src,'Max'))
        eval(['set(splot_11_1_', int2str(data), '_', int2str(data_2), ', ''Visible'', ''on'');']);
    elseif (get(src,'Value') == get(src,'Min'))
        eval(['set(splot_11_1_', int2str(data), '_', int2str(data_2), ', ''Visible'', ''off'');']);
    else
    end

    legend_sichtbar = findobj(ax11,'type','line','visible','on');
    if (size(legend_sichtbar, 1) == 0)
        legend(ax11, 'off');
    else
        legende_set = legend(legend_sichtbar, 'Location','southeast');
        set(legende_set, 'Interpreter','none', 'Box','off');
    end


end