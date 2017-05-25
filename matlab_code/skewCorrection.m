function [newline] = skewCorrection(line)

% SKEWCORRECT. This function takes a line as input and it returnes a new 
% line with corrected skew and the baseline.
    %line = rgb2gray(line);

    [x, y] = getLowerPixels(line);
      
    p = polyfit(x, y, 1);
    y2 = polyval(p,x);

    
    slope = atan(p(1))*180/pi;
   
    newline = imrotate(line, slope);



end