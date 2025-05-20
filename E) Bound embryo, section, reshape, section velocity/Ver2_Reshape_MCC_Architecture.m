%% Analyze resized fits
%Sample1
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Sections_Defined_Fin.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S4\ResMemAct.mat');

%Sample2
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\Defined Crops\Original_Final_Sections_Vel.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample5\Defined Crops\Resized_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T1_S5\ResMemAct.mat');

%Sample3
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\Defined Crops\Original_Final_Sections_Vel.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample2\Defined Crops\Resized_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S2\ResMemAct.mat');

%Sample4
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Original_Final_Sections_Vel.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Resized_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T2_S4\ResMemAct.mat');

%Sample5
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample3\Defined Crops\Original_Final_Sections_Vel.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample3\Defined Crops\Resized_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S3\ResMemAct.mat');

%Sample6
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Original_Final_Sections_Vel.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Resized_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Segmentation Codes\All Full Embryos\Final Sections\T3_S4\ResMemAct.mat');
%% Newpath:
%Laevis:
%Sample 9
%ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\');
%Sample 10
%ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\');
%Axolotl:
%Sample 4
ppath = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\E) After resizing, reshaping embryo\');
%Sample 7
%ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\');
%....................................................................................................................................................
load([ppath,'Resized Images\Original_Final_Sections_Vel.mat']);
%load([ppath,'Resized Images\Resized_Final_Sections.mat']);%For Apical coverage
load([ppath,'Resized Images\Resized_Final_Sections_Cilia.mat']); %For cilia coverage
load([ppath,'Resized Images\ResMemAct.mat']);
%% Initial Visuzalization
%figure;imshowpair(Bound_img2,Bound_img12)
figure;imshowpair(Bound_img2,Imem2)
%% Crop from head
Newemb = Bound_img12;
%Newemb = Fin_up;
hcrp = 90;
Hres = imresize(Newemb,[size(Newemb,1),size(Newemb,2)-hcrp]);
figure;imshow(Hres)

Hpad = zeros(size(Newemb,1),hcrp);
Newemb_fin = [Hpad,Hres];
%Finemb = logical(Newemb_fin);
% figure;imshow(Finemb)
% figure;imshowpair(Bound_img12,Finemb)
figure;imshowpair(Bound_img2,Newemb_fin)

Imres = imresize(Imem2,[size(Newemb,1),size(Newemb,2)-hcrp]);
Imres_fin = [Hpad,Imres];
%% Redo Mid-Section from Sections: if needed
% Resmid = imresize(img,[szz(1,1)-crp,szz(1,2)]);
% upp = zeros(crpup,szz(1,2));
% dnn = zeros(crpdn,szz(1,2));
% Newmid = [upp;Resmid;dnn];
% %....................................................................................................................................................
% figure;imshow(Newmid)
% Newemb = [Sections12.Head,Newmid,Sections12.Tail];
% figure;imshow(Newemb)
% figure;imshowpair(Bound_img2,Newemb)
%....................................................................................................................................................
%Compress
% crp =30;
% crpdn = 15; 
% crpup = crp-crpdn; 
% img = Sections12.Mid;
% szz = size(img);
%% Apply sine transformation and then compress mid if needed using functions
%...............................................................................................................
% a = ncols/24; %S1 Try varying the amplitude of the sinusoid
% ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.07*-pi*xy(:,1)/nrows)]; %S1
%a = ncols/24;
%ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.07*-pi*xy(:,1)/nrows)];%For S1 compressed
% ifcn = @(xy) [xy(:,1), xy(:,2) + a*sin(0.35*pi*xy(:,1)/nrows)]; 
%...............................................................................................................
% a = ncols/28; %S1 Try varying the amplitude of the sinusoid
% ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.05*pi*xy(:,1)/nrows)]; %S2
%...............................................................................................................
%a = ncols/36; %S1 Try varying the amplitude of the sinusoid
%ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.07*-pi*xy(:,1)/nrows)]; %S3
%...............................................................................................................
% a = ncols/24; %S1 Try varying the amplitude of the tangent
% ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.07*pi*xy(:,1)/nrows)]; %S4
%...............................................................................................................
%a = ncols/36; %S1 Try varying the amplitude of the tangent
%ifcn = @(xy) [xy(:,1), xy(:,2) + a*tan(0.07*-pi*xy(:,1)/nrows)]; %S5
%...............................................................................................................
% a = ncols/18; %S1 Try varying the amplitude of the sin
% ifcn = @(xy) [xy(:,1), xy(:,2) + a*sin(0.28*pi*xy(:,1)/nrows)];  %S6
%figure;imshowpair(Bound_img2,Imem2)
% Adjust values until the fit is good
amp = 13;
freq = 0.28; %sin

