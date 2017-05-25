function abc=mycvset()
arr=[]
arr=importdata('data12.txt');
y=[];
for i=1:10
    x=rand()*3410
    x=int64(x)
    y=[y x];
end
A=[];

for i=1:10
    x=[];
    k=y(i);
    for j=1:400
        x=[x arr(k,j)];
    end
    imshow(vect2mat(x,20,20))
    A=[A;x];
    pause;
end
abc=A;
%I = imread('rimi123.png');
%B=im2bw(I,graythresh(I));
%for i=1:size(B,2)
%    j=1;f=0;
%    while j< size(B,1)
        
 %       if B(j,i)==0
  %          f=1;
   %         break;
    %    end
      
        
     %   j=j+1;
    %end
     % if f==1
      %      break;
      %end
    
%end
%for a=size(B,2):-1:1
 %   b=1;f=0;
  %  while b< size(B,1)
   %     
    %    if B(b,a)==0
     %       f=1;
      %      break;
       % end
      %
        
       % b=b+1;
%end
 %     if f==1
  %          break;
   %   end
    
%end
%for c=1:size(B,1)
%    d=1;f=0;
 %   while d< size(B,2)
        
  %      if B(c,d)==0
   %         f=1;
    %        break;
     %   end
      
        
%  d=d+1;
 %   end
  %    if f==1
   %         break;
    %  end
    
%end
%for e=size(B,1):-1:1
 %   f=1;g=0;
  %  while f< size(B,2)
        
   %     if B(e,f)==0
    %        g=1;
     %       break;
      %  end
      
        
       % f=f+1;
    %end
     % if g==1
      %      break;
    %  end
    
%end
%C = imcrop(B,[i c (a-i) (e-c)]);
%D=imcomplement(C);
%D=imresize(D,[20,20]);
%D=mat2vect(D);
%abc=D;