function B = showImage(C)
B=[];
size(C)
l=1;
    n=1;
    for j=1:400
       B(l,n)=C(j);
       n=n+1;
       
       if n == 21
        n=1;
        l=l+1;
         
        
       end
imshow(B);
end