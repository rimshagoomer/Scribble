function [J grad] = nnCostFunction(nn_params, input_layer_size,hidden_layer_size, num_labels, X, y, lambda)
                               
                               
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
%Theta1 and Theta2 have been reshaped into matrices by this point
             
% Setup some useful variables
m = size(X, 1); 
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

X = [ones(m,1) X]; %add a column of 1s to X

cost = zeros(m,1); %initiate this m x 1 cost vector as zeros

% calculate cost for each training example
y_matrix = zeros(m,num_labels); %matrix
predictions_matrix = zeros(m,num_labels);
for i=1:m %for every row, turn the scalar value of y into a vector, works
    flag=0;
    
    for j=1:num_labels
        if y(i)==j
            y_matrix(i,j)=1;
            flag=1;
        end
    end
    
    
    if flag==0
        y_matrix(i,62)=1;
    end 
    
end


for i=1:m %calculating the unregularized cost function
        
    %calculating h_theta_of_x, also known as a3
    
   a1 = (X(i,:))'; %a1, or the input training example, is a transposed row of X (after the ones have been added)
   z2 = Theta1 * a1; %adding the bias unit to the 2nd layer
   a2 = [1; sigmoid(z2)];
   z3 = Theta2 * a2;
   a3 = sigmoid(z3);
   h_theta_x = a3;  %the above steps are the forward propagation, in order to get the output values, based on the input training example and the current values of the weights of the network (Theta 1 and Theta2)
   % h_theta_x = a vector, num_labels x 1     
  
    predictions_matrix(i,:)= (h_theta_x)';
  
    y_i = (y_matrix(i,:))'; %transpose from row vector to column vector
    
    j1 = -y_i.*log(h_theta_x);

    j2 = (1-y_i).*log(1-h_theta_x);

    cost(i) = sum(j1 - j2);
   
end

unreg_component = (1/m)*sum(cost);

%regularization component

reg_theta1 = sum(sum((Theta1(:,2:end)).^2));

reg_theta2 = sum(sum((Theta2(:,2:end)).^2));

reg_component = (lambda/(2*m))*(reg_theta1 + reg_theta2);

J = unreg_component + reg_component; %average the cost over the number of training examples

%PART 2 PART 2 PART 2 PART 2 PART 2 PART 2 PART 2 PART 2 PART 2 PART 2 PART 2

% -------------------------------------------------------------
%calculate the gradients (the deltas for each unit - the error of each unit)
Big_delta_2 = 0;
Big_delta_1 = 0;

for i=1:m
    
%Step 1 - calculating the feedforward values of a1, z2, a2, z3, a3 for each
%training example
    a1 = (X(i,:))'; %a1, or the input training example, is a transposed row of X (after the ones have been added)
    z2 = Theta1 * a1; %adding the bias unit to the 2nd layer
    a2 = [1; sigmoid(z2)];
    z3 = Theta2 * a2;
    a3 = sigmoid(z3);
%--------------------------------------------------

%Step 2 - calculate delta3

    delta3 = a3 - (y_matrix(i,:)');
%--------------------------------------------------

%Step 3 - Backpropagate and calculate delta2

    Theta2_size = size(Theta2);
    delta3_size = size(delta3);
    z2_size = size(z2);

    intermed1 = ((Theta2')*delta3);
    intermed1 = intermed1(2:end);

    delta2 = intermed1.*sigmoidGradient(z2); %removed delta2(0) - the error corresponding to the bias unit

%--------------------------------------------------

%Step 3 - Accumulate the gradients
    Big_delta_1 = Big_delta_1 + delta2*(a1');
    Big_delta_2 = Big_delta_2 + delta3*(a2');
end
%step 5 - divide the accumulated gradients by m


unreg_Theta1_grad = (1/m)*Big_delta_1;
unreg_Theta2_grad = (1/m)*Big_delta_2;

interT1 = unreg_Theta1_grad(:,2:end) + (lambda/m)*Theta1(:,2:end);
Theta1_grad = [unreg_Theta1_grad(:,1) interT1];

interT2 = unreg_Theta2_grad(:,2:end) + (lambda/m)*Theta2(:,2:end);
Theta2_grad = [unreg_Theta2_grad(:,1) interT2];
%}
% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

