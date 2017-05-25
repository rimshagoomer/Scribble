function text=Extractrow(A)
    %imshow(A)
    lines=getSumOfRows(A);
    text='';
    %imshow(A);
    %hold on
    lines=[0 lines size(A,1)];
    %size(lines)
    %lines
    for j=1:size(lines,2)-1
        %We get a row here 
        temp=imcrop(A,[0 lines(j) size(A,2) lines(j+1)-lines(j) ]);
        %imshow(temp)
        temp=skewCorrection(temp);
     %   imshow(temp)
        ang=slantDetection(temp);
        ang;
        ang=90-ang;
        if ang <=20
        temp=slantCorrection(temp,ang);
        end
        %imshow(temp);
        t1=extractWords(temp);
        text=horzcat(text,t1);
        text=horzcat(text,' ');
        %text=strcat(text,'Hello');
        %plot([0 size(A,2)],[lines(j) lines(j)],'LineWidth',2,'Color','r');
    end
end