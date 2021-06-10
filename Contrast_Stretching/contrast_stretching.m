og = imread('cs2.png');
figure(1);
imshow(og);

gs = rgb2gray(og);
figure(2);
imshow(gs);

[x,y] = size(gs);

p1 = input('Enter the 1st point: ');
p2 = input('Enter the 2nd point: ');
a = p1(1,1);
v = p1(1,2);
b = p2(1,1);
w = p2(1,2);

start = 0;
last = 255;

l = (v-start)/(a-start);
m = (w-v)/(b-a);
n = (last-w)/(last-b);

r = gs;
s=r;

for i = 1:x
    for j = 1:y
        if(r(i,j)<a)
           s(i,j) = l*r(i,j);  
        elseif(r(i,j)>=b)
           s(i,j) = n*(r(i,j)-b)+w; 
        else
           s(i,j) = m*(r(i,j)-a)+v;
        end
    end
end

figure(3);
imshow(s);

   