% amp =  8; % Higher the number lower the amplitude
% freq = 0.1; %sin
[Inew,I_sinusoid] = applysinetransform(Imem2,amp,freq,Bound_img2);
[Iseg_new,~] = applysinetransform(Bound_img12,amp,freq,Bound_img2);
[Iact_new,~] = applysinetransform(Iact2,amp,freq,Bound_img2);

% amp=0.2;
% thr = 20;
% thr = [2:2:40];
% %amp = [0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.55]; %sin
% for kk = 1:length(thr)
%     %[Inew,I_sinusoid] = applysinetransform(Imem2,thr,amp(1,kk),Bound_img2);
%     [Inew,I_sinusoid] = applysinetransform(Imem2,thr(1,kk),amp,Bound_img2);
% end
%% Tangent transform
% Adjust values until the fit is good
freq2 = 0.05; %tan
amp2 =13;
%Test using both mem and resized segmented image 
%[Inew2,I_sinusoid2] = applytantransform('yes',Imres_fin,amp2,freq2,'down',Bound_img2); 
[Inew2,I_sinusoid2] = applytantransform('yes',Newemb_fin,amp2,freq2,'down',Bound_img2);
%...............................................................................................................
%% USE ANY OF THE REST STRATEGIES IF NEEDED
%...............................................................................................................
%% Using roipoly fit curve:
I = Imem2;
nrows = size(I,1);
ncols = size(I,2);
fill = 0;

p1 =  -2.566e-13;
p2 =   1.004e-09;
p3 =  -1.518e-06;
p4 =    0.001064;
p5 =     -0.3735;
p6 =       386.6;

ifcn = @(xy) [xy(:,1), (xy(:,2) + (p1.*xy(:,1).^5 + p2.*xy(:,1).^4 + p3.*xy(:,1).^3 + p4.*xy(:,1).^2 + p5.*xy(:,1) + p6)).*0.5];
tform = geometricTransform2d(ifcn);

%I_sinusoid = imwarp(I,tform,FillValues=fill);
%
Rin = imref2d([size(Imem2,1) size(Imem2,2)],[-1 1],[-1 1]);
Rout = imref2d([size(Imem2,1) size(Imem2,2)],[-1 1],[-1 1]);

% Apply inverse geometric transform to input image
%out = imwarp(Imem2,Rin,tform,'OutputView',Rout);
out = imwarp(Imem2,tform,FillValues=fill);
figure, imshow(out)
%% Using User Inputs Function 1...............................................................................................................
% crp =75;
% crpdn = 65; %S1

% crp =40;
% crpdn = 40; %S2

crp =30; %Set total crop
crpdn =5; %Distribute amount of crop in down direction. Up compression will be crp-crpdn

%[Newemb] = compressmid(crp,crpdn,Bound_img2,Bound_img12);
%[Newemb] = compressmid(crp,crpdn,Bound_img2,Inew);
%[Newemb] = compressmid(crp,crpdn,Bound_img2,Finemb);

