prompt='Enter the number of samples: ';
sam=input(prompt);
prompt='Enter starting point';
sp=input(prompt);
X=zeros(1,17);
Y=zeros(1,17);
Z=zeros(1,17);
fprintf('Enter values:');
for i = sp:sp+sam-1
    X(i+9) = input('');
end
prompt='1. Scaling\n2. Addition\n3. Multiplication\nEnter choice: ';
choice=input(prompt);
if(choice==1)
    prompt='Enter scaling factor:';
    sf=input(prompt);
    for i = 1:17
    Y(i) = sf * X(i);
    end
    disp(Y);
    figure;
    l = linspace(-8,8,17);
    subplot(2,2,1);stem(l,X);title('input');
    subplot(2,2,2);stem(l,Y);title('output');
    
elseif (choice==2)
    prompt='Enter the number of samples: ';
    sam1=input(prompt);
    prompt='Enter starting point';
    sp1=input(prompt);
    fprintf('Enter values:');
    for i = sp1:sp1+sam1-1
    Z(i+9) = input('');
    end
    for i = 1:17
       Y(i)=X(i)+Z(i); 
    end
    disp(Y);
    figure;
    l = linspace(-8,8,17);
    subplot(2,2,1);stem(l,X);title('input1');
    subplot(2,2,2);stem(l,Z);title('input2');
    subplot(2,2,3);stem(l,Y);title('output');
elseif (choice==3)
    prompt='Enter the number of samples: ';
    sam1=input(prompt);
    prompt='Enter starting point';
    sp1=input(prompt);
    fprintf('Enter values:');
    for i = sp1:sp1+sam1-1
    Z(i+9) = input('');
    end
    for i = 1:17
       Y(i)=X(i)*Z(i); 
    end
    disp(Y);
    figure;
    l = linspace(-8,8,17);
    subplot(2,2,1);stem(l,X);title('input1');
    subplot(2,2,2);stem(l,Z);title('input2');
    subplot(2,2,3);stem(l,Y);title('output');
end
    
    