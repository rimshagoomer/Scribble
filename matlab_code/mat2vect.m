function [y]=mat2vect(inp)
y=[];
count=1;
for i=1:size(inp,1)
    for j=1:size(inp,2)
        y(count) = inp(i,j);
        count=count+1;
    end
end
