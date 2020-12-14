function R = covarr(x,p)
    % This function sets up a covariance matrix
    %---------------------------------------------------------------
    % copyright 1996, by M.H. Hayes.  For use with the book 
    % "Statistical Digital Signal Processing and Modeling"
    % (John Wiley & Sons, 1996).
    %---------------------------------------------------------------
    x = x(:);
    m = length(x);
    x = x - ones(m,1)*(sum(x)/m);
    R = convm(x,p+1)'*convm(x,p+1)/(m-1);
end