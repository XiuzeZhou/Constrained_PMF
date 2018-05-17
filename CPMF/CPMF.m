function [ Y, V, W, RMSE ] = CPMF( Test , Train, K, eta, lambda_Y, lambda_V, lambda_W, Max)

%Y: the offset matirx
%V: item latent feature matrix
%W: the latent similarity constraint matrix
%Test: the test data
%Train: the train data
%K: the number of latent feature
%eta: the learning rate
%lambda_Y, lambda_V, lambda_W: the regularization paramaters
%Max: the max iteration

%% get N and M from data set
N = max( Train(:,1) ); % N: the number of user
M = max( Train(:,2) ); % M: the number of item
Level = max( Train(:,3) ); % the max rating
n = max( Test(:,1) );
m = max( Test(:,2) );
if N < n
    N = n;
end
if M < m
    M = m;
end

%% get the rating matrix R from Test data set£¬
% andget the indicator matrix I from Train data set
R = zeros( N, M );
I = zeros( N, M );
G = zeros( N, M );%ÌÝ¶È

T = size( Test, 1 );
for t = 1:T
    i = Test(t,1); % user id
    j = Test(t,2); % item id
    rij = Test(t,3); % rating
    R(i,j) = rij;
end

T = size( Train, 1 );
for t = 1:T
    i = Train(t,1); % user id
    j = Train(t,2); %item id
    I(i,j) = 1; % rating
end

%% random initialization
Y = randn( K, N );
V = randn( K, M );
W = randn( K, M );
U = Y;
T = size( Train, 1 );
RMSE(1)=LOSE( U, V, R, Level );
for step=1:Max
    for t=1:T
        i=Train(t,1); %user id
        j=Train(t,2); %item id
        rij=Train(t,3); % rating
        tij=(rij-1)/(Level-1);

        Ii=I(i,:);
        Yi=Y(:,i);
        Vj=V(:,j);

        U(:,i)=Yi+W*Ii'./(sum(Ii,2));
        Ui=U(:,i);
        
        gij=g(Ui'*Vj);
        dgij=dg(Ui'*Vj);
        G(i,j)=dgij;
        eij=tij-gij;       
        Y(:,i)=(1-lambda_Y*eta)*Yi+eta*eij*dgij*Vj;
        V(:,j)=(1-lambda_V*eta)*Vj+eta*eij*dgij*Ui;
        W=(1-lambda_W*eta)*W+eta*eij*dgij/(sum(Ii,2))*repmat(Vj,1,M);
        
    end
    RMSE(step+1)=LOSE( U, V, R, Level );
    disp(step);
    if mod(step-1,10)==0
        disp(step);
   end
end

end

