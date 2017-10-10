load matlab;

%% Train RBM for classification
%train rbm with 100 hidden units
data1(:,1)=data(:,3102);
data1(:,2)=data(:,1482);
data1(:,3)=data(:,4819);
data1(:,4)=data(:,4802);
data1(:,5)=data(:,4238);
data1(:,6)=data(:,2723);
data1(:,7)=data(:,1452);
data1(:,8)=data(:,172);
data=data1;
testdata1(:,1)=testdata(:,3102);
testdata1(:,2)=testdata(:,1482);
testdata1(:,3)=testdata(:,4819);
testdata1(:,4)=testdata(:,4802);
testdata1(:,5)=testdata(:,4238);
testdata1(:,6)=testdata(:,2723);
testdata1(:,7)=testdata(:,1452);
testdata1(:,8)=testdata(:,172);
testdata=testdata1;
m=rbmFit(data(1:90,:),90,labels(1:90,:),'verbose',true);
yhat=rbmPredict(m,data(50:100,:));
count=0;
for i=1:10
    if(testlabels(i)==yhat(i))
        count=count+1;
    end
end
%print error
fprintf('Classification accuracy using RBM with 9 hiddens is %f\n', ...
    ((count/72)*100));
for i=1:100
    if(labels(i)==2)
        labels(i)=2;
    else
        labels(i)=1;
    end
end
