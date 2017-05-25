function [cs] = getSumOfColumnsSeparate(line)
    x=[];
    for i = 1:size(line,2)
       
        j = size(line,1) + 1;
       
        % Iterate from bottom to top until we reach top or a pixel
        sum=0;
        while(j > 1)
            j = j - 1;
            sum=sum +line(j,i);
        end
        x(i)=sum;
    end
    count=1;
    f=0;
    
    y=[];
    for i=1:size(x,2)
        if x(i)==0 && f==0
            continue;
        else 
            f=1;
        end
        if x(i)<=0   
            y(count)= i;
            count=count+1;
        end       
    end
    y;
    cs=[];
    count=1;
      sum=0;
        n=0;
    y;
    for i=1:(size(y,2)-1)    
        
        if(y(i+1)-y(i)<=4)
            sum=sum+y(i);
            n=n+1;
        else
            %first threshold 
            if n>40
                cs(count)=round(sum/n)
                count=count+1;
            end
            
            sum=0;
            n=0 ;
        end
        
    end
    if n>1 
        cs(count)=round(sum/n);
    end
    cs;
    size(cs,2);
    
    end

  