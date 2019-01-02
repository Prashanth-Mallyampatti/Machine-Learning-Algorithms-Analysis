clear all;
clc;


load oil_composition

% main points 
P = rand(2, 1);

% random point set
X = z;
I = nearestneighbour(P, X);

disp(I)
disp('main points:')
disp(P)
disp('Nearest neighbours')
disp(X(:, I))

plot(X(1,:), X(2,:), 'b.', P(1,:), P(2,:), 'r.', 'MarkerSize', 15);
hold on
quiver(P(1, :), P(2, :), X(1,I) - P(1, :), X(2, I) - P(2, :),0, 'K');
hold off