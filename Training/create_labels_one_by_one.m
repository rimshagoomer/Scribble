function my_labels = create_labels_one_by_one(my_training_set)

[m n] = size(my_training_set); %useful variables, m and n
my_labels = zeros (m,1);

for i=1:m;
displayData(my_training_set(i,:),20);%display each digit
prompt='Please enter the label of this digit: ';
my_labels(i)=input(prompt); %Type the label of the digit and record that value in the my_labels array
end

end

