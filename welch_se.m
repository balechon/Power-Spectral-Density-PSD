function Px = welch_se(x,L,over,win,b)
%---------------------------------------------------------------
    % copyright 1996, by M.H. Hayes.  For use with the book 
    % "Statistical Digital Signal Processing and Modeling"
    % (John Wiley & Sons, 1996).
    %---------------------------------------------------------------
    if nargin == 4
        b = 1;
    end
    
    if (over >= 1) || (over < 0)
        error('Overlap is invalid') 
    end
    n1 = 1;
    n0 = round((1-over)*L);
    nsect=1+floor((length(x)-L)/(n0));
    Px=0;
    for i=1:nsect
        Px = Px + selecper(x,win,b,n1,n1+L-1)/nsect;
        n1 = n1 + n0;
    end
    
end
