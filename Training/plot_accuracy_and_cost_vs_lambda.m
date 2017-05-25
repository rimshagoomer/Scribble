%plot the values of accuracy and cost for each lambda
figure('Name','Plots','Position', [200 150 900 500]);
subplot(2,1,1); 
    plot(range_of_lambda,average_accuracy, '--bs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','b','MarkerFaceColor','b'); 
    title('Accuracy (on CV set) vs. lambda','fontweight','bold','fontsize',14);
    xlabel('lambda','fontweight','bold','fontsize',14);
    ylabel('Accuracy (%)','fontweight','bold','fontsize',14);
    
subplot(2,1,2); plot(range_of_lambda,average_cost,'--bs','LineWidth',2,'MarkerSize',8,'MarkerEdgeColor','b','MarkerFaceColor','b');
    title('Cost function value vs. lambda','fontweight','bold','fontsize',14);
    xlabel('lambda','fontweight','bold','fontsize',14);
    ylabel('Cost','fontweight','bold','fontsize',14);
figure(gcf);
