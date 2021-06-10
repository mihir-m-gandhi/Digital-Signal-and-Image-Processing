x = imread('drag.jpg');
subplot(2,4,1);
imshow(x,[]);
title('Original')

x = rgb2gray(x);
x = padarray(x, [1,1], 0, 'both');
noise = x;
subplot(2,4,2);
imshow(x,[]);
title('Grayscale (after padding)')

filtered = noise;
[m,n] = size(noise);
noise2 = imnoise(x, 'gaussian');
subplot(2,4,3);
imshow(noise2,[]);
title('Gaussian noise added');
a = [1, 1, 1; 1, 1, 1; 1, 1, 1];
for i = 2:m-1
    for j = 2:n-1
        b = [noise2(i-1,j-1)*a(1,1) noise2(i,j-1)*a(2,1) noise2(i+1,j-1)*a(3,1) noise2(i-1,j)*a(1,2) noise2(i,j)*a(2,2) noise2(i+1,j)*a(3,2) noise2(i-1,j+1)*a(1,3) noise2(i,j+1)*a(2,3) noise2(i+1,j+1)*a(3,3)];
        filtered(i,j) = sum(b)/9;
    end
end

subplot(2,4,4);
imshow(filtered,[]);
title('Low Pass Filter')

filtered1 = noise;
noise = double(noise);
[m,n] = size(noise);

a = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
for i = 2:m-1
    for j = 2:n-1
        b = [noise(i-1,j-1)*a(1,1) noise(i,j-1)*a(2,1) noise(i+1,j-1)*a(3,1) noise(i-1,j)*a(1,2) noise(i,j)*a(2,2) noise(i+1,j)*a(3,2) noise(i-1,j+1)*a(1,3) noise(i,j+1)*a(2,3) noise(i+1,j+1)*a(3,3)];
        filtered1(i,j) = sum(b);
    end
end

subplot(2,4,7);
imshow(filtered1,[]);
title('High Pass Filter')

noise1 = imnoise(x, 'salt & pepper');
subplot(2,4,5);
imshow(noise1,[]);
title('Salt & Pepper noise added')
[m,n] = size(noise1);
filtered2 = zeros(m,n);
for i = 2:m-1
    for j = 2:n-1
        filtered2(i,j) = median([noise1(i-1,j-1) noise1(i,j-1) noise1(i+1,j-1) noise1(i-1,j) noise1(i,j) noise1(i+1,j) noise1(i-1,j+1) noise1(i,j+1) noise1(i+1,j+1)]);
    end
end

subplot(2,4,6);
imshow(filtered2,[]);
title('Median Filter')

filtered2 = x;
a = [-1, -1, -1; -1, 9, -1; -1, -1, -1];
a = a/9;
for i = 2:m-1
    for j = 2:n-1
        b = [noise(i-1,j-1)*a(1,1) noise(i,j-1)*a(2,1) noise(i+1,j-1)*a(3,1) noise(i-1,j)*a(1,2) noise(i,j)*a(2,2) noise(i+1,j)*a(3,2) noise(i-1,j+1)*a(1,3) noise(i,j+1)*a(2,3) noise(i+1,j+1)*a(3,3)];
        filtered2(i,j) = sum(b);
    end
end

subplot(2,4,8);
imshow(filtered2,[]);
title('High Boost Filter')




