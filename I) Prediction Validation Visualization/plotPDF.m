function [y1, y2] = plotPDF(Out_Norm,yfit_RGPR)
pd1 = fitdist(Out_Norm,'Normal');
pd2 = fitdist(yfit_RGPR,'Normal');
%xx = linspace(-0.2,1,length(Out_Norm)).';
xx = linspace(0,1,length(Out_Norm)).';
y1 = pdf(pd1,xx);
y2 = pdf(pd2,xx);
%% Plot CDF
figure;plot(xx,y1,'b','LineWidth',5)
hold on;
plot(xx,y2,'--r','LineWidth',5)
hold off;
title('Probability Density Function')
%xlabel('Normalized Velocity in X','FontWeight','bold','FontSize',15)
xlabel('Normalized Divergence','FontWeight','bold','FontSize',15)
ylabel('Probability Density','FontWeight','bold','FontSize',15)
box on;
ax=gca;
ax.FontSize = 20;
ax.FontWeight = 'bold';
ax.LineWidth = 5;
set(ax,'TickLength',[0 0])
legend('Observed Data','Predicted Data')
%set(gca,'FontWeight','bold','FontSize',15)
legend({'Observed','Predicted'})
end