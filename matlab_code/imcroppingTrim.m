function A= imcroppingTrim(B)
%imshow(B);
B=imcomplement(B);
%imshow(B);
for i=1:size(B,2)
    j=1;f=0;
    while j< size(B,1)
        
        if B(j,i)==0
            f=1;
            break;
        end
      
        
        j=j+1;
    end
      if f==1
            break;
      end
    
end
for a=size(B,2):-1:1
    b=1;f=0;
    while b< size(B,1)
        
        if B(b,a)==0
            f=1;
            break;
        end
      
        
        b=b+1;
    end
      if f==1
            break;
      end
    
end
for c=1:size(B,1)
    d=1;f=0;
    while d< size(B,2)
        
        if B(c,d)==0
            f=1;
            break;
        end
      
        
        d=d+1;
    end
      if f==1
            break;
      end
    
end
for e=size(B,1):-1:1
    f=1;g=0;
    while f< size(B,2)
        
        if B(e,f)==0
            g=1;
            break;
        end
      
        
        f=f+1;
    end
      if g==1
            break;
      end
    
end
%imshow(B)
%hold on
%plot([i i],[0 900],'LineWidth',1,'Color','r')
%plot([a a],[0 900],'LineWidth',1,'Color','r')
%plot([0 900],[c c],'LineWidth',1,'Color','r')
%plot([0 900],[e e],'LineWidth',1,'Color','r')
%hold off
C = imcrop(B,[i c (a-i) (e-c)]);
%imshow(C)
C=imresize(C,[16 16]);
A=imcomplement(C);
    A=[A;zeros(1,size(A,2))];
    A=[zeros(1,size(A,2));A];
    A=[zeros(size(A,1),1) A];
    A=[A zeros(size(A,1),1)];
 %size(A)
    A=[A;zeros(1,size(A,2))];
    A=[zeros(1,size(A,2));A];
    A=[zeros(size(A,1),1) A];
    A=[A zeros(size(A,1),1)];
  %  imshow(A)
   % size(A)
end