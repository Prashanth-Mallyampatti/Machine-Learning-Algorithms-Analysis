% three points of interest
clc;
clear all;
load glass_nn;
%glass_al_ca=glass_al_ca';
% hold on  
% for l=1 : 71
%   
% plot(glass_al_ca(1,l), glass_al_ca(2, l), 'r.','MarkerSize', 15);
% 
% end
% for l=72 : 147
%   
% plot(glass_al_ca(1,l), glass_al_ca(2, l), 'b.','MarkerSize', 15);
% 
% end
% for l=148 : 164
%   
% plot(glass_al_ca(1,l), glass_al_ca(2, l), 'g.','MarkerSize', 15);
% 
% end
% for l=165 : 177
%   
% plot(glass_al_ca(1,l), glass_al_ca(2, l), 'c.','MarkerSize', 15);
% 
% end
% for l=178 : 186
%   
% plot(glass_al_ca(1,l), glass_al_ca(2, l), 'm.','MarkerSize', 15);
% 
% end
% for l=187 : 214
%   
% plot(glass_al_ca(1,l), glass_al_ca(2, l), 'k.','MarkerSize', 15);
% 
% end
% hold off;
% pause;


X = glass_al_ca(1:71,1:2);
X=X';
Y=glass_al_ca(187:214,1:2);
Y=Y';
P=6.0+(11.0-6.0).*rand(1);

Q=0.05+(3.1-0.02).*rand(1);
R=[Q,P];

R=R';

plot(R(1,1),R(2,1),'g*');




% 4 nearest neighbours to each point
I = nearestneighbour(R, X, 'NumberOfNeighbours', 1)
J=nearestneighbour(R, Y, 'NumberOfNeighbours', 1)
disp(J);
disp(I);

disp(X(:,I));
disp(Y(:,J));
disp(R)
a=(X(1,I)-R(1,1))*(X(1,I)-R(1,1));
b=(X(2,I)-R(2,1))*(X(2,I)-R(2,1));
c=sqrt(a+b);

e=(Y(1,J)-R(1,1))*(Y(1,J)-R(1,1));
f=(Y(2,J)-R(2,1))*(Y(2,J)-R(2,1));
d=sqrt(e+f);

I=I';
J=J';
hold on
plot(X(1,1), X(2, 1), 'r.','MarkerSize', 15);
plot(Y(1,1), Y(2, 1), 'b.','MarkerSize', 15)


for l=2 : 71
    
plot(X(1,l), X(2, l), 'r.','MarkerSize', 15);


end
for k=2 : 27
plot(Y(1,k), Y(2, k), 'b.','MarkerSize', 15)
end

if(c<d)
    q=d;
     disp('Predicted glass:building_windows_float_processed');
    acc=(((d-c)/q))*100;
    if(acc<50.00)
        acc=100.00-acc;
    end
   hold on
p1 = repmat(R(1,1),1,3);
p2 = repmat(R(2,1),1,3);

quiver(p1, p2, X(1, I(:, 1)) - p1, X(2, I(:, 1)) - p2, 0, 'k')
legend('point of interest','building windows float processed','headlamps','location','northwest');
hold off

else 
    w=c;
     disp('Predicted glass:headlamps');
    acc=(((c-d)/w))*100;
    if(acc<50.00)
        acc=100.00-acc;
    end
    hold on
p1 = repmat(R(1,1),1,3);
p2 = repmat(R(2,1),1,3);

quiver(p1, p2, Y(1, J(:, 1)) - p1, Y(2, J(:, 1)) - p2, 0, 'k')
legend('point of interest','building windows float processed','headlamps','location','northwest');
hold off
     
 end 
disp("Accuracy:"+acc+"%");
