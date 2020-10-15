%Calculate Covariance
%Benjamin Asdell, UID: 005114992
%Calculates covariance between two sample data sets

function cov = calculateCovariance(x,y)
    %average values of each data set
    x_bar = mean(x);
    y_bar = mean(y);
    %
    x_norm = x - x_bar;
    y_norm = y - y_bar;
    N = length(x);
    temp = x_norm .* y_norm;
    cov = sum(temp/N);
end

