%Function: Bending Moment
%Benjamin Asdell,UID:005114992
%Calculates bending moment of Euler-Bernoulli beam at a specific location
%along the beam

function M = bendingMoment(P, d, L, x)
    if x >= 0 && x <= d
        M = -P*x*(L-d)/L;
    elseif x > d && x <= L
        M = -P*d*(L-x)/L;
    end
end