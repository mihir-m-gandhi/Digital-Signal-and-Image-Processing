X=imread('taj.bmp');
Y=zeros(128,'uint8');

prompt='Enter value for r1: ';
r1=input(prompt);

prompt='Enter value for s1: ';
s1=input(prompt);

prompt='Enter value for r2: ';
r2=input(prompt);

prompt='Enter value for s2: ';
s2=input(prompt);

rmax=255;
smax=255;
rmin=0;
smin=0;

alpha = (s1 - smin)/(r1 - rmin);
beta = (s2 - s1)/(r2 - r1);
gamma = (smax - s2)/(rmax - r2);
%disp(alpha);

%equations


for i=1:128
    for j=1:128
        if X(i,j)>=rmin && X(i,j)<=r1
            Y(i,j)=alpha * X(i,j);
        end
        if X(i,j)>r1 && X(i,j)<=r2
            Y(i,j)= s1 + beta * (X(i,j) - r1);
        end
        if X(i,j)>r2 && X(i,j)<=rmax
             Y(i,j)= s2 + gamma * (X(i,j) - r2);
        end
    end
end

imwrite(Y,'cont_stretched.bmp');
subplot(2,2,1);imshow(X);title('original image');
subplot(2,2,2);imshow(Y);title('image after contrast stretching');
subplot(2,2,3);
axis off;
caption=sprintf('r1 = %d, s1 = %d, r2 = %d, s2 = %d',r1,s1,r2,s2);
title(caption);
subplot(2,2,4);
axis off;
caption=sprintf('alpha = %f, beta = %f, gamma = %f',alpha,beta,gamma);
title(caption);



