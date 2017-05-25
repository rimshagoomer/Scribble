%plot the values of accuracy and cost for each lambda
figure('Name','Plots','Position', [200 150 900 500]);

subplot(2,1,1); plot(x_axis_of_learning_curve,average_cost_train,'--ms','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','m','MarkerFaceColor','m');
hold on
plot(x_axis_of_learning_curve,average_cost_CV,'--bs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','b','MarkerFaceColor','b');
hold off;
   
    title('Cost vs. lambda','fontweight','bold','fontsize',14);
    xlabel('m','fontweight','bold','fontsize',14);
    ylabel('Cost','fontweight','bold','fontsize',14);
figure(gcf);

subplot(2,1,2); 
    plot(x_axis_of_learning_curve,average_accuracy, '--bs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','b','MarkerFaceColor','b'); 
    title('Accuracy (on CV set) vs. lambda','fontweight','bold','fontsize',14);
    xlabel('m','fontweight','bold','fontsize',14);
    ylabel('Accuracy (%)','fontweight','bold','fontsize',14);   
