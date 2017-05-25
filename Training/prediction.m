

m1=[]
m2=[]
m1=load('mytheta.txt');
mytheta1=reshape(m1,[200,401]);

m2=load('mytheta2.txt');
mytheta2=reshape(m2,[62,201]);

labels = importdata('Labels.txt'); %load the labels of the training examples

%mytheta1 = load('mytheta.txt')
%mytheta2 = load('mytheta2.txt')
cv_set=mycvset();
%cv_set=mat2vect(imread('rimilala.png'));
[m n] = size(cv_set);

pred=[]
for i=1:m
    x=[];
    for j=1:n
        x=[x cv_set(i,j)];
    end
    pred = [pred; predict(mytheta1, mytheta2, x)];
end
%pred=transpose(pred);
pred
sizepred=size(pred,1)
for i=1:sizepred
   if pred(i)>=11&&pred(i)<=36
       pred(i)=54+pred(i);
   elseif pred(i)>=1&&pred(i)<=10
        pred(i)=pred(i)-1;
   elseif pred(i)>=37&&pred(i)<=62
        pred(i)=60+pred(i);
   end
end
fpred=fopen('pred.txt','w');
fprintf(fpred,'%c ',pred);
pred
%fprintf('\nTraining Set Accuracy: %.3f  %%\n', mean(double(pred == labels)) * 100);
%% ================ Part 5: Identify the digits that were classified wrong =================
% display the digit, its label, and its prediciton if the prediction differs from the label

%fprintf ('Visualize the digits that were predicted wrong.\n');
%for i=1:m
 %   if pred(i)~=labels(i)
  %      displayData(cv_set(i, :),20);
   %     fprintf ('Example %.0f: The correct label is %.0f but the prediction was %.0f.\n', i, labels(i), pred(i));        
    %        if (i<m)
     %       fprintf ('The program is paused. Press any key to continue. \n');
      %      end
       % pause;
    %end   
%end
%end