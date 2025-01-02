x1 = 9;
y1 = 9;
x2 = 7;
y2 = 7; 


% Try to input and output data, store all the info and outcome in a file, and try to exract them
% Then input to the dataset and read info from the dataset

% Define the original distance between agents A and B
%d = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));

% Initialize the time and speed vectors, define the time interval for an
% iteration is 0.01 second to make the simulation more accurate
time = 0:0.01:1; % notice the stopping time
speedA = 2*ones(size(time));
speedB = 1*ones(size(time));
d = zeros(size(time));

% Calculate the initial values of dA and dB
dA = speedA .* time;
dB = speedB .* time;

% Calculate the speed for agent A and agent B
for i = 1:length(time)
    if d(i) >= 0 && d(i) <= 1
        speedA(i) = 1/d(i)+2;
    elseif d(i) >= 1 && d(i) <= 3
        speedA(i) = exp(-d(i)+1)+2;
    elseif d(i) >= 3 && d(i) <= 7
        speedA(i) = -2*d(i) + 8 + exp(-2);
    end
    if d(i) >= 0 && d(i) <= 2
        speedB(i) = 1/d(i)+1;
    elseif d(i) >= 2 && d(i) <= 4
        speedB(i) = exp(-d(i)+2)+1;
    elseif d(i) >= 4 && d(i) <= 7
        speedB(i) = -2*d(i) + 7 + exp(-1);
    end
    dA(i) = speedA(i) * time(i);
    dB(i) = speedB(i) * time(i);
    x1 = 9 + dA(i) * 7 / sqrt(58);
    y1 = 9 + dA(i) * 3 / sqrt(58);
    x2 = 7 - dB(i) * 7 / sqrt(74);
    y2 = 7 + dB(i) * 5 / sqrt(74);
    d(i+1) = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
end

% Plot the graph
figure;
plot(time, speedA, 'b', 'LineWidth', 2);
hold on;
plot(time, speedB, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed (units per second)');
title('Speed vs Time for Agents A and B');
legend('Agent A', 'Agent B');
grid on;

% Plot the phase plane of two agents to show the trajectories.

% Now how I decide the speed has no relationship with the objective
% functions.
% If we have the graph for trajectories, maybe we can predict the speed of
% agents.

