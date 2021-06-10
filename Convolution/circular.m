x = [2,1,2,-1]
n1 = 0
h = [1,2,3,4]
n2 = 0
 
N1 = size(x,2);
N2 = N1;
N = N1;
 
h2 = flip(circshift(h,N-1));
n3 = 0;
 
ni = 0;
nf = N-1;
 
mstart = -(N-1);
mend = N-1;
 
rows = 3+N;
columns = abs(mstart)+mend+1;
t = zeros(rows, columns);
 
for i = 1:columns
    t(1,i) = mstart+i-1;
end
 
for i = 1:N
    t(2,abs(mstart)+n1+i) = x(i);
end
 
for i = 1:N
    t(3,abs(mstart)+n2+i) = h(i);
end
 
for j = 1:N
    k=1;
    for i = j:columns
        in = mod(k,N)+1;
        t(j+3,i) = h2(in);
        k=k+1;
    end
end
t
 
y=zeros(1,N);
 
for j = 1:N
    for i = 1:N
        y(j) = y(j)+t(2,i+N-1)*t(3+j,i+N-1);
    end
end 
y
ni
 
subplot(2,2,1);
x1=ni:nf;
stem(x1,x);
xlabel('n');
ylabel('x(n)');
title('x(n)');
 
subplot(2,2,2);
x2=ni:nf;
stem(x2,h);
xlabel('n');
ylabel('h(n)');
title('h(n)');
 
subplot(2,2,3);
x3=ni:nf;
stem(x3,h2);
xlabel('n');
ylabel('h(-n)');
title('h(-n)');
 
subplot(2,2,4);
x4=ni:nf;
stem(x4,y);
xlabel('n');
ylabel('y(n)');
title('y(n) = Circular convolution of x & h');
