training_data = 80;                  
test_data = 150-training_data;

load iris.mat;

ind=randperm(150);
train_iris = data(:,ind(1:training_data));
gnd_train_iris=classes(ind(1:training_data));

test_iris = data(:,ind(training_data+1:end));
gnd_test_iris=classes(ind(training_data+1:end));

for j=1:80
    for k=1:70
        dst(k,j)=sqrt((test_iris(1,k)-train_iris(1,j))^2+(test_iris(2,k)-train_iris(2,j))^2+(test_iris(3,k)-train_iris(3,j))^2+(test_iris(4,k)-train_iris(4,j))^2);
    end
end

[M,I]=min(dst,[],2);

class_test_iris=gnd_train_iris(:,I);

conf_mat=confusionmat(gnd_test_iris,class_test_iris);

conf_mat
