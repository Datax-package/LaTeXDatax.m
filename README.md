# datax
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
