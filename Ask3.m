% Third Script
% Numerical solve of ordinary differental equation
% with the method of Euler, the improved method and the modified 
% We have the problem
h = 0.2;
x = 0:h:10;
n = length(x);
y = sqrt(x.^2 + 1);
y0 = 1;
f = @(x,y) x./y;
% Euler Method
yE = zeros(size(x),1);
yE(1) = y0;
for( i = 1:n-1)
  yE(i+1) = yE(i) + h.*f(x(i),y(i));
end
% Modified Euler Method
yM = zeros(size(x),1);
yM = y0;
for ( i = 1:n-1 )
  yM(i+1) = yM(i) + h.* f(x(i) + h/2, y(i) + h/2.*f(x(i),y(i))); 
end
% Improved Euler Method
yI = zeros(size(x),1);
yI = y0;
for ( i = 1:n-1 )
  yI(i+1) = yI(i) + h/2.*(f(x(i),y(i)) + f(x(i) + h, y(i) + h.*f(x(i),y(i)))); 
end
% Graph of solutions
figure();
plot(x, y, 'b-');
xlabel('x','fontsize',16);
ylabel('y(x)','fontsize',16);
hold on 
plot(x,yE,'r*');
plot(x,yM,'k+');
plot(x,yI,'gx');
legend('Analytic Solution','Euler Method Solution','Modified Euler Method Solution','Improved Euler Method Solution','Location','northwest');
hold off
% Graph of errors
figure();
plot(x,yE-y,'r-');
xlabel('x','fontsize',16);
ylabel('en','fontsize',16);
hold on
plot(x,yM-y,'k-');
plot(x,yI-y,'g-');
legend('Euler Method Error','Modified Euler Method Error','Improved Euler Method','Location','northwest');
hold off