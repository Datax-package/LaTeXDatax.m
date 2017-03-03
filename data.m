function dataTable = data(dataTable, tag, value, unit)
%DATA (dataTable, tag, value, unit) Put data on dataTable, for later print into
%   datafile.
%   'value' may be numeric, or of (UnitConversion/)unit type, in which
%   case no fourth argument is required.
%
%   Put dataTable = dataSetup(); in the beginning of your script, and
%   dataTearDown(dataTable) in the end of your script.
%   Then use the datax package to print the data values in LaTeX.
if isa(value,'unit')
    unit = unittranslation(value.name);
    value = value.value;
elseif nargin < 4
    unit = '\dimless';
end

dataTable(tag,:)={value,{unit}};

end


