outpath = '';
indata = '';
datamx = LoadRawData(indata);
startingCol = 35;
acol = datamx(:,startingCol);
LoadGUI(outpath,datamx,startingCol);
plot(acol);

