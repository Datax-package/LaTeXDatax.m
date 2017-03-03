function DataTable = dataSetup(filename)
%DATATABLE (filename) Tries to read datafile. Creates and returns dataTable.
%   FILENAME is optional, and is './data.csv' by default

if nargin < 1
    filename = 'data.csv';
end

if exist(filename,'file')
    DataTable = readtable(filename,'ReadVariableNames',true,'ReadRowNames',true);
else
    DataTable = cell2table(cell(0,2),'VariableNames',{'Value','Unit'});
    DataTable.Properties.DimensionNames={'Tag','Variables'};
end
end

