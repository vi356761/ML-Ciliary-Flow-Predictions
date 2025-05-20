function [HH,MM,TT,MU,MD,cropmaster] = sectionembryofin_reverse(I)
%% Get the cropped image of the sections
%Tail Crop..................................................................................................................
L = size(I,2);
ylimi = size(I,1);
delH = round(L*0.23);
crophead=[1,1,delH-1,ylimi-1];
HH = imcrop(I,crophead);
figure;imshow(HH)
%% Mid crop
MX1 =  delH+1; delM = round(L*0.52);
cropmid=[MX1,1,delM-1,ylimi-1];
MM = imcrop(I,cropmid);
figure;imshow(MM)
%% Head crop
TX1 = MX1+delM+1;
%DelT = round(L*0.23);
%DelT = size(I,2)-TX1;
croptail=[TX1,1,L-1,ylimi-1];
TT = imcrop(I,croptail);
figure;imshow(TT)
%% Upper and Lower Mid
Mx = size(MM,2);
He = round(ylimi/2);
cropmidup=[1,1,Mx-1,He-1];
cropmiddown=[1,He+1,Mx-1,ylimi-1];
MU = imcrop(MM,cropmidup);
MD = imcrop(MM,cropmiddown);
figure; imshow(MU)
figure; imshow(MD)
close all
cropmaster.Head = croptail;
cropmaster.Tail = crophead;
cropmaster.Midup = cropmidup;
cropmaster.Middown = cropmiddown;
cropmaster.Mid = cropmid;
end