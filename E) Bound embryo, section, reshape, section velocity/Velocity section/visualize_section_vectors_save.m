function visualize_section_vectors_save(Im,ucomap,vcomap,path,name,n)
[xgrid,ygrid] = meshgrid(1:1:size(Im,2),1:1:size(Im,1));
figure;
quiverC2D(xgrid(1:n:end,1:n:end),flip(ygrid(1:n:end,1:n:end),1),ucomap(1:n:end,1:n:end),vcomap(1:n:end,1:n:end),'scale',10,'LineWidth', 3,'MaxHeadSize',2)
set(gcf, 'Position', get(0, 'Screensize'));
saveas(gcf,([path,'Quiver_',name,'.tif']));
figure; imshow(Im); hold on;
q=quiver(xgrid(1:n:end,1:n:end),ygrid(1:n:end,1:n:end),ucomap(1:n:end,1:n:end),-vcomap(1:n:end,1:n:end),'r');
q.MaxHeadSize = 2;
q.LineWidth = 2;
q.AutoScaleFactor = 8;
hold off;
set(gcf, 'Position', get(0, 'Screensize'));
saveas(gcf,([path,'Quiver_Mapped_',name,'.tif']));
end