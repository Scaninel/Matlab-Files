training_data = 80;                  
test_data = 150-training_data;

load iris.mat;

ind=randperm(150);
train_iris = data(:,ind(1:training_data));
gnd_train_iris=classes(ind(1:training_data));

test_iris = data(:,ind(training_data+1:end));
gnd_test_iris=classes(ind(training_data+1:end));

Avg =  mean(train_iris,2);

W=train_iris-repmat(Avg,[1 training_data]); 

M=W*W';

[V,D]=eigs(M,size(M,2));

plot(diag(D),'r')
title('Eigenvalues of training data')

U=V./repmat(sqrt(sum(V.^2,1)),[size(V,1) 1]);

