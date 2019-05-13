theta1 = [-2:0.01:2]';
theta2 = [-2:0.01:2]';
theta = [theta1 theta2];
centre_theta1 = [0.5 0.5];
sigma_theta1 = 0.5;
centre_theta2 = [-1.0 0];
sigma_theta2 = 0.5;
act1 = [];
act2 = [];
act = [];
for i = 1:length(theta1)
    for j = 1:length(theta2)
        x = [theta1(i) theta2(j)]' - centre_theta1';
        act1(i,j) = exp(-(x'*x/(2*sigma_theta1^2)));
        x = [theta1(i) theta2(j)]' - centre_theta2';
        act2(i,j) = exp(-(x'*x/(2*sigma_theta2^2)));
        act(i,j) = act1(i,j) + 1.5*act2(i,j);
    end
end

mesh(theta1,theta2,act);
title('Centres: [0.5 0.5], [-1 0], widths: 0.5, 0.5, weights: 1, 1.5');
xlabel('Joint-1 angle [rad]');
ylabel('Joint-2 angle [rad]');
zlabel('Activation');
view(-203,30);
