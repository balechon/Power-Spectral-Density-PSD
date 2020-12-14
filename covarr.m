function R = covarr(x,p)
%
% This function sets up a covariance matrix
%
    x = x(:);
    m = length(x);
    x = x - ones(m,1)*(sum(x)/m);
    R = convm(x,p+1)'*convm(x,p+1)/(m-1);
end