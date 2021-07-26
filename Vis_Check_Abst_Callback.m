% Funktion - Checkboxen Abstand Callback
function Vis_Check_Abst_Callback(src, ~, data)
    % Global Variablen
    global ax7
    for k=1:4
            eval(['global splot_7_', int2str(k)]);
    end
    
    if (get(src,'Value') == get(src,'Max'))
        eval(['set(splot_7_', int2str(data), ', ''Visible'', ''on'');']);
    elseif (get(src,'Value') == get(src,'Min'))
        eval(['set(splot_7_', int2str(data), ', ''Visible'', ''off'');']);
    else
    end
    
    legend_sichtbar = findobj(ax7,'type','line','visible','on');
    legend(legend_sichtbar, 'Location','southeast');
end