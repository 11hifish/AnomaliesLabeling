function Label(hObject,event)
    cursorMode = datacursormode;
    cursor = getCursorInfo(cursorMode);
    [~,cursorNum] = size(cursor);
    if cursorNum == 0
        return;
    end
    
    arr = zeros(1,cursorNum);
    for i = 1:cursorNum
        pos = cursor(i).Position;
        arr(i) = pos(1);
    end
    arr = sort(arr);
    
    r_single_pt_control = findobj('Tag','r_single_pt_control','String','Single Point');
    single_pt = get(r_single_pt_control,'Value');
    
    table_handle = findobj('Tag','data_holder');
    
    if mod(cursorNum,2) == 1 && single_pt == 0
        disp('ERROR!');
    else
        if single_pt == 1
            for i = 1:cursorNum
                newAdd{1} = arr(i);
                newAdd{2} = arr(i);
                oldData = get(table_handle,'data');
                newData = [oldData;newAdd];
                set(table_handle,'data',newData);
            end
        else
            for i = 1:2:cursorNum
                newAdd{1} = arr(i);
                newAdd{2} = arr(i+1);
                oldData = get(table_handle,'data');
                newData = [oldData;newAdd];
                set(table_handle,'data',newData);
            end
        end
        delete(findall(gcf,'Type','hggroup'));
    end
end