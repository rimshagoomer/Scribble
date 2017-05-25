function [x1,y1] = getLowerPixels(line)

% GETLOWERPIXELS. This function iterates from bottom to top and itretrieves 
% the first black pixel found for every column. This black pixel correspond
% to the lowest one in the column.

    x = [];
    y = [];

    count = 1;

    % Horizontal iteration
    for i = 1:size(line,2)
        not_found = 0;
        j = size(line,1) + 1;
        %fprintf('outer\n');
        % Iterate from bottom to top until we reach top or a pixel
        while(not_found == 0 && j > 1)
            j = j - 1;
            %fprintf('Hello\n');
            not_found = line(j,i);
        end
        
        % Store position
        if(not_found==1)
            x(count) = i;
            y(count) = j;
            count = count+1;
        end
    end
    
    for i= 1:count-1
        x1(i) = x(count-i);
        y1(i) = y(count-i);
    end
     
end