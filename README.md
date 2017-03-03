# datax
Datax is a MATLAB/LaTeX interface, allowing seamless update between calculations and display in the same way that can already be done with images.
Best combined with [this MATLAB unit conversion toolbox](https://se.mathworks.com/matlabcentral/fileexchange/29621-units-conversion-toolbox).

## Code Example
In MATLAB:
```matlab
Data = dataSetup('data.csv');
distance = 120; %meter
time = 24.6; %second
velocity = distance/time; %meter/second
data(Data,'velocity',velocity,'\meter\per\second');

dataTeardown(Data);
```

and in LaTeX:
```latex
...
\usepackage{datax}
...

The velocity was measured as \(v = \data{'velocity'}\).
```

## Motivation

Writing lab reports and similar smaller projects with constant tabbing back and forth between MATLAB and LaTeX, i noticed the workflow for images felt so much smoother than that for calculations.
Basically, it seems countrary to TeX philosophy to manually edit your document just because you refined your calculations. With this package, you leave the things that MATLAB does best to MATLAB, and vice versa.
