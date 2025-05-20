%% Redo Mid-Section from user input points:
%Compress
function [Newemb,hh1,hh2] = compressmid(crp,crpdn,Bound_img2,Bound_img12)
crpup = crp-crpdn;
figure;imshowpair(Bound_img2,Bound_img12)
h1 = drawpoint;
h2 = drawpoint;
img = Bound_img12;
hh1=h1.Position;
hh2=h2.Position;
st = ceil(hh1 (1,1));
en=floor(hh2 (1,1));
img2 = img(1:end,st:en);
szz2 = size(img2);
HH = img(1:end,1:st-1); TT = img(1:end,en+1:end);
%%
Resmid = imresize(img2,[szz2(1,1)-crp,szz2(1,2)]);
upp = zeros(crpup,szz2(1,2));
dnn = zeros(crpdn,szz2(1,2));
Newmid = [upp;Resmid;dnn];
Newemb = [HH,Newmid,TT];    
figure;imshowpair(Bound_img2,Newemb)
end