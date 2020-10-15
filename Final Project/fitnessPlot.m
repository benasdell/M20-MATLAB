%Fitness
%Benjamin Asdell, UID: 005114992
%Quantifies the optimization of a given decoded chromosome using a
%normalized fitness function

function score = fitnessPlot(theta)
    %joint lengths
    L = [0.6, 0.4, 0.3, 0.2];
    %location of goal
    x_g = 1;
    y_g = 1;
    %location of obstacles
    obsx = [0, 0.5];
    obsy = [0.8, 0.4];
    %endpoint location
    x_e = sum(L.*cos(theta));
    y_e = sum(L.*sin(theta));
    %joint locations
    x = zeros(1,4);
    y = zeros(1,4);
    for k = 2:4
        x(k) = x(k-1) + L(k-1)*cos(theta(k-1));
        y(k) = y(k-1) + L(k-1)*sin(theta(k-1));
    end
    %center of mass locations
    x_c = zeros(1,4);
    y_c = zeros(1,4);
    for k = 1:4
        x_c(k) = x(k) + L(k)*0.5*cos(theta(k));
        y_c(k) = y(k) + L(k)*0.5*sin(theta(k));
    end
    %distance from endpoint to goal
    f_g = sqrt((x_g - x_e)^2 + (y_g - y_e)^2);
    %distance from each obstacle to center of masses
    f_o = zeros(2,4);
    for i = 1:2
        for j = 1:4
            f_o(i,j) = sqrt((obsx(i) - x_c(j))^2 + (obsy(i) - y_c(j))^2);
        end
    end
    f_o = sum(sum(f_o));
    %normalized fitness calculation
    score = 1 - f_g - (5.1730 - f_o)/5.1730;
    figure
    arm = plot([x x_e],[y y_e],'-b.');
    grid on
    arm.LineWidth = 2;
    arm.MarkerSize = 30;
    axis([-0.2 1.2 0 1.2])
    xlabel('X Position (m)')
    ylabel('Y Position (m)')
    hold on
    obs = plot(obsx,obsy,'k.');
    obs.MarkerSize = 30;
    goal = plot(x_g,y_g,'r.');
    goal.MarkerSize = 30;
    cm = plot(x_c,y_c,'g.');
    cm.MarkerSize = 30;
    legend('Robotic Arm','Obstacle','Goal','Center of Mass','Location','northwest')
    hold off
    saveas(gcf,'RoboticArm.png')
end