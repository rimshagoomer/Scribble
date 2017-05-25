function [Thescore,p] = predict(temp)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)
% Useful values

X=mat2vect(temp);
score=0;

m1=[];
m2=[];
m1=load('mythetanew.txt');
Theta1=m1;%reshape(m1,[200,401]);

m2=load('mytheta2new.txt');
Theta2=m2;
m = size(X, 1);
%X=X';
%num_labels = size(Theta2, 1);
% You need to return the following variables correctly 
z1=[ones(m, 1) X] * Theta1';
h1 = 1.0 ./ (1.0 + exp(-z1));

z2=[ones(m, 1) h1] * Theta2';
h2 = 1.0 ./ (1.0 + exp(-z2));
Thescore=max(h2,[],2);
[~,p] = max(h2, [], 2);


% =========================================================================
end
