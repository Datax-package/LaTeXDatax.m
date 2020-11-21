function datax(varargin)
	% DATAX print variables to file (for use with `datax.sty` in LaTeX).
	% DATAX ([filename], variables)
	% If the first argument is a string, it's the filename. Defaults to "data.tex"
	% variables is a number of arguments, either 
	%     variable, unit, format
	%     variable, unit
	%     variable, format *or*
	%     variable
	% Calls that break with this order will simply lead to strange data files.
	% If a string argument contains '%', it's assumed to be format.
	% The default format is "%.4g"
	% unit should be given as siunitx strings: '\meter\per\second' etc
	% Example:
	% a = 24.35;
	% b = 2;
	% c = 7.44;
	% d = 12;
	% datax('data.tex',a,'\meter','%.3g',b,'\kilo\gram',c,'%.2g',d)
	% % prints data corresponding to
	% % a = 24.4 \meter
	% % b = 2 \kilo\gram
	% % c = 7.4
	% % d = 12
	argn = 1;
	if isstring(varargin{1}) || ischar(varargin{1})
		filename=varargin{1};
		argn=argn+1;
	else
		filename="data.tex";
	end
	f = fopen(filename,'w');
	while argn<=nargin
		value = varargin{argn};
		origargn = argn;
		argn = argn+1;
		if argn<=nargin && (isstring(varargin{argn})||ischar(varargin{argn}))
			if contains(varargin{argn},'%')
				unit = "";
				format = varargin{argn};
				argn = argn+1;
			else
				unit = varargin{argn};
				argn = argn+1;
				if argn<=nargin && (isstring(varargin{argn})||ischar(varargin{argn})) && contains(varargin{argn},'%')
					format = varargin{argn};
					argn = argn+1;
				else
					format = "";
				end
			end
		else
			unit="";
			format="";
		end
		printdatum(f,inputname(origargn),value,unit,format);
	end
	fclose(f);
end

function printdatum(f,tag,value,unit,format)
	% PRINTDATUM print variable named `tag` with given value, unit and format to iostream f
	% PRINTDATUM ( f , tag , value , unit , format )
	%
	% See also DATAX.
	fprintf(f,"\\pgfkeyssetvalue{%s}{",tag);
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
	fprintf(f,"}\n");
end

%{ % {{{
	% Archived, might still have a use in the future...
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
% }}} %}
