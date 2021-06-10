a = imread('drag.jpg');
figure(1);
imshow(a);

cover = rgb2gray(a);
figure(2);
imshow(cover);

b = imread('mg.jpg');
figure(3);
imshow(b);
data = rgb2gray(b);
figure(4);
imshow(data);
ogdata = data;


[m,n]= size(data);
cover = imresize(cover,[m n]);
figure(2);
imshow(cover);
ogcover = cover;

add = data;
bit = data;

toadd = data;
for k = 1:8
    for i = 1:m
        for j = 1:n
            if(k==8)
                toadd(i,j) = mod(data(i,j),2);
                data(i,j) = (data(i,j)-toadd(i,j))/2;
            else
                temp = mod(data(i,j),2);
                data(i,j) = (data(i,j)-temp)/2;
            end
        end
    end
end

mix = data;
for k = 1:8
    figure(5);
    for i = 1:m
        for j = 1:n
            if(k==1)
                bit(i,j) = toadd(i,j);
                cover(i,j) = (cover(i,j)-bit(i,j))/2;
            else
                bit(i,j) = bit(i,j)+(mod(cover(i,j),2)*pow2(k-1));
                cover(i,j) = (cover(i,j)-mod(cover(i,j),2))/2;
            end
        end
    end
    subplot(2,4,k),imshow(bit);
end

figure(6);
imshow(bit);

added = bit;

h=added;
for i = 1:m
    for j = 1:n
        h(i,j) = mod(added(i,j),2);
        if(h(i,j)==1)
            h(i,j)=128;
        end
    end
end

data = h;
figure(7);
imshow(data)




