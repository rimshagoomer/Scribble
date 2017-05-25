function arr=vect2mat(A,size1,size2)
k=1;
y=[];

for i=1:size1
    x=[];
    for j=1:size2
        x=[x A(k)];
        k=k+1;
    end
    y=[y;x];
end

arr=y;

