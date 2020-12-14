function Px = bartlett_se(x,nsect)
   %---------------------------------------------------------------
    % copyright 1996, by M.H. Hayes.  For use with the book 
    % "Statistical Digital Signal Processing and Modeling"
    % (John Wiley & Sons, 1996).
    %---------------------------------------------------------------
    L = floor(length(x)/nsect);
    Px = 0;
    n1 = 1;
    for i=1:nsect
        Px = Px + myperiodogram(x(n1:n1+L-1))/nsect;
        n1 = n1 + L;
    end
end