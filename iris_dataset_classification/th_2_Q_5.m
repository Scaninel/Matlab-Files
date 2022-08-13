M_training = 80;                  
M_test = 150-M_training;

load iris.mat;

ind=randperm(150);
train_iris = data(:,ind(1:M_training));
gnd_train_iris=classes(ind(1:M_training));

Iris_test = data(:,ind(M_training+1:end));
gnd_test_iris=classes(ind(M_training+1:end));

Avg =  mean(train_iris,2);

W=train_iris-repmat(Avg,[1 M_training]); 

M=W'*W; 
[V,D]=eigs(M,M_training);

U=W*V;
U=U./repmat(sqrt(sum(U.^2,1)),[size(U,1) 1]);

plot(diag(D))
title('Eigenvalues in descending order. Press any key.')
pause;

coefs=U'*W;


