function NextCol(hObject,event)
    % clear cursors and table data
    delete(findall(gcf,'Type','hggroup'));
    table_handle = findobj('Tag','data_holder');
    set(table_handle,'data',[]);
    
    col_handle = findobj('Tag','Col_No');
    colnumber = get(col_handle,'String');
    col_no = str2num(colnumber);
    col_no = col_no + 1;
    colnumber = num2str(col_no);
    set(col_handle,'String',colnumber);
    fig_handle = findobj('Tag','Fig');
    allData = guidata(fig_handle);
 
    plot(allData.raw_data(:,col_no));
end