function plotData(x,y)
figure;
plot(x, y,'rx', 'MarkerSize', 10);
axis([4 24 -5 25]);
xlabel("Population of City in 10,000s");
ylabel("Profit in Rs10,000s");        
end
