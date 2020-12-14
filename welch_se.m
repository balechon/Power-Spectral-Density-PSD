function Px = welch_se(x,L,over,win,b)
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
        Px = Px + mymperiodogram(x,win,b,n1,n1+L-1)/nsect;
        n1 = n1 + n0;
    end
end
