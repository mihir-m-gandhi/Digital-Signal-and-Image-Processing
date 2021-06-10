%low pass

X=imread('taj.bmp');
Y=zeros(128,'uint16');
Z=[1 1 1; 1 1 1; 1 1 1];
A=ones(3,'uint16');
for i=1:128
    for j=1:128
       if(j-1==0)
           for k=1:3
               A(k,1)=0;
           end
       end
        if(i-1==0)
           for k=1:3
               A(1,k)=0;
           end
        end
        if(j+1==129)
           for k=1:3
               A(k,3)=0;
           end
        end
        if(i+1==129)
           for k=1:3
               A(3,k)=0;
           end
        end
       for l=1:3
           for m=1:3
               if (A(l,m)==1)
                   A(l,m)=X(i+l-2,j+m-2);
               end
           end
       end
       total=0;
       for l=1:3
           for m=1:3
              total=total+A(l,m) * Z(l,m);
           end
       end
       Y(i,j)=total/9;
       total=0;
       A=ones(3,'uint16');
    end
end
imshow(Y, []);

%high pass
G=imread('taj.bmp');
H=zeros(128,'int16');
I=[-1 -1 -1; -1 8 -1; -1 -1 -1];
J=ones(3,'int16');
for i=1:128
    for j=1:128
       if(j-1==0)
           for k=1:3
               J(k,1)=0;
           end
       end
        if(i-1==0)
           for k=1:3
               J(1,k)=0;
           end
        end
        if(j+1==129)
           for k=1:3
               J(k,3)=0;
           end
        end
        if(i+1==129)
           for k=1:3
               J(3,k)=0;
           end
        end
       for l=1:3
           for m=1:3
               if (J(l,m)==1)
                   J(l,m)=G(i+l-2,j+m-2);
               end
           end
       end
       total=0;
       for l=1:3
           for m=1:3
              total=total+J(l,m) * I(l,m);
           end
       end
       if(total<0)
           H(i,j)=0;
       else
       H(i,j)=total/9;
       end
       total=0;
       J=ones(3,'int16');
    end
end
subplot(1,3,1);imshow(X, []);title('Original image');
subplot(1,3,2);imshow(Y, []);title('Low pass filter');
subplot(1,3,3);imshow(H, []);title('High pass filter');
