%% Gradient resize function:
%%Redo Mid-Section from user input points:
%Compress
function [Temp_Emb,xistep,Rat] = Smooth_gradient_resize_single_V3_Concavity(Bound_img2,Bound_img12,direc1)
%crpup = crp-crpdn;
figure;imshowpair(Bound_img2,Bound_img12)
title('Draw two points between section of interest')
x1 = drawpoint;
x2 = drawpoint;
xx1=round(x1.Position);
xx2=round(x2.Position);

title('Draw peak height crop of the section')
h1 = drawline('Color','m');
hh1 = h1.Position;
d1 = sqrt((hh1(1,1)-hh1(2,1))^2 + (hh1(1,2)-hh1(2,2))^2);

xmid = round((xx2(1,1)-xx1(1,1))/2);
%hstp = stps/2;
if(strcmpi(direc1,'concave'))
    xs1 = round(linspace(1,xmid,xmid)).';
    xs2 = round(linspace(xmid,1,xmid)).';
    hstep = [xs1(1:end);xs2(1:end-1)];
else
    xs1 = round(linspace(1,xmid,xmid)).';
    xs2 = round(linspace(xmid,1,xmid)).';
    hstep = [xs1(1:end);xs2(2:end)];
end


%xistep = round(linspace(xx1(1,1),xx2(1,1),(xmid.*2)-1)).';
xistep = [xx1:1:xx2-1].';

Rat = round((d1/xmid).*hstep);
%img = Bound_img12;
Temp_Emb = Bound_img12;

for gg=1:length(Rat)
    xi1 = xistep(gg,1); xi2 = xistep(gg+1,1);
    crpi = Rat(gg,1);
    if(strcmpi(direc1,'concave'))
        [Newemb] = compressmid_ver2_down(crpi,Temp_Emb,xi1,xi2);
    else
        [Newemb] = compressmid_ver2(crpi,Temp_Emb,xi1,xi2);
    end
    clear Temp_Emb
    Temp_Emb = Newemb;
    clear Newemb
end
figure;imshow(Temp_Emb)
end