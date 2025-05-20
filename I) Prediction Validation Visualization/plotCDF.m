function [y1, y2] = plotCDF(Y_Act,YY_Opt_EGPR)
pd1 = fitdist(Y_Act,'Normal');
pd2 = fitdist(YY_Opt_EGPR,'Normal');
xx = linspace(0,1,length(Y_Act)).';
y1 = cdf(pd1,xx);
y2 = cdf(pd2,xx);
%% Plot CDF
figure;plot(xx,y1,'b','LineWidth',5)
hold on;
plot(xx,y2,'--r','LineWidth',5)
hold off;
title('Cumulative Density Function')
xlabel('Normalized Divergence','FontWeight','bold','FontSize',15)
ylabel('Cumulative Density Function','FontWeight','bold','FontSize',15)
box on;
ax=gca;
ax.FontSize = 20;
ax.FontWeight = 'bold';
ax.LineWidth = 5;
set(ax,'TickLength',[0 0])
legend('Observed Data','Predicted Data')
%set(gca,'FontWeight','bold','FontSize',15)
legend({'Observed','Predicted'},'Location','southeast')
end