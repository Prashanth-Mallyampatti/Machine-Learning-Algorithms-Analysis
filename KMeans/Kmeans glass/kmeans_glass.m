clc;
clear all;
load glass_al_ca

F=glass_al_ca(1:214,1:2);
K     = 6;                               % Cluster Numbers
KMI   = 20;                              %k means iteration                             
CENTS = F( ceil(rand(K,1)*size(F,1)) ,:);          
DAL   = zeros(size(F,1),K+2);                         
CV    = '+r+b+g+m+c+y';       % Color Vector


for n = 1:KMI      
   for i = 1:size(F,1)
      for j = 1:K  
        DAL(i,j) = norm(F(i,:) - CENTS(j,:));      
      end
      [Distance CN] = min(DAL(i,1:K));                % 1:K are Distance from Cluster Centers 1:K 
      DAL(i,K+1) = CN;                                
      DAL(i,K+2) = Distance;                          
   end
   for i = 1:K
      A = (DAL(:,K+1) == i);                          % Cluster K Points
      CENTS(i,:) = mean(F(A,:));                      % New Cluster Centers
      if sum(isnan(CENTS(:))) ~= 0                
         NC = find(isnan(CENTS(:,1)) == 1);         
         for Ind = 1:size(NC,1)
         CENTS(NC(Ind),:) = F(randi(size(F,1)),:);
         end
      end
   end
   
clf
figure(1)
hold on

 for i = 1:K
PT = F(DAL(:,K+1) == i,:);                          
plot(PT(:,1),PT(:,2),CV(2*i-1:2*i),'LineWidth',2);    
plot(CENTS(:,1),CENTS(:,2),'*k','LineWidth',6);       
%legend('virginia','centroid','setosa','versicolor','location','northwest');
 end

hold off
grid on
pause(0.1)
end
hold on
legend('building windows float processed','centroid1','building windows non float processed ','centroid2','vehicle windows float processed','centroid3','containers','centroid 4','tableware','centroid5','headlamps','centroid6''location','northwest');
hold off