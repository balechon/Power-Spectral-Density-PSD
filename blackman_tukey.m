function Px = blackman_tukey(x,win,M,B,n1,n2)
    %---------------------------------------------------------------
    % copyright 1996, by M.H. Hayes.  For use with the book 
    % "Statistical Digital Signal Processing and Modeling"
    % (John Wiley & Sons, 1996).
    %---------------------------------------------------------------
    x = x(:);
    if nargin < 5 
        n1 = 1; n2 = length(x); 
    end
    R = covarr((x(n1:n2)),M);
    r = [fliplr(R(1,2:M)),R(1,1),R(1,2:M)];
    M = 2*M-1;
    w = ones(M,1);
    if (win == 2) 
        w = hamming(M);
    elseif (win == 3) 
        w = hanning(M);
    elseif (win == 4) 
        w = bartlett(M);
    elseif (win == 5) 
        w = blackman(M);
    elseif (win == 6) 
        w = kaiser(M,B);
    end
    r=r'.*w;
    Px = abs(fft(r,1024));
    Px(1)=Px(2);
    Px = Px(1:(length(Px)/2));
end