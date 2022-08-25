a = sampledataset3; %independent var -> factors/attributes
b = pricevector2; %dependent variable -> prices

[U,S,V] = svd(a,'econ');
x = V*inv(S)*U'*b; % Least-square fit
%x = regress(b,a);
%x = pinv(a)*b;

subplot(1,2,1) % unsorted data
plot(b,'k-o')
hold on, grid on
plot(a*x,'r-o')

set(gca,'FontSize',15)
subplot(1,2,2) % sorted, from lowest to highest price
[b sortind] = sort(b);
plot(b,'k-o')
hold on, grid on
plot(a(sortind,:)*x,'r-o')
l1 = legend('Housing Value', 'Regression')
set(l1,'Location', 'NorthWest')
set(gca,'FontSize', 15)
set(l1,'FontSize',18)
grid on
xlabel('Factors')
ylabel('Price')

for i = 1:size(a,2)-1
astd = std(a(:,i)); %standard deviation of matrix a

a(:,i) = a(:,i)/astd;
end

x = regress(b,a)
figure
bar(x(1:7))

xlabel('Factors'), ylabel('Correlation')
set(gca,'FontSize',13)
set(gcf, 'Position', [100 100 600 250])
