function [cs1]=refineSegments(c)
     
     f1=0;
     count=1;
    for i=1:(size(c,2)-1)
     
        if f1==1
            f1=0;
            continue
        end
        %threshold value here 
        if(c(i+1)-c(i)<=15)
            cs1(count)=round((c(i)+c(i+1))/2);
            f1=1;
        else
            
            cs1(count)=c(i);
                f1=0;
            end
            count=count+1;

    end
end