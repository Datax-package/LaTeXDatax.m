function [ C, U ] = constant( name )
%CONSTANT (name) returns the value of the named natural constant.
%   If a single output is expected, C will be a (UnitConversion/)unit
%   object. If two outputs are expected, C will be numeric and U a string
%   representing the unit in siunitx.
switch name
    case 'c'
        x = 2.99792458e8;
        u = 'm/s';
    case 'e_0'
        x = 8.854187817e-12;
        u = 'F/m';
    case 'h'
        x = 6.626070040e-34;
        u = 'J*s';
    case 'hbar'
        x = 1.0545718e-34;
        u = 'J*s';
    case 'k_B'
        x = 1.38064852e-23;
        u = 'J/K';
    case 'm_e'
        x = 9.10938356e-31;
        u = 'kg';
    case 'N_A'
        x = 6.0221420e23;
        u = '';
    case 'q'
        x = 1.60217662089e-19;
        u = 'C';
    case 'u'
        x = 1.66053904e-27;
        u = 'kg';
    otherwise
        error(['no constant "' name '" available']);
end


switch nargout
    case 2
        C = x;
        U = unittranslation(u);
    otherwise
        C = convert(unit(x,u),u);
end

