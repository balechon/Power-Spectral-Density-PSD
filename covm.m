function [a,err] = covm(x,p)
    %---------------------------------------------------------------
    % copyright 1996, by M.H. Hayes.  For use with the book 
    % "Statistical Digital Signal Processing and Modeling"
    % (John Wiley & Sons, 1996).
    %---------------------------------------------------------------

    x   = x(:);
    N   = length(x);

    if p>=length(x)
        error('Model order too large'); 
    end

    X   = convm(x,p+1);
    Xq  = X(p:N-1,1:p);
    a   = [1;-Xq\X(p+1:N,1)];
    err = abs(X(p+1:N,1)'*X(p+1:N,:)*a);

end

