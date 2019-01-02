% three points of interest
clc;
load agar

X = kvein(1:60,3:4);
X=X';
P=400+(100).*rand(1);

Q=43+(60).*rand(1);
R=[P,Q];

R=R';

plot(R(1,1),R(2,1),'g*');

disp(R)


% 4 nearest neighbours to each point
I = nearestneighbour(R, X, 'NumberOfNeighbours', 3)
disp(I)
I=I';
hold on
 plot(X(1,1), X(2, 1), 'r.','MarkerSize', 15);
 plot(X(1,31), X(2, 31), 'b.','MarkerSize', 15)


for j=2 : 30
    
plot(X(1,j), X(2, j), 'r.','MarkerSize', 15);


end
for j=32 : 60
    
plot(X(1,j), X(2, j), 'b.','MarkerSize', 15);


end
   
 count2=0;
 count1=0;
 
% for k=52 : 100
% plot(X(1,k), X(2, k), 'b.','MarkerSize', 15)
% end

switch true    
  case I(1,1)<31  
      count1=count1+1;
  case I(1,1)>30 && I(1,1)<61
      count2=count2+1;
 end


switch true    
  case I(2,1)<31  
      count1=count1+1;
  case I(2,1)>30 && I(1,1)<61
      count2=count2+1;
  
 end



if(count1>count2)
     disp('species1');
 else
      disp('species2');
 end 

hold on
p1 = repmat(R(1,1),1,3);
p2 = repmat(R(2,1),1,3);

quiver(p1, p2, X(1, I(:, 1)) - p1, X(2, I(:, 1)) - p2, 0, 'k')
legend('point of interest','species1','species2','location','northwest');
hold off