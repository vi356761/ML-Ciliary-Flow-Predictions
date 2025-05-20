function multiple_single_prediction_plot_V3(Avg_Table,Data,Out,pathy,Matri,Master_Divergence)
varnames = Avg_Table.Properties.VariableNames;
cv = [1 1 0; 1 0 1; 0 1 1; 1 0 0; 0 1 0; 0 0 1; 48/255 213/255 200/255; 0 0 0; 160/255 32/255 240/255; 119/255 7/255, 55/255];
harray = gobjects(1,length(Matri));
figure('Position', get(0, 'Screensize'));
for jj=1:length(Matri)
    %figure; plot(O_Total_Norm.Circularity,O_Total_Norm.Area,'color',cv(2,:))
    h = plot(Data,Out(:,jj),'.','Color',cv(jj,:),'MarkerSize',20);
    hold on;
    harray(1,jj)= h;
end
title('Input Vs Output features','FontSize',15)
xlabel('Normalized Inputs','FontWeight','bold','FontSize',15)
ylabel('Normalized Divergence','FontWeight','bold','FontSize',15)
hold off;
legend(harray,[varnames(:,1:4),varnames(:,6:7),varnames(:,9)])
saveas(gcf,[pathy,'Prediction_Ensembled.tif'])
close(gcf)

Data2 = array2table(repmat(linspace(0.01,1,100).',1,10),'VariableNames',varnames(1:end-1));
Data3 = table2array(getrawvaluesback_V2(Data2,Master_Divergence));
for jj=1:length(Matri)
    j = Matri(jj,1);
    Data = Data3(:,j);
    %figure; plot(O_Total_Norm.Circularity,O_Total_Norm.Area,'color',cv(2,:))
    figure('Position', get(0, 'Screensize'));
    plot(Data,Out(:,jj),'--','Color',cv(jj,:),'LineWidth',4);
    title('Prediction to features','FontSize',15)    
    xlabel(varnames{1,j},'FontWeight','bold','FontSize',15)
    ylabel('Predicted Divergence','FontWeight','bold','FontSize',15)
    saveas(gcf,[pathy,'Prediction_Response_',varnames{1,j},'.tif'])
    close(gcf)
end

end