a = imread('rock.bmp');

b=255-a;
subplot(4,4,1),subimage((a)),title('Original image');
subplot(4,4,2),subimage((b)),title('Negative image');

[r,c] = size(a);

x = a;
T = input('Enter Threshold \n');
for i = 1:r
    for j = 1:c
        if(a(i,j) < T)
            x(i,j) = 0;
        else
            x(i,j) = 255;
        end
    end
end
subplot(4,4,3),subimage((x)),title('Threshold image');

y = a;
r1 = input('Enter Lower Limit \n');
r2 = input('Enter Upper Limit \n');
for i = 1:r
    for j = 1:c
        if(a(i,j) < r1 || a(i,j) > r2)
            y(i,j) = 0;
        else
            y(i,j) = 255;
        end
    end
end
subplot(4,4,4),subimage((y)),title('Gray level without background image');

z = a;
r1 = input('Enter Lower Limit \n');
r2 = input('Enter Upper Limit \n');
for i = 1:r
    for j = 1:c
        if(a(i,j) < r1 || a(i,j) > r2)
            z(i,j) = a(i,j);
        else
            z(i,j) = 255;
        end
    end
end
subplot(4,4,5),subimage((z)),title('Gray level with background image');

l = bitget(a,1);
m = bitget(a,2);
n = bitget(a,3);
o = bitget(a,4);
p = bitget(a,5);
q = bitget(a,6);
s = bitget(a,7);
t = bitget(a,8);
subplot(4,4,6),subimage(logical(l)),title('Bit Plane 1');
subplot(4,4,7),subimage(logical(m)),title('Bit Plane 2');
subplot(4,4,8),subimage(logical(n)),title('Bit Plane 3');
subplot(4,4,9),subimage(logical(o)),title('Bit Plane 4');
subplot(4,4,10),subimage(logical(p)),title('Bit Plane 5');
subplot(4,4,11),subimage(logical(q)),title('Bit Plane 6');
subplot(4,4,12),subimage(logical(s)),title('Bit Plane 7');
subplot(4,4,13),subimage(logical(t)),title('Bit Plane 8');