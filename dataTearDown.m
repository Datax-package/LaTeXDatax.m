function dataTearDown(DataTable,filename)
%DATATEARDOWN (DataTable, filename) prints file 'filename' ('./data.csv' by default)
if nargin < 2
    filename = 'data.csv';
end
if height(DataTable) == 0
    return
end 
    
outputTable = [cell2table(DataTable.Properties.RowNames,'VariableNames',{'Tag'}) DataTable];
writetable(outputTable,filename);

end

