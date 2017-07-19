function WriteBinary(hObject,event)
  table_handle = findobj('Tag','data_holder');
  tableData = get(table_handle,'data');
  fig_handle = findobj('Tag','Fig');
  allData = guidata(fig_handle);
  WriteBinaryFile(allData.output_path,tableData,allData.total_len)
end