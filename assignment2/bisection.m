function[xr r err fr fr2] = bisection(f, a, b, tol, n)
% function file help (python documentation type)
% function [xr r err fr] = bisection(f,a,b,tol, n)
% Does n iterations of the bisection method for a function f
% Inputs: f -- an inline function exp: f = inline('x^2 + 1')
%         a,b -- interval in which roots lie
%		  tol -- tolerance
%         n -- the number iterations
% Outputs: xr -- the estimated solution of f(x) = 0
%		   r -- matrix of roots of equation per iteration
%          err -- relative error
%		   fr -- matrix, function absolute values at xr
%          fr2 -- matrix, function values at xr
format long
if nargin < 5
    n =  log2((b - a)/tol);
end
if f(a)*f(b) > 0
    error('choose values again')
	return
end
for i = 1:n
	xr = (a + b)/2;
    r(i,1) = xr;
	if f(xr)*f(b) <= 0
		a = xr;
		b = b;
	elseif f(a)*f(xr) <= 0
		a = a;
		b = xr;
    end
    fr(i, 1) = abs(f(xr));
    fr2(i, 1) = f(xr);
    if i > 1
        m = i - 1;
        err(m,1) = abs(r(m,1) - r(i, 1)) / r(i, 1) *100;
        if fr(m, 1) == 0.0
            err = 0;
            break
        end
        if (err(m,1) < tol)
            break
        end
    end
end
plot(1:size(err), err, 'b');
grid on
hold on
plot(1:size(fr), fr, 'g--');
hold off
end
