% First script
% Numerical solve of ordinary differental equation
% with the method of Euler and Taylor order 2
% We have the problem
h = 0.2;
x = 0:h:3;
n = length(x);
y = x.^2 + 2*x + 2 - (x+1).*log(x+1)
y0 = 2;
f = @(x,y) (y + x.^2 - 2)./(x+1) ;
df = @(x,y) (2*x./(x+1));
% Euler Method
yE = zeros(size(x),1);
yE(1) = y0;
for( i = 1:n-1)
  yE(i+1) = yE(i) + h.*f(x(i),y(i));
end
% Taylor Method of order 2
yT = zeros(size(x),1);
yT(1) = y0;
for(i = 1:n-1)
 yT(i+1) = y(i) + h.*f(x(i),y(i)) + h^2/2.*df(x(i),y(i)) ;
end 
% Graph of solutions
figure();
plot(x, y, 'b-');
xlabel('x','fontsize',16);
ylabel('y(x)','fontsize',16);
hold on 
plot(x,yE,'r*');
plot(x,yT,'kx');
legend('Analytic Solution','Euler Method Solution','Taylor of order 2 Method Solution','Location','northwest');
hold off