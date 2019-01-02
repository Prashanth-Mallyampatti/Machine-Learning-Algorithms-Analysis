%  clear ; close all; clc
warning('off','all');
load var1

X = [x1,x2];
y=y1;
label1='p1';
y= ismember(y,label1);

fprintf(['Plotting input data \n']);
figure('position',[100 200 500 500]);
plotData(X, y);

hold on;

xlabel('Oil')
ylabel('water')
legend('Species1', 'Species2');
hold off;

[m, n] = size(X);
X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);

[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);
figure('position',[800 200 500 500]);

plotDecisionBoundary(theta, X, y);
axis([-20 300 -20 300]);
hold on;

xlabel('Oil');
ylabel('water');
legend('Species1', 'Species2');

hold off;
p = predict(theta, X);

fprintf('\n\nTrain Accuracy: %f\n', mean(double(p == y)) * 100);

