# datax
A matlab plugin for [the datax LaTeX package[ctan]](https://ctan.org/tex-archive/macros/latex/contrib/datax).

Allows data to be saved in a form easily accessible from LaTeX.

## Code example
Matlab:
```matlab
datax("data.tex",["s","E","c"],[27,3.14,3e8],["","\\joule","\\meter\\per\\second\\squared"])
```

LaTeX:
```tex
\usepackage[dataxfile=data.tex]{datax}
% ... later ...
The measured energy was \(E = \datax{E}\).
```
