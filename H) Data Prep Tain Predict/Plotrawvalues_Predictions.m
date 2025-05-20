function Plotrawvalues_Predictions(Trop_Table,Laevis_Table,Axolotl_Table,Trop_Y_Raw,Laevis_Y_Raw,Axolotl_Y_Raw,pathii)
vnames = Trop_Table.Properties.VariableNames;
for nn=1:length(vnames)
    figure('Position', get(0, 'Screensize'));
    plot(table2array(Trop_Table(:,nn)),Trop_Y_Raw,'.c','LineWidth',4,'MarkerSize',30);hold on;
    plot(table2array(Laevis_Table(:,nn)),Laevis_Y_Raw,'.m','LineWidth',4,'MarkerSize',30);hold on;
    plot(table2array(Axolotl_Table(:,nn)),Axolotl_Y_Raw,'.k','LineWidth',4,'MarkerSize',30);hold off;
    xlabel(vnames{1,nn},'FontWeight','bold','FontSize',15)
    ylabel('Divergence','FontWeight','bold','FontSize',15)
    legend({'Tropicalis','Laevis','Axolotl'})
    saveas(gcf,[pathii,vnames{1,nn},'.tif'])
    close(gcf)
end
end