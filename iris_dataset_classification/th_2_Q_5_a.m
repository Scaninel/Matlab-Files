training_data = 80;                  
test_data = 150-training_data;

load iris.mat;

ind=randperm(150);
train_iris = data(:,ind(1:training_data));
gnd_train_iris=classes(ind(1:training_data));

test_iris = data(:,ind(training_data+1:end));
gnd_test_iris=classes(ind(training_data+1:end));