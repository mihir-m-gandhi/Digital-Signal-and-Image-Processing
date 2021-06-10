A = imread('taj.bmp');
B = zeros(130,130,'uint8');
LP = ones(3,3);

x = 2;
y = 2;
for i=1:128
    for j=1:128
        B(x,y) = A(i,j);
        y = y + 1;
    end
    y = 2;
    x = x + 1;
end

for i=2:129
    for j=2:129
        C(i,j) = filter(i-1,j-1,B,LP)/9;
    end
end

subplot(1,2,1);
imshow(B);
title('Original Image');

subplot(1,2,2);
imshow(C);
title('Low Pass Filtered');

function sum = filter(x,y,B,F)
    p=x;
    q=y;
    T = zeros(3,3);
   for i=1:3
       for j=1:3
           T(i,j) = B(p,q);
           q = q + 1;
       end
       q = y;
       p = p + 1;
   end

   T = F .* T;
   sum = 0;
   for i=1:3
       for j=1:3
            sum = sum + T(i,j);
       end
   end
end