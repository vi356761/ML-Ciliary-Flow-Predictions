% Test window-based feature extraction
% Play around with different overlap and window sizes
% Plot MCC number, average minimum distance, and uniformity
% Parameters to test: i)window-size ii) window-overlap

%% Window based feature extraction

function [centx, centy, Master_Images, Master_Images_Col, meanvel] = windowmethod_ONE_Flow_New(blocksize,overlap,canvas)
%canvass = xExpandMatrix(canvas, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
inc = round(blocksize*(1-overlap)); % define increment
loop=1;
sizes = size(canvas);
ycount=0;

if (blocksize<size(canvas,1)&& blocksize<size(canvas,2))
    for ki = 1:inc:sizes(1)-blocksize    % default ki = starty:inci:Sy-iblocksize+1
        ycount = ycount+1;
        xcount=0;
        for kj =1:inc:sizes(2)-blocksize
            xcount = xcount+1;
            sz = [kj,ki,blocksize-1,blocksize-1];
            Img2 = imcrop(canvas,sz);
            Master_Images{ycount,xcount} = Img2;
            Master_Images_Col{loop,1} = Img2;
            %Coordinates of cartesian x and y
            centy(loop,1) = ceil(ki+(blocksize/2));
            centx(loop,1) = ceil(kj+(blocksize/2));
            velind=(Img2~=0);
            vel =Img2(velind);
            if (isempty(vel))
                meanvel(loop,1)= 0;
            else
                meanvel(loop,1)=mean2(vel);
            end
            loop=loop+1;
        end
    end
end
end
%% Only comments
% inc=8; sizes=size(CF.MU);blocksize = 448; kj =1:inc:sizes(2)-blocksize;
% inc=2.3; sizes=size(VI.MU);blocksize = 136; kjj =1:inc:sizes(2)-blocksize;