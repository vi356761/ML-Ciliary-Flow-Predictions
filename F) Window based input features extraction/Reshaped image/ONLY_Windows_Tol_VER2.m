% Test window-based feature extraction
% Play around with different overlap and window sizes
% Plot MCC number, average minimum distance, and uniformity
% Parameters to test: i)window-size ii) window-overlap

%% Window based feature extraction

function [window_centx,window_centy,Master_Images,Master_Images_Col,idx] = ONLY_Windows_Tol_VER2(blocksize,overlap,canvas)
%canvas = xExpandMatrix(canvass, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
inc = round(blocksize*(1-overlap)); % define increment
sizes = size(canvas);
ycount=0;
loop=0;
tol=3;
siz=blocksize;
% ro=[];
% re=[];
% uniformity=[];
window_centx=[];
window_centy=[];
%wid = length(starty:inc:Sy-blocksize);
%len = length(startx:inc:Sx-blocksize);
%center = zeros(wid*len,1);
if (blocksize<size(canvas,1)&& blocksize<size(canvas,2)) 
for ki = 1:inc:sizes(1)-blocksize    % default ki = starty:inci:Sy-iblocksize+1
    ycount = ycount+1;
    xcount=0;
    for kj =1:inc:sizes(2)-blocksize
              loop = loop+1;
              xcount = xcount+1;
              sz = [kj,ki,blocksize-1,blocksize-1];
              window_centy(loop,1) = ceil(ki+(blocksize/2));
              window_centx(loop,1) = ceil(kj+(blocksize/2)); 
              %Crop image
              Img1 = imcrop(canvas,sz);
              Img11 = filter_edge_decision(Img1,tol,siz);
              Img2 = logical(Img11);
              if (mean2(Img2)== 0)
                  idx(loop,1) = 1;
              else
                  idx(loop,1) = 0;
              end
              %Img2 = logical(Img2);          
              % Save the images to get correlations later
              Master_Images{ycount,xcount} = Img2;
              Master_Images_Col{loop,1} = Img2; 
              clear Img2;
    end
end
end
end