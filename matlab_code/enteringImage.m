function finalText=enteringImage(A)
%A=imread('test1.jpg');
A1=impreprocess(A);
%% Taking out specific lines from an input image 
finalText=Extractrow(A1);   
%finalText

%%
%imshow(A1);