%This script saves the neural network weights, Theta1 and Theta2, to a tab
%delimited ASCII file whose name is dynamically generated based on the
%system time and date.

%get date and time strings
date_string = date;
time = fix(clock);
time_string = strcat(num2str(time(4)),'-',num2str(time(5)));

%concatenate time and date strings into filenames; accuracy, lambda, iterations, repetitions
Theta1_filename = char(strcat({'Theta1 '},date_string,{' '},time_string,{' '},num2str(accuracy,3),{' '},num2str(lambda),{' '},num2str(iterations),{' '},num2str(repetitions),'.txt'));
Theta2_filename = char(strcat({'Theta2 '},date_string,{' '},time_string,{' '},num2str(accuracy,3),{' '},num2str(lambda),{' '},num2str(iterations),{' '},num2str(repetitions),'.txt'));

%save the Theta1 and Theta2 variables using the filenames created above
save (Theta1_filename,'Theta1','-ascii', '-double', '-tabs');
save (Theta2_filename,'Theta2','-ascii', '-double', '-tabs');