% Ehen image appears select from where to where you want to compress image:
%[Newemb,h1,h2] = compressmid(crp,crpdn,Bound_img2,Imem2);
%[Newemb,h1,h2] = compressmid(crp,crpdn,Bound_img2,Bound_img12);
[Newemb,~,~] = compressmid(crp,crpdn,Bound_img2,Embfin);
figure;imshowpair(Bound_img2,Newemb)
%..............................................................................................................................................
crp2 =30; %Set total crop
crpdn2 = 10;
% 
[Newemb2,~,~] = compressmid(crp2,crpdn2,Bound_img2,Newemb);
figure;imshowpair(Bound_img2,Newemb2)
%% Rotate image:
Newemb2 = imrotate(Newemb_fin,3,'crop');
%Newemb2 = imrotate(Embfin,2.5,'crop');
figure;imshow(Newemb2)
figure;imshowpair(Bound_img2,Newemb2)
%% Sectioned rotation:
figure;imshowpair(Bound_img2,Embfin)
aa1 = drawpoint; a1 = round(aa1.Position);
aa2 = drawpoint; a2 = round(aa2.Position);
stt = Embfin(1:end,1:a1);
req_img = Embfin(1:end,1:a1);
%% Function 2...............................................................................................................
crp =20;
crpdn = 19; 
[Newemb2] = compressmid(crp,crpdn,Bound_img2,Embfin);
%........................................................................................................................................
%%
S1 = bwconncomp(Bound_img12,8); S1.NumObjects
S2 = bwconncomp(Iseg_new,8); S2.NumObjects
%% Load if reshape needs to be manually segregated:
ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\');
load([ppath,'Original_Final_Sections_Vel.mat']);
load([ppath,'Resized_Final_Sections.mat']);
load([ppath,'Reshaped_Seg_Fin.mat']);

% ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\');
% load([ppath,'Resized_Final_Sections_Cilia.mat']);
% load([ppath,'Reshaped_Seg_Cilia.mat']);
%% To add or remove areas in manual segmentation
%Embfin = Iseg_new;
figure;imshow(Bound_img12)
figure;imshow(Embfin)
S1 = bwconncomp(Bound_img12,8); S1.NumObjects
S2 = bwconncomp(Embfin,8); S2.NumObjects
%%
[xi,yi] = addorremove2(); %remove area
%[xi2,yi2] = addorremove2(); %add area
%%  To add or remove areas in manual segmentation
Fin = Embfin;
%Fin = Iseg_new;
for kk =1:length(xi)
    mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
    Fin(mask)=0;
end
S3 = bwconncomp(Fin,8); S3.NumObjects
figure;imshowpair(Fin,Embfin)
%%  To add and remove areas in manual segmentation
Fin = Embfin;
%Fin = Iseg_new;
for kk =1:length(xi)
    mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
    Fin(mask)=0;
end

Fin2 = Fin;
%Fin = Iseg_new;
for kk =1:length(xi2)
    mask = roipoly(Fin2, xi2{kk,1}, yi2{kk,1});
    Fin2(mask)=1;
end

S3 = bwconncomp(Fin2,8); S3.NumObjects
figure;imshowpair(Fin2,Embfin)
%%
clear xi yi Embfin
Embfin = Fin;
%% Get sections and save again
%Embfin = Iseg_new;
%clear Sections12 HH1 TT1 MU1 MD1 MM1
[HH11,MM11,TT11,MU11,MD11,~] = sectionembryofin(Embfin);
Sections12.Head = HH11;
Sections12.Tail = TT11;
Sections12.Midup = MU11;
Sections12.Middown = MD11;
Sections12.Mid = MM11;
visuzalize_sections(Embfin,Sections12)
%% For reverse:
% clear Sections12 HH1 TT1 MU1 MD1 MM1
% [HH11,MM11,TT11,MU11,MD11,cropmaster12] = sectionembryofin_reverse(Embfin);
% Sections12.Head = TT11;
% Sections12.Tail = HH11;
% Sections12.Midup = MU11;
% Sections12.Middown = MD11;
% Sections12.Mid = MM11;
% visuzalize_sections(Embfin,Sections12)
%% Save reshaped construct of segmented MCCs
save([ppath,'Resized Images\Reshaped_Seg.mat'],'Embfin','Sections12');
save([ppath,'Resized Images\Reshaped_Act_Mem.mat'],'Inew','Iact_new','amp','freq');
%% Save reshaped construct of segmented 'Cilia Coverage':
save([ppath,'\Reshaped_Seg_Fin.mat'],'Embfin','Sections12');
%%
figure;imshow(Bound_img2)
m1 = drawpolyline; p1 = m1.Position;
figure;imshow(Bound_img12)
m2 = drawpolyline; p2 = m2.Position;
%%
figure;plot(p1(:,1),p1(:,2))
set(gca,'Ydir','reverse')

