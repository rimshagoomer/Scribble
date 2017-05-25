function abc=myscript()

    I = imread('rim1.jpg');
    Igray = rgb2gray(I);
    imshow(Igray)
    pause;
    
     Ibw = im2bw(Igray,graythresh(Igray));
      imshow(Ibw)
    pause;
    Iedge = edge(uint8(Ibw));
     imshow(Iedge)
    pause;
    se = strel('square',2);
    %Ifill=Ibw;
    %Ifill=bwmorph(Ibw,'skel',Inf);
    
    
   

%fp=fopen('Training set.txt','w');

    Iedge2 = imdilate(Iedge, se);
    Ifill= imfill(Iedge2,'holes');
     imshow(Ifill)
    pause;
    [Ilabel num] = bwlabel(Ifill);

    while 1
        [fl Ifill]=line_extract(Ifill);
        imgn=fl;
        [Ilabel num] = bwlabel(imgn);
    
        bb  = regionprops(Ilabel,'BoundingBox');
        boundingboxes = cat(1, bb.BoundingBox);
        x=[]
        hold on
        for k = 1:size(boundingboxes,1)
            rectangle('position',boundingboxes(k,:),'Edgecolor','r')
            subImage=imcrop(imgn,bb(k).BoundingBox);
            subImage=imresize(subImage,[40 10]);
            subImage=reshape(subImage,1,400);
        %fprintf(fp,'%d \n',subImage);
            x=[x;subImage];
        end
        y=[y;x];
        if isempty(Ifill)  %See variable 're' in Fcn 'lines'
            break
        end
    end
%fclose(fp);
abc=y;
