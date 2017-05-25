function [ R ]=impreprocess(A)
    
    
    %A=rgb2gray(A);
    %A= imbothat(A, strel('disk', 30));
    %imshow(A);
    %x=graythresh(A);
    %A=im2bw(A,.4);
    %imshow(A)
        %% Adding extra rows and columns 
    %A=[A;zeros(1,size(A,2))];
    %A=[zeros(1,size(A,2));A];
    %A=[zeros(size(A,1),1) A];
    %A=[A zeros(size(A,1),1)]; 
    %% done 
    A=imcomplement(A);
    
    A=bwareaopen(A,250);

    %imshow(A);
    %% done 
    %%Clearing borders 
    R=imclearborder(A,8);
    %imshow(R)

end