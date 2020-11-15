function datax(filename, tags, values, units, formats)
% DATAX ( filename, tags, values, units, formats ) save the given data to file
% FILENAME, for use with the datax.sty LaTeX package.  UNITS is a single unit
% string or a vector of unit strings. These should be siunitx-style strings
% ("\\kilo\\gram\\per\\meter\\tothe2"). If left out, or explicitly set to "",
% the number is printed without a unit.  
% FORMATS is a single format string or a vector of c-style format strings for
% the values.  If this is left out, or explicitly given as "", the default of
% "%.4g" is used.

	if nargin<4
		units = strings(size(tags));
	end
	if nargin<5
		formats = strings(size(tags));
	end

	if numel(values) ~= numel(tags)
		if numel(values) == 1
			values = repmat(values,size(tags));
		else
			error("Must have equal numbers of values and tags");
		end
	end

	if numel(units) ~= numel(tags)
		if numel(units) == 1
			units = repmat(units,size(tags));
		else
			error("Must have equal numbers of units and tags");
		end
	end

	if numel(formats) ~= numel(tags)
		if numel(formats) == 1
			formats = repmat(formats,size(tags));
		else
			error("Must have equal numbers of formats and tags");
		end
	end

	f = fopen(filename,'w');
	for i = 1:length(tags)
		fprintf(f,"\\pgfkeyssetvalue{%s}{",tags(i));
		printdatavalue(f,values(i),units(i),formats(i));
		fprintf(f,"}\n");
	end
	fclose(f);
end

function printdatavalue(f,value,unit,format)
	if format == ""
		format = "%.4g";
	end
	if unit == ""
		if isstring(value)
			fprintf(f,"%s",value);
			return
		end
		fprintf(f,strcat("\\num{",format,"}"),value);
		return
	end
	fprintf(f,strcat("\\SI{",format,"}{%s}"),value,unit);
end
