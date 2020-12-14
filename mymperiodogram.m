function Px = mymperiodogram(x,win,b,n1,n2)
    x = x(:);
    if nargin < 4
        n1 = 1;
        n2 = length(x); 
    end
    
    N = n2 - n1 + 1;
    w = ones(N,1);
    if (win == 2) w = hamming (N) ;
    elseif (win==3) w = hanning(N);
    elseif (win==4) w = bartlett(N);
    elseif (win==5) w = blackman(N);
    elseif (win==6) w = kaiser(N,b);
    end
    xw = x(n1:n2).*w/norm(w);
    Px = N*myperiodogram(xw);
end