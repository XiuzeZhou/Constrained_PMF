%% read Movielens100K data set
data = textread('u.data'); % read data
rate = 0.8; % the rate of train data
[M,N] = size(data);
L = randperm(M);% random index
Train = data(L(1:M*rate),:);
Test = data(L(M*rate+1:M),:);

%% set paramaters
K = 5; % the number of latent feature
eta = 0.005; % the learning rate
lambda_Y = 0.8; % the regularization paramater for Y
lambda_V = 0.8; % the regularization paramater for V
lambda_W = 0.8; % the regularization paramater for W
Max = 30; % the max iteration

[ Y, V, W, RMSE ] = CPMF( Test , Train, K, eta, lambda_Y, lambda_V, lambda_W, Max);