x = [1,2,0.5,1]
n1 = 0
h = [1,2,1,-1]
n2 = -1
 
N1 = size(x,2);
N2 = size(h,2);
N = N1+N2-1;
 
h2 = flip(h);
n3 = -(N2+n2-1);
 
ni = n1 + n2;
nf = ni + N - 1;
 
mstart = n3+ni;
mend = mstart+N-1;
 
rows = 4+N;
columns = abs(mstart)+mend+N2;
t = zeros(rows, columns);
 
for i = 1:columns
    t(1,i) = mstart+i-1;
end
 
for i = 1:N1
    t(2,abs(mstart)+n1+i) = x(i);
end
 
for i = 1:N2
    t(3,abs(mstart)+n2+i) = h(i);
end
 
for i = 1:N2
    t(4,abs(mstart)+n3+i) = h2(i);
end
 
for j = 1:N
    k=1;
    for i = j:j+N2-1
        t(j+4,i) = h2(k);
        k=k+1;
    end
end
 
t
 
y=zeros(1,N);
 
for j = 1:N
    for i = 1:N1
        y(j) = y(j)+t(2,abs(mstart)+n1+i)*t(4+j,abs(mstart)+n1+i);
    end
end
 
y
ni
 
subplot(2,2,1);
x1=n1:n1+N1-1;
stem(x1,x);
xlabel('n');
ylabel('x(n)');
title('x(n)');
 
subplot(2,2,2);
x2=n2:n2+N2-1;
stem(x2,h);
xlabel('n');
ylabel('h(n)');
title('h(n)');
 
subplot(2,2,3);
x3=n3:n3+N2-1;
stem(x3,h2);
xlabel('n');
ylabel('h(-n)');
title('h(-n)');
 
subplot(2,2,4);
x4=ni:nf;
stem(x4,y);
xlabel('n');
ylabel('y(n)');
title('y(n) = Linear convolution of x & h');
