%% Plot figures and save it

function getplotsofhistogram(data,text,label,svpath)
figure;
A = histogram(data);
%A = histogram(n1);
%title('Uniformity distribution','FontSize', 20)
title(text,'FontSize', 20)
%xlabel('Uniformity','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
xlabel(label,'FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
%ylabel ('Circularity','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold');
%set(gca,'XTickLabel',{'1.2K','4K','11K','Glass'})
set(A,{'linew'},{2})
%set(B,'EdgeColor',[0 0 0],'LineWidth',2)
box on;
ax2 = gca;
ax2.FontWeight = 'bold';
ax2.XAxis.FontSize = 15;
ax2.YAxis.FontSize = 15;
set(ax2,'LineWidth',2)
%set(ax2,'xtick',[])
%set(ax2,'ytick',[0  1  2])
set(gcf, 'Position', get(0, 'Screensize'));
%saveas(gcf,[svpath,'Head_uniformity.tif'])
saveas(gcf,[svpath,label,'.tif'])
end