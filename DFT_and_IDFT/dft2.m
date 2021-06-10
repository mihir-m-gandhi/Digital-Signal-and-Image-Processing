f = imread('fish.png');
subplot(1,4,1);
imshow(f);
title('Original Image');
f = double(rgb2gray(f));
subplot(1,4,2);
imshow(f,[]);
title('Grayscale');
n = size(f,2);  
k = zeros(n,n);

% DFT
for i = 1:n
    for j = 1:n
        if(i==1||j==1)
            k(i,j) = 1;    
        else
            arg = -2*pi*(i-1)*(j-1)/n;
            k(i,j) = complex(cos(arg),sin(arg)); 
        end
    end
end

DFT = (k * f * k);
subplot(1,4,3);
imshow(DFT);
title('DFT');

%IDFT
for i = 1:n
    for j = 1:n
        if(i==1||j==1)
            k(i,j) = 1;    
        else
            arg = 2*pi*(i-1)*(j-1)/n;
            k(i,j) = complex(cos(arg),sin(arg)); 
        end
    end
end

IDFT = (k * DFT * k)/n;
subplot(1,4,4);
imshow(IDFT,[]);
title('IDFT');