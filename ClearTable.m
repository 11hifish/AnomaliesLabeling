function ClearTable(hObject,event)
    table_handle = findobj('Tag','data_holder');
    set(table_handle,'data',[]);
end