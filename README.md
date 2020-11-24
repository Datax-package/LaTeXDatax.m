# LaTeXDatax
A matlab plugin for [the datax LaTeX package[ctan]](https://ctan.org/tex-archive/macros/latex/contrib/datax).

Allows data to be saved in a form easily accessible from LaTeX.

## Code example
Matlab:
```matlab
a = 24.35;
b = 2;
c = 7.44;
d = 12;
datax('data.tex',a,'\meter','%.3g',b,'\kilo\gram',c,'%.2g',d)
```

LaTeX:
```tex
\documentclass{article}

\usepackage{siunitx}
\usepackage[dataxfile=data.tex]{datax}

\begin{document}
The measured distance was \(a = \datax{a}\).
\end{document}
```

## Installation
This package is available in the MATLAB add-on explorer.

[![View LaTeXDatax on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/83333-latexdatax)

## To do
* I would love to plug this into the `symunit` framework, but the authors have made that very difficult. What I would need is a way to extract power, prefix and name of each unit in a compound unit. This seems theoretically possible - use `findUnits` to get the involved units, check them for SI prefixes (they are unfortunately not all single characters), use `log(x)/log(findunits(x))` (or possibly necessarilly check `findunits(x/units(k)^m)` for `m = [1,-1,2,-2,3,-3...]`) to find the power, and convert from `mg` to `\milli\gram` via lookup table. This is all super painful, because the toolbox is missing some basic functionality.
