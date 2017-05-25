function [fl Ifill]=line_extract(im_texto)

im_texto=clip(im_texto);
imshow(im_texto)
num_filas=size(im_texto,1);
for s=1:num_filas
    if sum(im_texto(s,:))==0
        nm=im_texto(1:s-1, :); % First line matrix
        rm=im_texto(s:end, :);% Remain line matrix
        fl = clip(nm);
        Ifill=clip(rm);
        %*-*-*Uncomment lines below to see the result*-*-*-*-
              %   subplot(2,1,1);imshow(fl);
               %  subplot(2,1,2);imshow(Ifill);
        break
    else
        fl=im_texto;%Only one line.
        Ifill=[ ];
    end
end
function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));%Crops image4
end
end
