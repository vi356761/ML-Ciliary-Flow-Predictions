function multiple_line_plots_trend_V2(O_Total_Norm,pathy)
Data = table2array(O_Total_Norm);
varnames = O_Total_Norm.Properties.VariableNames;
cv = [0 1 1; 1 0 1; 0 1 1; 1 0 0; 0 1 0; 0 0 1; 48/255 213/255 200/255; 0 0 0; 160/255 32/255 240/255; 119/255 7/255, 55/255];
Out = Data(:,end);
for jj=1:length(varnames)-1
    %figure; plot(O_Total_Norm.Circularity,O_Total_Norm.Area,'color',cv(2,:))
    [p,S] = polyfit(Data(:,jj), Out, 1);
    px = [min(Data(:,jj)) max(Data(:,jj))];
    py = polyval(p, px);
    R_squared = 1 - (S.normr/norm(Out - mean(Out)))^2;   
    figure('Position', get(0, 'Screensize'));
    h1=plot(Data(:,jj),Out,'.','Color',cv(jj,:),'MarkerSize',10); hold on;
    h2=plot(px, py,'--k', 'LineWidth', 4); hold off
    title('Input Vs Output features','FontSize',15)
    xlabel(varnames{1,jj},'FontWeight','bold','FontSize',15)
    %...Change for different output.......................................
    ylabel('Divergence','FontWeight','bold','FontSize',15)
    %...Change for different output.......................................
    legend([h1, h2],{'Observed',['Trendline R-Square: ',num2str(R_squared)]})
    saveas(gcf,[pathy,'Response',num2str(jj),'.tif'])
    close(gcf)    
    clear h1 h2 p px py S R_squared
end
end