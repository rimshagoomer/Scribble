fp=fopen('labels.txt','w');
A=[];
for i=1:62
    for j=1:55
        A=[A i];
    end
end
fprintf(fp,'%d ',A);