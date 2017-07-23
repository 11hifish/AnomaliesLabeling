% data: n x 2 cells containing anomalous data ranges
% total_len: total length of the binary for a single sensor
function WriteBinaryFile(output_path,data, total_len)
  % prepare the binary
  [range_num,~] = size(data); 
  res = zeros(1,total_len);
  
  for i = 1:range_num
      range_start = data{i,1};
      range_end = data{i,2};
      for j = range_start:range_end
          res(j) = 1;
      end 
  end
  
  % write the output
  fid = fopen(output_path,'a');
  for i = 1:total_len
      if i == total_len
        fprintf(fid,'%s', num2str(res(i)));
      else
        fprintf(fid,'%s', strcat(num2str(res(i)),','));
      end
  end
  fprintf(fid,'%s\n','');
  
  % finish writing
  fclose(fid);
end