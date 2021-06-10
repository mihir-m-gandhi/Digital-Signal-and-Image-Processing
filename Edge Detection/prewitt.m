x = imread('bfly.jpg');
subplot(2,3,1);
imshow(x,[]);
title('Original')

x = double(rgb2gray(x));
x = padarray(x, [1,1], 0, 'both');
subplot(2,3,2);
imshow(x,[]);
title('Grayscale (after padding)')
edgedetection = x;

[m,n] = size(x);



a = [-1,-1,-1; 0,0,0; 1,1,1];
for i = 2:m-1
    for j = 2:n-1
       b = [x(i-1,j-1)*a(1,1) x(i,j-1)*a(2,1) x(i+1,j-1)*a(3,1) x(i-1,j)*a(1,2) x(i,j)*a(2,2) x(i+1,j)*a(3,2) x(i-1,j+1)*a(1,3) x(i,j+1)*a(2,3) x(i+1,j+1)*a(3,3)];
       edgedetection(i,j) = sum(b);
    end
end
subplot(2,3,4);
edgedetection = uint8(edgedetection);
imshow(edgedetection);
title('Prewitt(x)');

a = [-1,0,1;-1,0,1;-1,0,1];
for i = 2:m-1
    for j = 2:n-1
       b = [x(i-1,j-1)*a(1,1) x(i,j-1)*a(2,1) x(i+1,j-1)*a(3,1) x(i-1,j)*a(1,2) x(i,j)*a(2,2) x(i+1,j)*a(3,2) x(i-1,j+1)*a(1,3) x(i,j+1)*a(2,3) x(i+1,j+1)*a(3,3)];
       edgedetection(i,j) = sum(b);
    end
end
subplot(2,3,5);
edgedetection = uint8(edgedetection);
imshow(edgedetection);
title('Prewitt(y)');

a = [-2, -1, 0; -1, 0, 1; 0, 1, 2];
for i = 2:m-1
    for j = 2:n-1
       b = [x(i-1,j-1)*a(1,1) x(i,j-1)*a(2,1) x(i+1,j-1)*a(3,1) x(i-1,j)*a(1,2) x(i,j)*a(2,2) x(i+1,j)*a(3,2) x(i-1,j+1)*a(1,3) x(i,j+1)*a(2,3) x(i+1,j+1)*a(3,3)];
       edgedetection(i,j) = sum(b);
    end
end
subplot(2,3,6);
edgedetection = uint8(edgedetection);
imshow(edgedetection);
title('Prewitt');

