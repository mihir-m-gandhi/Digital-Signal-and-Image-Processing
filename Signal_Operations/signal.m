x=0:0.02:4;
sine = sin(x);
subplot(3,1,1)
stem(x, sine)
title('ACTUAL')
xlabel('n')
ylabel('f(n)')

x=0:0.01:4;
sine1 = sin(x);
subplot(3,1,2)
stem(x, sine1)
title('UP-SAMPLING')
xlabel('n')
ylabel('f(n)')

x=0:0.05:4;
sine2 = sin(x);
subplot(3,1,3)
stem(x, sine2)
title('DOWN-SAMPLING')
xlabel('n')
ylabel('f(n)')

