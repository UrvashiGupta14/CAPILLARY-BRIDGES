h0 = 30*10^-6;
h=h0;
for i=1:10

p=70*10^-3;

w = (12*pi*h*h*p)^(1/3);
c=(9/(4*pi*h*h*p))^(1/3);

f= @(phi,x)((c - 4/(pi*h) + 8/(pi*(2*h + 0.5*x(1)*x(1)/p )) )^(-1) * cosd(phi) );
[phi, x] = ode45(f, [0 90], 0);

w_estimate=1.084*w;
t=size(x);
w_num=2*x(t);

%store values in matrix
f_plot(i,1)=w;
f_plot(i,2)=w_num(1,1);
f_plot(i,3)=w_estimate;
h=h0+i*50*10^-6;
end

figure()
plot(f_plot(:,1),f_plot(:,2),'xr');
hold on
plot(f_plot(:,1),f_plot(:,3));
hold on
plot(f_plot(:,1),f_plot(:,1));
hold off