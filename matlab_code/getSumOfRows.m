function [cs] = getSumOfRows(line)
    x=[];
    for i = 1:size(line,1)
       
        j = size(line,2) + 1;
       
        % Iterate from bottom to top until we reach top or a pixel
        sum=0;
        while(j > 1)
            j = j - 1;
            sum=sum +line(i,j);
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
    for i=1:(size(y,2)-1)    
        
        if(y(i+1)-y(i)<=4)
            sum=sum+y(i);
            n=n+1;
        else

            if n>1
                cs(count)=round(sum/n);
                count=count+1;
            else
                if (x(y(i)-1)==1 | x(y(i)-1)==0)
                cs(count)=y(i);
                count=count+1;
                end
            end
            
            sum=0;
            n=0 ;
        end
        
    end
   % cs;
    
    %size(cs,2)
    cs1=[];
    count=1;
    f=0;
    for i=1:(size(cs,2)-1)
     
        if f==1
            f=0;
            continue
        end
        if(cs(i+1)-cs(i)<=30)
            cs1(count)=round((cs(i)+cs(i+1))/2);
            f=1;
        else
            
            cs1(count)=cs(i);
                f=0;
            end
            count=count+1;

        end
        %cs1(count)=cs(i+1);
    end

  
  