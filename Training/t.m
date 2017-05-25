B=load('/second set/lab/labels10.txt');
B1=load('/second set/lab/labels11.txt');
B2=load('/second set/lab/labels12.txt');
B3=load('/second set/lab/labels13.txt');
B4=load('/second set/lab/labels14.txt');
B5=load('/second set/lab/labels15.txt');
B6=load('/second set/lab/labels16.txt');
B7=load('/second set/lab/labels17.txt');
B8=load('/second set/lab/labels18.txt');
B9=load('/second set/lab/labels19.txt');
B10=load('/second set/lab/labels20.txt');
%C=load('finallabels2.txt');
A=[];
A=[B B1 B2 B3 B4 B5 B6 B7 B8 B9 B10];
size(A)
fp=fopen('/second set/labelsnew2.txt','w');
fprintf(fp,'%d ',A);
D=load('/second set/labelsnew2.txt');
size(D)