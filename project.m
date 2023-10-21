% Load the data, and isolate the Z value
load('elevator1.mat')
accelerationOne = Acceleration.Z(1:3740);

load('elevator2.mat')
accelerationTwo = Acceleration.Z(1:3880);

load('elevator3.mat')
accelerationThree = Acceleration.Z(1:3781);


% The maximum(MAX) value of acceleration
maxOne = max(accelerationOne);
maxTwo = max(accelerationTwo);
maxThree = max(accelerationThree);


% The minimum(MIN) value of acceleration
minOne = min(accelerationOne);
minTwo = min(accelerationTwo);
minThree = min(accelerationThree);


% Vector of maximum(MAX) value of acceleration
maxVec = [maxOne, maxTwo, maxThree];


% Vector of minimum(MIN) value of acceleration
minVec = [minOne, minTwo, minThree];


% Plot the vector of maximum values
plot([1 2 3], maxVec, 'go', 'MarkerSize', 10);
hold on
plot([1 2 3], minVec, 'ro', 'MarkerSize', 10);
legend('Maximum Acceleration','Minimum Acceleration');
xlabel('Elevator #');
ylabel('Acceleration (m/s^2)');
title('Acceleration of Warren B Elevator');
axis([-1 5 8.5 11.5]);


% Convert the acceleration to the force
forces = accelToForce(maxVec);
fprintf('The force exerted on the phone in elevators 1, 2 and 3 are ');
fprintf('%.2f N, %.2f N, and %.2f N, respectively\n', forces(1), forces(2), forces(3));



function force = accelToForce(x)
% Calculates force given acceleration on phone, accelToForce(x)
force = x * 0.194;
end