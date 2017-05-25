function [Theta1,Theta2,cost] = Train_NN (training_set,training_labels,lambda,iterations)
%This function trains a neural network based on the training set given to
%it, the regularization parameter lambda and the number of iterations that
%the optimization function fmincg runs for

%The function outputs the weights of the NN, Theta1 and Theta2

%Define neural network structure:
input_layer_size = 400;
hidden_layer_size = 25;
num_labels = 10; % num_labels is equal to the output layer size

%random initialization of Theta1 and Theta2 weights to break symmetry
fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Training the Neural Network ===================
fprintf('\nTraining the Neural Network... \n')
options = optimset('MaxIter', iterations); %the more interations, the higher the accuracy

%The choice of lambda (the regularization parameter) and the number of
%iterations of the optimization function fmincg determines the quality of
%the trained NN parameters.

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, training_set, training_labels, lambda);

% Now, costFunction is a function that takes in only one argument (the neural network parameters)
[nn_params, cost_all] = fmincg(costFunction, initial_nn_params, options);
cost = cost_all(length(cost_all)); %keep only the final value of the cost, which has the smallest value

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)),hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

end
