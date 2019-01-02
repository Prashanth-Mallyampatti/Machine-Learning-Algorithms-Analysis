%Generate Points
Sigma = [0.5 0.05; 0.05 0.5];
f1    = mvnrnd([0.5 0]  ,Sigma,50);
f2    = mvnrnd([0.5 0.5],Sigma,50);
f3    = mvnrnd([0.5 1]  ,Sigma,50);
f4    = mvnrnd([0.5 1.5],Sigma,50);
F     = [f1;f2;f3;f4];
%K-means
K     = 8;                               % Cluster Numbers
KMI   = 40;                              %k means iteration                             
CENTS = F( ceil(rand(K,1)*size(F,1)) ,:);          
DAL   = zeros(size(F,1),K+2);                         
CV    = '+r+b+c+m+k+yorobocomokoysrsbscsmsksy';       % Color Vector

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
plot(CENTS(:,1),CENTS(:,2),'*k','LineWidth',7);       
 end
axis([-0.5 2 -1 3])
hold off
grid on
pause(0.1)

end
