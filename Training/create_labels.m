function my_labels = create_labels(my_training_set)

[m n] = size(my_training_set); %useful variables, m and n
my_labels = zeros (m,1);
fp=fopen('Labels.txt','wt');
for i=1:m;
displayData(my_training_set(i,:),20);%display each digit
prompt='Please enter the label of this digit: ';
my_labels(i)=input(prompt); 
%my_labels(i)=0;
%Type the label of the digit and record that value in the my_labels array
end
fprintf(fp,'%d ',my_labels);
end

