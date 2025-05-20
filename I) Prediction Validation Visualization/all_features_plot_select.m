function all_features_plot_select(Avg_Table,pathii)
varnames = Avg_Table.Properties.VariableNames;
Avg_Mat = table2array(Avg_Table);
cv = [1 1 0; 1 0 1; 0 1 1; 1 0 0; 0 1 0; 0 0 1; 48/255 213/255 200/255; 0 0 0; 160/255 32/255 240/255; 119/255 7/255, 55/255];

for jj=1:length(varnames)-1
    j=jj+1;
    for tt=j:length(varnames)
        %figure; plot(O_Total_Norm.Circularity,O_Total_Norm.Area,'color',cv(2,:))
        if(exist([pathii,varnames{1,jj}])~=7)
            mkdir([pathii,varnames{1,jj}])
        end
        figure('Position', get(0, 'Screensize'));
        plot(Avg_Mat(:,jj),Avg_Mat(:,tt),'.','Color',cv(tt,:),'LineWidth',4);
        title([varnames{1,jj},' Vs ',varnames{1,tt}],'FontSize',15)
        xlabel([varnames{1,jj}],'FontWeight','bold','FontSize',15)
        ylabel([varnames{1,tt}],'FontWeight','bold','FontSize',15)
        saveas(gcf,[pathii,varnames{1,jj},'\',varnames{1,jj},'Vs',varnames{1,tt},'.tif'])
        close(gcf)
    end
end

end