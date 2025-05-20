function [xi2,yi2] = addareamask(MM1,MM2,n)
figure;imshowpair(MM1,imadjust(MM2)); 
again = true;
regionCount = 0;
while again && regionCount < n
	promptMessage = sprintf('Draw region #%d in the upper right image,\nor Quit?', regionCount + 1);
	titleBarCaption = 'Continue?';
	button = questdlg(promptMessage, titleBarCaption, 'Draw', 'Quit', 'Draw');
	if strcmpi(button, 'Quit')
		break;
	end
	regionCount = regionCount + 1;
    p = drawpolygon('LineWidth',2,'Color','cyan');
    [centroids] = p.Position;
    xi2{regionCount,1} = centroids(:,1);
    yi2{regionCount,1} = centroids(:,2);
    clear centroids
end

%
% if(regionCount==0)
%    HH = MM2;
% else
%    HH = MM2;
%    for kk =1:length(xi2)
%        mask = roipoly(HH, xi2{kk,1}, yi2{kk,1});
%        HH(mask)=1;
%     end
% figure;imshow(HH)
% end
end