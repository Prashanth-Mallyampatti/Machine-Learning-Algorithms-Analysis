% clear ; close all; clc;

fprintf('Plotting Input Data ...\n')
data = csvread('data.csv');
X = data(:, 1); 
y = data(:, 2);
m = length(y);
plotData(X, y);

X = [ones(m, 1), data(:,1)]; 
theta = zeros(2, 1); 
iterations = 1500; 
alpha = 0.01; 

fprintf("The first cost is %f\n",computeCost(X, y, theta));

fprintf('Press Enter to Applying Gradient Descent ...\n');
theta = gradientDescent(X, y, theta, alpha, iterations);  
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

hold on; 
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off
 
z=X*theta; 

predict1 = [1, 3.5] *theta;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

Rsq = 1 - sum((y - z).^2)/sum((z - mean(y)).^2);

fprintf('\n\n The Accuracy is %f \n', Rsq*100);