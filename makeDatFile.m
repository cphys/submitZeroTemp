ClearAll["Global`*"]

numbOfFiles = 4000;
numbDatFiles = numbOfFiles/500;
minVal = 0;
maxVal = 50;
numPerLis = numbOfFiles/numbDatFiles;

wholeTab = N[Table[i, {i, minVal, maxVal, (maxVal - minVal)/(numbOfFiles - 1)}]];

formattedDataTable =
   Table[{
    wholeTab[[i]],
    wholeTab[[i + numPerLis]],
    wholeTab[[i + 2*numPerLis]],
    wholeTab[[i + 3*numPerLis]],
    wholeTab[[i + 4*numPerLis]],
    wholeTab[[i + 5*numPerLis]],
    wholeTab[[i + 6*numPerLis]],
    wholeTab[[i + 7*numPerLis]]},
   {i, 1, numPerLis}];

exportFileName = NotebookDirectory[] <> "dataTable.csv";
Export[exportFileName, ExportString[formattedDataTable, "CSV"]];

