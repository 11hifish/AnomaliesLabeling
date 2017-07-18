function matrix = LoadRawData(cvsFilePath)
rawData = readtable(cvsFilePath);
matrix = table2array(rawData);
close all;
end