function [cs1 cs] = getSumOfColumns(line)
    x=[];f=0;
    dif_ind=[];
    for i = 1:size(line,2)
       
        j = size(line,1) + 1;
       x1=0;
       x2=0;
       f1=0;
        % Iterate from bottom to top until we reach top or a pixel
        sum=0;
        dif=0;
        while(j > 1)
            j = j - 1;
            sum=sum +line(j,i);
            if line(j,i)==1 && f1==0
                x1=j;f1=1;
            end
        end
        x(i)=sum;
        
        j=1;
        while j< size(line,1)+1
            if line(j,i)==1
            
            x2=j;
            break;
            end
        j=j+1;    
        end
        if x2<=x1
            dif_ind(i)=x1-x2;
        else
            dif_ind(i)=0;
        end
    end
   %dif_ind
   %x
    for i=1:size(line,2)
        if dif_ind(i)<4 && (x(i)==2||x(i)==3||x(i)==4)
            x(i)=1;
       end
    end
    %x
    count=1;
    f=0;
    
    y=[];
    for i=1:size(x,2)
        if x(i)==0 && f==0
            continue;
        else 
            f=1;
        end
        if x(i)<=1   
            y(count)= i;
            count=count+1;
        end       
    end
    %y
    cs=[];
    count=1;
    sum1=0;n1=0;
    sum0=0;n0=0;
    sum=0;
        n=0;
    for i=1:(size(y,2)-1)    
        
        if(y(i+1)-y(i)<=3)
            if x(y(i))==0
                sum0=sum0+y(i);
                n0=n0+1;
            end
            if x(y(i))==1
                sum1=sum1+y(i);
                n1=n1+1;
            end
            %sum=sum+y(i);
            %n=n+1;
            n=n1+n0;
        else

            if n>1
                %if sum1 ~=0 &&sum0 ~=0
                %cs(count)=round((round(sum1/n1)+2*round(sum0/n0))/3)
                if sum0==0
                    if n1>8
                    cs(count)=(round(sum1/n1));
                    end
                else
                    cs(count)=(round(sum0/n0));
                end
                
                count=count+1;
            %else
             %   if (x(y(i)-1)==1 | x(y(i)-1)==0)
              %  cs(count)=y(i);
               % count=count+1;
                %end
            end
            sum1=0;n1=0;
            sum0=0;n0=0;
            sum=0;
            n=0 ;
        end
        
    end
    if n>1
                %if sum1 ~=0 &&sum0 ~=0
                %cs(count)=round((round(sum1/n1)+2*round(sum0/n0))/3)
                if sum0==0
                    cs(count)=(round(sum1/n1));
                else
                    cs(count)=(round(sum0/n0));
                end
    end            
    %cs
    %size(cs,2)
    cs1=[];
    count=1;
    f=0;
    cs=sort(cs);
    for i=1:(size(cs,2)-1)
     
        if f==1
            f=0;
            continue
        end
        %threshold value here 
        if(cs(i+1)-cs(i)<=25)
            cs1(count)=round((cs(i)+cs(i+1))/2);
            f=1;
        else
            
            cs1(count)=cs(i);
                f=0;
            end
            count=count+1;

    end
        if count~=1    
        if abs(cs1(count-1)-cs(size(cs,2)))>15
        cs1(count)=cs(size(cs,2));
        %else
        %cs1(count-1)=(round(cs(size(cs,2)-1)+cs(size(cs,2)))/2);
        end
        end
     %   cs1
    end

  