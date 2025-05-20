function [HH,MM,TT,MU,MD] = sectionembryonew(I,X1,X2,Y1,Y2)
%% Get the cropped image of the sections
%Head Crop..................................................................................................................
L = sqrt(((X2-X1)^2) + ((Y2-Y1)^2));
YY = size(I,1);
X1=1;
%ylen = ceil(abs(YY2-YY1)/2);
delH = L*0.25;
HH = imcrop(I,[X1,1,delH-1,YY-1]);
figure;imshow(HH)
%% Mid crop
MX1 =  X1 + delH; delM = L*0.52;
MM = imcrop(I,[MX1,1,delM-1,YY-1]);
figure;imshow(MM)
%% Tail crop
TX1 = MX1 + delM;
%DelT = L*0.23;
DelT = size(I,2)-TX1;
TT = imcrop(I,[TX1,1,DelT-1,YY-1]);
figure;imshow(TT)
%% Upper and Lower Mid
Mx = size(MM,2);
midy = size(MM,1)/2;
MU = imcrop(MM,[1,1,Mx-1,midy-1]);
MD = imcrop(MM,[1,midy,Mx-1,midy-1]);
figure; imshow(MU)
figure; imshow(MD)
close all
end