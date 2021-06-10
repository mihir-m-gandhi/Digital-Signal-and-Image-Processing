f = input('Enter the signal: ');
n = size(f,2);  % to take only column value i.e no of columns
k = zeros(n,n);

% DFT
for i = 1:n
    for j = 1:n
        if(i==1||j==1)
            k(i,j) = 1;     % alternative: k(1,:) = 1 and k(:,1) =1
        else
            arg = -2*pi*(i-1)*(j-1)/n;
            k(i,j) = complex(cos(arg),sin(arg)); 
        end
    end
end

DFT = (k * transpose(f));
DFT

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

IDFT = (k * DFT)/n;
IDFT