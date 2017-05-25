function final_line = slantCorrection(line, angle)

    % Transformation
    tf = [1 0 0; tand(angle) 1 0; 0 0 1];
    tform = maketform('affine', tf);
    corrected_line = imtransform(line, tform);
    
    final_line=corrected_line;

    %final_line = removeBlackCorners(corrected_line);
%     final_line = invertBwImage(corrected_line);
    
%     borders = extractBoundingBox(corrected_line, 1);
%     final_line = corrected_line(borders(3):borders(4), borders(1):borders(2));
%     
%     % We extract the final line from the increased image
%     stepX = floor(0.1 * w);
%     final_line = corrected_line(:, floor(w/2) - stepX : 3*floor(w/2)-1 + stepX, :);
     
%     figure, imshow(final_line,[]);
%     title('After Slant Correction');

end