% Paint the pixels with corresponding bins
function L1 = getcanvas(canvass1,bindiv1,blocksize,overlap)
L1 = zeros(size(canvass1));
% blocksize = 150;
% overlap = 0.75;
inc = round(blocksize*(1-overlap));
sizes =size(L1);
yy=0;

for ki = 1:inc:sizes(1)-blocksize    % default ki = starty:inci:Sy-iblocksize+1
    yy = yy+1;
    xx = 0;
    for kj =1:inc:sizes(2)-blocksize
        xx = xx+1;
        %L1(ki:ki+blocksize-1,kj:kj+blocksize-1) = seldiv1(xx,yy);
        L1(ki:ki+blocksize-1,kj:kj+blocksize-1) = bindiv1(yy,xx);
    end
end
end