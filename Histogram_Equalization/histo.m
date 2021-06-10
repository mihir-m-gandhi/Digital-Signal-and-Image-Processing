a = imread('drag.jpg');
%imshow(a);

b = rgb2gray(a);
subplot(2,2,1);
imshow(b);

subplot(2,2,3);
histogram(b,256);

[m,n] = size(b);
c = zeros(256,1);       % not uint8 but double, as uint8 can have a maximum value of 255 only


for i = 1:m
    for j = 1:n     
       c(b(i,j)+1,1) = c(b(i,j)+1,1) + 1;        % add 1 as index cannot be 0, min index=1
    end
end

for i = 2:256
    c(i,1) = c(i,1) + c(i-1,1);
end


for i = 1:256
    c(i,1) = round(c(i,1) * 255 / (m*n));
end

d=b;
for i = 1:m
    for j = 1:n     
       d(i,j) = c(b(i,j)+1,1);
    end
end

subplot(2,2,2);
imshow(d);

subplot(2,2,4);
histogram(d,256);



