X=imread('bird1.bmp');
Y=zeros(128,'uint8');

prompt='1. Image negation\n2. Image thresholding\n3. Graylevel slicing with background \n4. Graylevel slicing without background\nEnter choice: ';
choice=input(prompt);

if(choice==1)
    for R=1:128
    for C=1:128
        Y(R,C)=255-X(R,C);
    end
    end
    imwrite(Y,'bird1_neg.bmp');
    subplot(1,2,1);imshow(X);title('original image');
    subplot(1,2,2);imshow(Y);title('image after negation');
    
elseif(choice==2)
     prompt='Enter value for thresholding: ';
     r=input(prompt);

    for R=1:128
    for C=1:128
        if X(R,C)<r
            Y(R,C)=0;
        else
            Y(R,C)=255;
        end
    end
    end
    imwrite(Y,'bird1_thresh.bmp');
    subplot(2,2,1);imshow(X);title('original image');
    subplot(2,2,2);imshow(Y);title('image after thresholding');
    subplot(2,2,4);
    axis off;
    caption=sprintf('value for thresholding = %d',r);
    title(caption);
    
elseif(choice==3)
    prompt='Enter r1: ';
    r1=input(prompt);

    prompt='Enter r2: ';
    r2=input(prompt);
    for R=1:128
    for C=1:128
        if X(R,C)>=r1 && X(R,C)<=r2
            Y(R,C)=255;
        else
            Y(R,C)=X(R,C);
        end
    end
    end

    imwrite(Y,'bird1_graybg.bmp');
    subplot(2,2,1);imshow(X);title('original image');
    subplot(2,2,2);imshow(Y);title('image after graylevel slicing with background');
    subplot(2,2,4);
    axis off;
    caption=sprintf('r1 = %d, r2 = %d',r1,r2);
    title(caption);
    
    
elseif(choice==4)
    prompt='Enter r1: ';
    r1=input(prompt);

    prompt='Enter r2: ';
    r2=input(prompt);
    for R=1:128
    for C=1:128
        if X(R,C)>=r1 && X(R,C)<=r2
            Y(R,C)=255;
        else
            y(R,C)=0;
        end
    end
    end

    imwrite(Y,'bird1_graywbg.bmp');
    subplot(2,2,1);imshow(X);title('original image');
    subplot(2,2,2);imshow(Y);title('image after graylevel slicing without background');
    subplot(2,2,4);
    axis off;
    caption=sprintf('r1 = %d, r2 = %d',r1,r2);
    title(caption);
else
    disp('Invalid input!');
end

    


