A = imread('taj.bmp');
B = zeros(130,130,'uint8');

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

nimg = imnoise(B,'salt & pepper',0.02);

for i=2:129
    for j=2:129
        F(i,j) = mfilter(i-1,j-1,nimg);
    end
end

subplot(1,2,1);
imshow(B);
title('Original Image');
subplot(1,2,2);
imshow(F);
title({['Image without noise'],['Median Filter']});

function val = mfilter(x,y,B)
    temp = zeros(1,9);
    k=1;
    p=x;
    q=y;
    for i=1:3
        for j=1:3
            temp(k)=B(p,q);
            k=k+1;
            q=q+1;
        end
        q=y;
        p=p+1;
    end
    
    for i=1:9
        for j=1:9
            if(temp(j)<temp(i))
                t=temp(j);
                temp(j)=temp(i);
                temp(i)=t;
            end
        end
    end
    val = temp(5);
end