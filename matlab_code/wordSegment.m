function str=wordSegment(A)
    A=imcropping(A);
    %imshow(A);
    A1 = bwmorph(A,'skel',Inf);
    A1=removeSpuriousEdges(A1);
    arr =getSumOfColumns(A1);
    %arr=refineSegments(arr);
    arr;
    str='';
    if size(arr,2)>0 && arr(1)-1>20
    arr=[1 arr];
    end
    %htreshold value 
    if size(arr,2)>0 && size(A1,2)-arr(size(arr,2)) >20
    arr=[arr size(A1,2)];
    end
    %threshhold value 
    if size(arr,2)>=2 && arr(2)-arr(1)<10
        arr(2)=arr(1);
    end
    %imshow(A1);
    arr;
    %hold on
    p=0;
    
    for letter_no=1:size(arr,2)-1
        %templ=imcrop();  
        %ltemp=imcrop(A,[arr(letter_no) 0 arr(letter_no+1)-arr(letter_no) size(A,1)]);
        %ltemp=imcroppingTrim(ltemp);
        %size(ltemp)
        %imshow(ltemp);
        %templ=imcrop();
        if arr(letter_no)==arr(letter_no+1)
            continue;
        end
        if p==2
                p=0;
                continue;
            end
            if p==3
                p=2;
                continue;
            end
            ltemp=imcrop(A,[arr(letter_no) 0 arr(letter_no+1)-arr(letter_no) size(A,1)]);
            imclearborder(ltemp,4);
            %threshold 
            bwareaopen(ltemp,100);
            
            ltemp=imcroppingTrim(ltemp);
            filter_size = 3;
            sigma = 0.3;
            h = fspecial('gaussian', filter_size, sigma); 
            ltempx=imadjust(ltemp);
            %ltempx = imfilter(ltemp, h, 'replicate');
            %ltemp=imresize(ltemp,[20 20]);
            %imshow(ltemp);
            %ltempx=imsharpen(ltemp);
            %imshow(ltemp)
            size(ltemp);
            %imshowpair(ltemp,ltempx,'montage');
            [score1 r1]=predict(ltemp);
            char(convert(r1));
            char(convert(r1));
            if letter_no+2 <=size(arr,2)
                ltemp1=imcrop(A,[arr(letter_no) 0 arr(letter_no+2)-arr(letter_no) size(A,1)]);
                %figure(4)
                %imshow(temp);
                ltemp1=imcroppingTrim(ltemp1);
                %ltemp1=imresize(ltemp1,[20,20]);
                
                %imshow(ltemp1);
        
                [score2 r2]=predict(ltemp1);
                char(convert(r2)); 
                char(convert(r2));
            else 
                score2=-1;
                r2=-1;
            end
            if letter_no+3 <=size(arr,2)
                ltemp2=imcrop(A,[arr(letter_no) 0 arr(letter_no+3)-arr(letter_no) size(A,1)]);
                %figure(4)
                %imshow(ltemp2);
                ltemp2=imcroppingTrim(ltemp2);
                %ltemp2=imresize(ltemp2,[20,20]);
                
                %imshow(ltemp);
        
                [score3 r3]=predict(ltemp2);
                char(convert(r3)) ;
                char(convert(r3));
            else 
                score3=-1;
                r3=-1;
            end
            
            fscore=max([score1 score2 score3]);
            if fscore==score1
                fr=r1;
                p=1;
                ftemp=ltemp;
            elseif fscore==score2
                fr=r2;
                p=2;
                ftemp=ltemp1;
            else
                p=3;
                fr=r3;
                ftemp=ltemp2;
            end
            fscore;
            %imshow(ftemp);
            char(convert(fr));
            str=strcat(str,char(convert(fr)));
        %plot([arr(letter_no) arr(letter_no)],[0 size(A,1)],'LineWidth',2,'Color','r');
    end
    
end