

%% Initialization
tic %start timer

%% Setup the structure of the Neural Network: 400 input nodes (20x20 pixels); 25 hidden units; 10 output nodes (digits 0 to 9)
input_layer_size  = 400;  % 20x20 pixel images
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10, 10 being the label for the digit 0

%% =========== Part 1 =============
% Load Training Data
fprintf('Loading Data ...\n')

%% Important parameters
iterations = 100; %set number of iterations for fmincg
repetitions = 3;
range_of_lambda = [0];

%% Initialize with zeros
accuracy_comparison = zeros(repetitions,length(range_of_lambda));
cost_comparison = zeros(repetitions,length(range_of_lambda));

%% Use a waitbar to display the progress
denominator = repetitions*length(range_of_lambda);
waitbar(0,'Calculation in progress...');

%% =========== For loop =============
for i=1:repetitions
    j=0;
        
    for lambda = range_of_lambda
        j=j+1;
        %Dividing the data into training set (60%), cross-validation set (20%), test set (20%)
        rand_sel = randperm(m); %randomly shuffle the training examples
        seventy_per_cent = round(0.7*m);
        
        training_set = dataset(rand_sel(1:seventy_per_cent),:); %assign 70% of the dataset to the training set
        training_labels = labels(rand_sel(1:seventy_per_cent),:); %assign 70% of the labels to the training set. The lables have been shuffled using the same random permutation as the training set, therefore they stay "in sync" with the training examples.

        cv_set = dataset(rand_sel((1+seventy_per_cent):end),:); %assign the rest of 30% of the dataset to the cross-validation set
        cv_labels = labels(rand_sel((1+seventy_per_cent):end),:); %assign 30% of the labels to the CV set

        fprintf('\nNumber of training examples: %.0f\n',size(training_set,1));
        fprintf('Number of cross-validation examples: %.0f\n',size(cv_set,1));
      
        % Train_NN
        [Theta1,Theta2,cost] = train_NN (training_set,training_labels,lambda,iterations);

        % Test on CV set (predict function)
        predictions = find_predictions (cv_set, Theta1, Theta2);

        %Find the accuracy on the cross-validation set
        accuracy = mean(double(predictions == cv_labels)) * 100;

        accuracy_comparison(i,j) = accuracy;
        cost_comparison(i,j) = cost;
        
        fprintf ('\nThe accuracy on the cross-validation set is: %.1f and the cost is %f. Lambda=%.2f, No. of iterations=%.0f.  \n',accuracy,cost,lambda,iterations);
        
        %Update progress bar
        progress_bar = (j+length(range_of_lambda)*(i-1))/denominator;
        waitbar(progress_bar);
    end
end
% Get the average of accuracy and cost for each value of lambda.
average_accuracy = mean(accuracy_comparison);
average_cost = mean(cost_comparison);

% Plot the accuracy and cost vs. lambda
plot_accuracy_and_cost_vs_lambda;

% Find the execution time 
toc