figure;plot(p2(:,1),p2(:,2))
set(gca,'Ydir','reverse')
%% Applying polynomial functions:
figure;imshowpair(Bound_img2,Bound_img12)
h1 = drawpolyline("Color",'c'); %Fixed Line
p1 = h1.Position;
h2 = drawpolyline("Color",'g'); %Moving line
p2 = h2.Position;
%%
% pairs1 = [1 1; 5 21; 17 40; 28 1; 32 20; 45 40; 72 1; 77 20; 90 40];
% pairs2 = [1 1; 1 21; 1 40; 20 1; 20 20; 20 40; 40 1; 40 20; 40 40];
% %t_poly = cp2tform(p1, p2, 'polynomial',2);
% %I = checkerboard(10, 2);
% t_poly = cp2tform(pairs1, pairs2, 'polynomial',2);
% J = imtransform(Bound_img12,t_poly);
% figure;imshow(J)
%% Using gradient crop:
%[Newemb,xstp,Rati] = gradient_resize_single(Bound_img2,Embfin);
%stp = 50;
%[Newemb2,xstp,Rati] = gradient_resize_single(Bound_img2,Newemb_fin,200);
tic
%[Newemb3,xistep,Rat] = Smooth_gradient_resize_single(Bound_img2,Embfin);
[Newemb3,xistep,Rat] = Smooth_gradient_resize_single(Bound_img2,Newemb_fin);
figure;imshowpair(Bound_img2,Newemb3)
figure;imshowpair(Newemb_fin,Newemb3)
toc
%%
tic
%[Newemb3,xistep,Rat] = Smooth_gradient_resize_single(Bound_img2,Embfin);
%[Newemb4,xistep2,Rat2] = Smooth_gradient_resize_single_down(Bound_img2,Newemb3);
%[Newemb4,xistep2,Rat2] = Smooth_gradient_resize_single(Bound_img2,Newemb3);
[Newemb4,xistep2,Rat2]  = Smooth_gradient_resize_single_V2(Bound_img2,Newemb2,'up');
figure;imshowpair(Bound_img2,Newemb4)
figure;imshowpair(Newemb2,Newemb4)
toc
%% Uniform Crop Down...............................................................................................................
% crp2 =25;
% crpdn2 = 25; 
% [Newemb4] = compressmid(crp2,crpdn2,Bound_img2,Newemb3);
%%
tic
[Newemb5,xistep3,Rat3]  = Smooth_gradient_resize_half(Bound_img2,Newemb2,'up');
figure;imshowpair(Bound_img2,Newemb5)
figure;imshowpair(Embfin,Newemb5)
toc
%%
B22 = Newemb5;
B2_ind = (Newemb5<0.4);
B22(B2_ind)=0;

B1  = logical(Bound_img11);
B2  = logical(B22);

S1 = bwconncomp(B1,8); S1.NumObjects
S2 = bwconncomp(B2,8); S2.NumObjects
%%
%[xi,yi] = addorremove2(); %remove area
%[xi2,yi2] = addorremove2(); %add area
%%  To add and remove areas in manual segmentation
Fin = B2;
%Fin = Iseg_new;
for kk =1:length(xi)
    mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
    Fin(mask)=0;
end

