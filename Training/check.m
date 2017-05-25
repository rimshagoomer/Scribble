%fp=fopen('data123.txt','w');
%fprintf(fp,'%d\t',A);
dataset=load('data4178.txt');
size(dataset)

labels=load('labels4178.txt');
[m n]=size(dataset)
m
n
B=[];
%label=zeros(m,1);
sel = randperm(m);
    k=sel(1);
    l=1;
    n=1;
    for j=1:400
       B(l,n)=dataset(k,j);
       n=n+1;
       
       if n == 21
        n=1;
        l=l+1;
         
        
       end
       % if j%30 == 0
        %   l=l+1;
         %  n=1;
       %end
       
    end
    size(B)
    imshow(B);
    size(B)
    pred=labels(k)
   if pred>=11&&pred<=36
       pred=54+pred;
   elseif pred>=1&&pred<=10
        pred=pred+47;
   elseif pred>=37&&pred<=62
        pred = 60+pred;
   end
    char(pred)
    
%fprintf(fp,'%s\r\n','');
%fprintf(fp,'%d ',A);
