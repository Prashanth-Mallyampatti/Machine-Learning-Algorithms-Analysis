% three points of interest
clc;
clear all;
load glass_KNN;

X = glass_al_ca(1:99,1:2);
X=X';


P=6.0+(11.0-6.0).*rand(1);

Q=0.05+(3.1-0.05).*rand(1);
R=[Q,P];

R=R';

plot(R(1,1),R(2,1),'g*');

disp(R)


% 4 nearest neighbours to each point
I = nearestneighbour(R, X, 'NumberOfNeighbours', 3)
disp(I)
I=I';
hold on
plot(X(1,1), X(2, 1), 'r.','MarkerSize', 15);
plot(X(1,71), X(2, 71), 'b.','MarkerSize', 15)


for j=2 : 71
    
plot(X(1,j), X(2, j), 'r.','MarkerSize', 15);


end
count=0;
count1=0;

for k=72 : 99
plot(X(1,k), X(2, k), 'b.','MarkerSize', 15)
end

if( I(1,1)< 72)
    count=count+1;
else 
    count1=count1+1;
end
   if( I(2,1)< 72)
    count=count+1;
else 
    count1=count1+1;
   end
   
    if( I(3,1)< 72)
    count=count+1;
   else 
    count1=count1+1;
    end
 if(count1>count)
     disp('Predicted glass:headlamps');
 else
      disp('Predicted glass:building windows float processed');
 end 

hold on
p1 = repmat(R(1,1),1,3);
p2 = repmat(R(2,1),1,3);

quiver(p1, p2, X(1, I(:, 1)) - p1, X(2, I(:, 1)) - p2, 0, 'k')
legend('point of interest','building windows float processed','headlamps','location','northwest');
hold off