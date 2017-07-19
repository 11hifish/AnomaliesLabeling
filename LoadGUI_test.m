outFP = '';
indata = '';
outpath = '';
datamx = LoadRawData(indata);
startingCol = 2;
acol = datamx(:,startingCol);
LoadGUI(outpath,datamx,startingCol);
plot(acol);
