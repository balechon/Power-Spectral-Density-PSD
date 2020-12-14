function Px = myperiodogram(x,nfft,n1,n2)
   %---------------------------------------------------------------
    % copyright 1996, by M.H. Hayes.  For use with the book 
    % "Statistical Digital Signal Processing and Modeling"
    % (John Wiley & Sons, 1996).
    %---------------------------------------------------------------
    x=x(:);
    if nargin == 1
        nfft = 1024; 
        n1 = 1;
        n2 = length(x); 
    end
    if nargin  == 2
        n1 = 1;
        n2 = length(x); 
    end
    Px = abs(fft(x(n1:n2),nfft)).^2/(n2-n1+1);
    Px=Px./pi;
    Px(1)=Px(2);
    Px = Px(1:(length(Px)/2));
end


