function [RMSE]=LOSE( U, V, R, Level)
%loss function

C=sum(sum(R>0));% the number of rating
Ruv= g(U'*V)*(Level-1)+1;% make prediction

Ruv0=Ruv.*(R&Ruv);
e=sum(sum((Ruv0-R).^2));
RMSE=sqrt(e/C);

end