Fin2 = Fin;
%Fin = Iseg_new;
for kk =1:length(xi2)
    mask = roipoly(Fin2, xi2{kk,1}, yi2{kk,1});
    Fin2(mask)=1;
end

S3 = bwconncomp(Fin2,8); S3.NumObjects
figure;imshowpair(Fin2,B2)
%%
v = VideoWriter('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\Resized Images\Reshape3.mp4', 'MPEG-4');
v.FrameRate=5;
open(v);

%fig = figure('Position', get(0, 'Screensize'));

%figure;imshowpair(Bound_img2,Bound_img12)
figure;imshowpair(Bound_img12,Embfin)
frame = getframe(gcf);
writeVideo(v, frame)

%figure;imshowpair(Bound_img2,Embfin)
figure;imshowpair(Embfin,Newemb_fin)
frame = getframe(gcf);
writeVideo(v, frame)

%figure;imshowpair(Bound_img2,Newemb_fin)
figure;imshowpair(Newemb_fin,Newemb3)
frame = getframe(gcf);
writeVideo(v, frame)

%figure;imshowpair(Bound_img2,Newemb3)
figure;imshowpair(Newemb3,Newemb4)
frame = getframe(gcf);
writeVideo(v, frame)

%figure;imshowpair(Bound_img2,Newemb4)
figure;imshowpair(Newemb4,Newemb5)
frame = getframe(gcf);
writeVideo(v, frame)

%figure;imshowpair(Bound_img2,Fin2)
figure;imshowpair(Newemb5,Fin2)
frame = getframe(gcf);
writeVideo(v, frame)

close(v);
close all;clc
%% Simple x y shift:
prompt = {'Direction of crop:','Where to add pad:'};
dlgtitle = 'Input'; %Mem, tub, or both
dims = [1 10];
definput = {'ydir','bottom'}; %List: 1)ydir, xidr 2) bottom, left
answer = inputdlg(prompt,dlgtitle,dims,definput);
crpdis = 15;

if(strcmpi('ydir',answer{1,1}))
    tempimg = Embfin(1+crpdis:end,1:end);
    ypad = zeros(crpdis,size(Embfin,2));
    if(strcmpi('bottom',answer{2,1}))
        Newemb = [tempimg;ypad];
    else
        Newemb = [ypad;tempimg];
    end
elseif(strcmpi('xdir',answer{1,1}))
    tempimg = Embfin(1+crpdis:end,1:end);
    ypad = zeros(size(Embfin,1),crpdis);
    if(strcmpi('left',answer{2,1}))
        Newemb = [tempimg;ypad];
    else
        Newemb = [ypad;tempimg];
    end
end
figure;imshowpair(Embfin,Newemb)
figure;imshowpair(Bound_img2,Newemb)
%% Test V3: Smooth gradient:
% direction for concavity is concave (shifts contents up) or convex (Shift cells down)
% direction for bend is sidedown (shifts contents up) or sideup(Shift cells down)
[Center_up,xistep1,Rat1]  = Smooth_gradient_resize_single_V3_Concavity(Org.Im,Org.mask2,'concave');
[Center_down,xistep2,Rat2]  = Smooth_gradient_resize_single_V3_Concavity(Org.Im,Org.mask2,'convex');
[Sides_up,~,~]  = Smooth_gradient_resize_single_V3_Bend(Org.Im,Org.mask2,'sideup');
[Sides_down,~,~]  = Smooth_gradient_resize_single_V3_Bend(Org.Im,Org.mask2,'sidedown');
%%
figure;imshowpair(Org.Im,Center_up)
figure;imshowpair(Org.Im,Center_down)
figure;imshowpair(Org.Im,Sides_up)
figure;imshowpair(Org.Im,Sides_down)

figure;imshowpair(Org.mask2,Center_up)
figure;imshowpair(Org.mask2,Center_down)
figure;imshowpair(Org.mask2,Sides_up)
figure;imshowpair(Org.mask2,Sides_down)