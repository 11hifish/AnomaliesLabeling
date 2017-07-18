% an interactive Matlab GUI for manually labeling anomalous points with data cursors as ground truth
% output: a binary file indicating anomalous data points


% data storage: figure_handle: struct: input_fp

function LoadGUI
f = figure('units','normalized','outerposition',[0 0 1 1],'Tag','Fig');
ax = axes('Parent',f,'position',[0.13 0.39  0.77 0.54]);

% GUI_IO = struct('raw_data',indata,'output_path',outFP,'init',true);
% hObject = findobj('Tag','Fig');
% guidata(hObject,GUI_IO);

% radio button for choosing if the chosen anomalous points are single input points
r_single_pt_control = uicontrol('Parent',f,'Style','radiobutton',...
                  'Tag','r_single_pt_control',...
                  'String','Single Point',...
                  'Position',[281,95,80,30],...
                  'HandleVisibility','on');
% finish labeling
done_btn = uicontrol('Parent',f,'Style','pushbutton','Position',[281,125,80,30],...
           'String','DONE');
% set(done_btn,'Callback',@Finish);

% generate a JSON code block for recently labeled points
output_btn = uicontrol('Parent',f,'Style','pushbutton','Position',[81,95,80,30],...
           'String','OUTPUT');
% set(output_btn,'Callback',@WriteJson);

% add more anomalous ranges/points into the GUI table
add_btn = uicontrol('Parent',f,'Style','pushbutton','Position',[181,95,80,30],...
           'String','ADD');
% set(add_btn,'Callback',@Pushed);

% clear the GUI table
clear_btn = uicontrol('Parent',f,'Style','pushbutton','Position',[81,125,80,30],...
           'String','CLEAR');
% set(clear_btn,'Callback',@ClearTable);

% turn to next column
next_btn = uicontrol('Parent',f,'Style','pushbutton','Position',[181,125,80,30],...
           'String','NEXT');
% set(next_btn,'Callback',@NextCol);

% select input file
file_selector = uicontrol('Parent',f,'Style','pushbutton','Position',[781,175,100,30],...
           'String','Select Input File','Callback',@SelectFile);
input_file_name = uicontrol(f,'Style','text',...
                'Tag','IN_FP',...
                'String','NO INPUT FILE',...
                'Position',[781 125 100 30]);

% specify start column
start_col = uicontrol('Parent',f,'Style','edit','Position',[781,100,50,30],...
           'String','','Callback',@GetStartingIdx);

% column No. under labeling
cols = uicontrol(f,'Style','text',...
                'String','Column No.:',...
                'Position',[81 175 80 30]);
% col_no = uicontrol(f,'Style','text',...
%                 'Tag','Col_No',...
%                 'String',num2str(startingCol),...
%                 'Position',[181 175 80 30],...
%                 'HandleVisibility','on');

% total number of columns in the dataset
total = uicontrol(f,'Style','text',...
                'String','# columns in total:',...
                'Position',[81 155 80 30]);
% [~,colNums] = size(indata);
% total_no = uicontrol(f,'Style','text',...
%                 'Tag','Total_Num',...
%                 'String', colNums,...
%                 'Position',[181 155 80 30],...
%                 'HandleVisibility','on');


% Make a table showing all the segments selected
tble = uitable('Parent',f,'Position',[450 88 300 120],'ColumnName',{'start','end'},...
    'Tag','data_holder');

end

function SelectFile(hObject,event)
  [FileName,PathName,~] = uigetfile('*.csv');
  fig_handle = findobj('Tag','Fig');
  allData = guidata(fig_handle);
  allData.input_fp = PathName;
  inputfp_handle = findobj('Tag','IN_FP');
  set(inputfp_handle,'String',FileName);
end
