function linestr=extractWords(line)
    line=imcropping(line);
    %line=[zeros(size(line,1),1) line];
    %line=[line zeros(size(line,1),1)];
    c1=getSumOfColumnsSeparate(line);
    c1=[1 c1];
    linestr='';
    c1=[c1 size(line,2)];
    %c1=refineSegments(c1);
    count=1;
    %imshow(line);
    %hold on 
    for word_no=1:size(c1,2)-1
        tempw=imcrop(line,[c1(word_no) 0 c1(word_no+1)-c1(word_no) size(line,2)]);
        ang=slantDetection(tempw);
        ang;
        ang=90-ang;
        if ang>0 && ang <=20
        tempw=slantCorrection(tempw,ang);
        end
        
        st=wordSegment(tempw);
        linestr=horzcat(linestr,st);
        linestr=horzcat(linestr,' ');
        %imshow(tempw);
        %lot([c1(word_no) c1(word_no)],[0 size(line,1)],'LineWidth',2,'Color','r');
    end


end 