a=imread('drag.jpg');
figure(1);
imshow(a);
b=rgb2gray(a);
figure(2);
imshow(b);

c = 255.-b;
figure(3);
imshow(c);

[m,n] = size(b);

d = b;
t = input('Enter the threshold value: ');
for i = 1:m
    for j = 1:n
        if b(i,j)>=t
            d(i,j) = 255;
        else
            d(i,j) = 0;
        end
    end
end
figure(4);
imshow(d);

lower = input('Enter the lower limit of the range: ');
upper = input('Enter the upper limit of the range: ');

e=b;
for i = 1:m
    for j = 1:n
        if b(i,j)>=lower && b(i,j)<=upper
            e(i,j) = 255;
        else
            e(i,j) = 0;
        end
    end
end
figure(5);
imshow(e);

f=b;
for i = 1:m
    for j = 1:n
        if b(i,j)>=lower && b(i,j)<=upper
            f(i,j) = 255;
        end
    end
end
figure(6);
imshow(f);
            
g=b;
[m,n]=size(g);

count='1';
for k = 1:8
    h=g;
    figure(7);
    for i = 1:m
        for j = 1:n
            h(i,j) = mod(g(i,j),2);
            g(i,j) = (g(i,j)-h(i,j))/2;
            if(h(i,j)==1)
                h(i,j)=255;
            end
        end
    end
    subplot(2,4,k),imshow(h);
    if(count=='1')
        title('Bit-8(LSB)');
    elseif(count=='8')
        title('Bit-1(MSB)');
    else
        title(strcat('Bit-',count));        % strcat for concatenating 2 strings   
    end
    count = count + 1;
end



