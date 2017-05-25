function ready_for_display = prepare_for_display(input)
% 1. Reshape the 35 x 400 array into 35 x (20 x 20 arrays)
% 2. Rotate the 35 arrays
% 3. Flip left-right the 35 arrays
% 4. Reshape each array into a 1x400 row and stack them into a 35 x 400 array
[m,n] = size(input);

ready_for_display = zeros(m,n);

for i=1:m
    reshaped = reshape(input(i,:),[20 20]);
    rotated = rot90(reshaped,3);
    flipped = fliplr(rotated);
    ready_for_display(i,:)= reshape(flipped,[1 400]);
end
end