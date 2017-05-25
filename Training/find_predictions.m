function [predictions score] = find_predictions (dataset)

Theta1=load('mythetanew.txt');
Theta2=load('mytheta2new.txt');
v=size(dataset,1);


z1=[ones(v, 1) dataset] * Theta1';
h1 = 1.0 ./ (1.0 + exp(-z1))

z2=[ones(v, 1) h1] * Theta2';
h2 = 1.0 ./ (1.0 + exp(-z2))
score=max(h2, [], 2);
[~,predictions] = max(h2, [], 2);
predictions

end




