%% Initialization
clear; close all; clc

%% Setup the structure of the Neural Network: 400 input nodes (20x20 pixels); 25 hidden units; 10 output nodes (digits 0 to 9)
input_layer_size  = 400;  % 20x20 pixel images
hidden_layer_size = 230;% 25 hidden units
num_labels = 62;          % 10 labels, from 1 to 10, 10 being the label for the digit 0

%% =========== Part 1: Loading and Visualizing Data =============
% Load Training Data
fprintf('Loading and Visualizing Data ...\n')
training_set = importdata('data8746.txt');
mycvset=importdata('sentence.txt');
mylabels=importdata('t.txt');
labels = importdata('label8746.txt');

var=size(training_set,1);

rand_sel = randperm(var); %randomly shuffle the training examples
        seventy_per_cent = round(1*var);
        
 data_set = training_set(rand_sel(1:seventy_per_cent),:);
 [m n] = size(data_set);%assign 70% of the dataset to the training set
        labels=labels';
        training_labels = labels(rand_sel(1:seventy_per_cent),:); %assign 70% of the labels to the training set. The lables have been shuffled using the same random permutation as the training set, therefore they stay "in sync" with the training examples.
        training_labels=training_labels';

        cv_set = mycvset; %assign the rest of 30% of the dataset to the cross-validation set
        cv_labels = mylabels;

%% ================ Part 2: Initializing Pameters ================
%random initialization of Theta1 and Theta2 weights to break symmetry
fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size,num_labels);
% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Part 3: Training the Neural Network ===================

fprintf('\nTraining the Neural Network... \n')

lambda = 0;
options = optimset('MaxIter', 200); %the more interations, the better the accuracy

costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, data_set, training_labels, lambda);

% Now, costFunction is a function that takes in only one argument (the neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
my_Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)),hidden_layer_size, (input_layer_size + 1));
my_Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));
%a='rimi3'
%% ================= Part 4: Implement Predict =================
%fp1=fopen('mythetanew.txt','wt');
%fp2=fopen('mytheta2new.txt','wt');
%fprintf(fp1,'%f ',my_Theta1);
%fprintf(fp2,'%f ',my_Theta2);

dlmwrite('mythetanew.txt',my_Theta1,' ');
dlmwrite('mytheta2new.txt',my_Theta2,' ');

[predictions score] = find_predictions (cv_set);

for i=1:size(predictions)
    char(convert(predictions(i)))
end

accuracy = mean(double(predictions == cv_labels)) * 100;

accuracy

%% ================ Part 5: Identify the digits that were classified wrong =================
% display the digit, its label, and its prediciton if the prediction differs from the label
count=1;
fprintf ('Visualize the digits that were predicted wrong.\n');
size(cv_set,1)
size(cv_labels)

for i=1:size(cv_set,1)
    X=[];
    if predictions(i)~=cv_labels(i)
        
        char(convert(predictions(i)));
        score(i);
        char(convert(cv_labels(i)));
        %for j=1:400
        %X=[X cv_set(i,j)];
        %end
        %size(X);

        %showImage(X);
        %displayData(training_set(i, :),20);
         if predictions(i)-cv_labels(i)==26||predictions(i)-cv_labels(i)==-26
           count=count-1; 
        end
        count=count+1;
    else 
        
       
    end   
end
count
per=(double(size(cv_set,1)-count)*100/size(cv_set,1))