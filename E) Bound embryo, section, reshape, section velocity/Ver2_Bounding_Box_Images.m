%% For axolotls cilia coverage instead of apical area repeat:
%ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\');
%Sample 7
% ppath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\');
%....................................................................................................................................................
% load([ppath,'Resized Images\Original_Final_Sections_Vel.mat']);
% load([ppath,'Resized Images\Original_Final_Sections_Mem.mat']);
% load([ppath,'Resized Images\ResMemAct.mat']);
%clear confseg
%% New loading variables Axolotls and Laevis:
%Laevis:
%mpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\');
%mpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\');
%Axolotl:
% mpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 4\');
% mpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\');
mpath = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\C) Full embryo visualization\');
h= dir(mpath);
names = {h.name};
ff1 = contains({h.name},'Mem.mat');
ff2 = contains({h.name},'Tub.mat');
%.......................................................................................................................
%ff3 = contains({h.name},'Full_Embryo.mat'); % For Laevis
%ff3 = contains({h.name},'Full_Embryo_Apical3.mat'); % For Axolotl apical area
ff3 = contains({h.name},'Full_Embryo_Cilia.mat'); % For Axolotl cilia
%.......................................................................................................................
fid1 = find(ff1==1);
fid2 = find(ff2==1);
fid3 = find(ff3==1);
selname1 = names(fid1);
selname2 = names(fid2);
selname3 = names(fid3);
%
Mem = load([mpath,cell2mat(selname1)]);
Act = load([mpath,cell2mat(selname2)]);
conf_mem = Mem.Imem_rotate;
conf_act = Act.Itub_rotate;

% For Rest of Data
% load([mpath,cell2mat(selname3)]);
% conf_seg = Seg;

% For Axolotl Apical area
% Seg = load([mpath,cell2mat(selname3)]);
% conf_seg = Seg.BW1;

% For Axolotl Cilia area
Seg = load([mpath,cell2mat(selname3)]);
conf_seg = Seg.Seg;
%% Read raw velocity Image:
%Laevis:
%rawvelpath = ('D:\Embryo Tile Scans\Final Trials\Laevis\Trial2\Sample 9\Flow Data\S9_Big.tif');
%rawvelpath =('D:\Embryo Tile Scans\Final Trials\Laevis\Trial2\Sample 10\Flow Data\S100000_Big.tif');
%Axolotl:
rawvelpath =('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\Flow\S40000.tif');

Im=imread(rawvelpath);
%%
%1) IF 2) Velocity
[Bound_img1, Sections1, croppos1, cropmaster1, mask1] = findbounding_sections(conf_mem);
[Bound_img2, Sections2, croppos2, cropmaster2, mask2] = findbounding_sections(Im);
%% Visualize Sections
visuzalize_sections(Bound_img1,Sections1)
visuzalize_sections(Bound_img2,Sections2)
%% Get Segmented sections: Raw
% %Original Confocal/Raw image cropped and sectioned%...........................................
[Bound_img11,Sections11,~] = getsectionsfromcrop(conf_seg,croppos1); %Default flow left to right or head left faced
%[Bound_img11,Sections11,cropmaster11] = getsectionsfromcrop_reverse(conf_seg,croppos1); %NOT DEFAULT if flow right to left 

[Bound_img13,Sections13,~] = getsectionsfromcrop(conf_act,croppos1);

visuzalize_sections(Bound_img11,Sections11)
visuzalize_sections(Bound_img13,Sections13)
%% Confocal and velocity data for other images
sz = size(Bound_img2);
Bound_img12 = imresize(Bound_img11,sz(1,1:2));
figure;imshow(Bound_img12)
figure;imshowpair(Bound_img2,Bound_img12)

S11 = bwconncomp(Bound_img11,8); S11.NumObjects
S22 = bwconncomp(Bound_img12,8); S22.NumObjects
%% Get logical of image:
B22 = Bound_img12;
B2_ind = (Bound_img12<0.4);
B22(B2_ind)=0;

B1  = logical(Bound_img11);
B2  = logical(B22);

S1 = bwconncomp(B1,8); S1.NumObjects
S2 = bwconncomp(B2,8); S2.NumObjects
%% Clear Bound img and Save it:
clear Bound_img12
Bound_img12 = B2;
Bound_img11 = logical(Bound_img11);
%% To add or remove areas in manual segmentation
%figure;imshowpair(Bound_img1,Bound_img11)
% figure;imshow(Bound_img11)
% figure;imshow(Bound_img12)
% [xi,yi] = addorremove2(); %remove area
%[xi2,yi2] = addorremove2(); %add area
%%  To add or remove areas in manual segmentation
% Fin = Bound_img12;
% %Fin = Fimg.T1_S4_Fin;
% for kk =1:length(xi)
%     mask = roipoly(Fin, xi{kk,1}, yi{kk,1});
%     Fin(mask)=0;
% end

%...............................................................................................................................................

%Fin2 = Fin;
%Fin2 =Bound_img11;
% for kk =1:length(xi2)
%     mask = roipoly(Fin2, xi2{kk,1}, yi2{kk,1});
%     Fin2(mask)=1;
% end

%figure; imshow(Fin2)
%% To adjust resized segmentations
%figure;imshow(Bound_img12)
% Bound_img12 =Fin;
% clear xi yi Fin
% [xi,yi] = addorremove(Bound_img12);
%% To adjust resized segmentations
% Fin2 = Bound_img12;
% for kk =1:length(xi)
%     mask = roipoly(Fin2, xi{kk,1}, yi{kk,1});
%     Fin2(mask)=0;
% end
% 
% figure; imshow(Fin2)
% xold =xi; yold =yi;
% clear xi yi
%%
% S1 = bwconncomp(Bound_img11,8); S1.NumObjects
% S2 = bwconncomp(Bound_img12,8); S2.NumObjects
% S3 = bwconncomp(Fin,8); S3.NumObjects
%Bound_img12 =Fin;
%%
[HH11,MM11,TT11,MU11,MD11,cropmaster12] = sectionembryofin(Bound_img12);
Sections12.Head = HH11;
Sections12.Tail = TT11;
Sections12.Midup = MU11;
Sections12.Middown = MD11;
Sections12.Mid = MM11;
visuzalize_sections(Bound_img12,Sections12)
%% NOT DEFAULT Resized Confocal
% sz = size(Bound_img2);
% Bound_img12 = imresize(Bound_img11,sz(1,1:2));
% [HH11,MM11,TT11,MU11,MD11,cropmaster12] = sectionembryofin_reverse(Bound_img12);
% Sections12.Head = TT11;
% Sections12.Tail = HH11;
% Sections12.Midup = MU11;
% Sections12.Middown = MD11;
% Sections12.Mid = MM11;
% visuzalize_sections(Bound_img12,Sections12)
%% Save only resized fin
if (exist([mpath,'Resized Images'])~=7)
    mkdir([mpath,'Resized Images'])
end
save([mpath,'Resized Images\ResizedFin.mat'],'Bound_img12','Sections12')
%%
save([mpath,'Resized Images\Original_Final_Sections_Mem.mat'],'Bound_img1','Sections1','conf_mem','croppos1','mask1','cropmaster1','mpath')
save([mpath,'Resized Images\Original_Final_Sections_Act.mat'],'Bound_img13','Sections13','conf_act')
save([mpath,'Resized Images\Original_Final_Sections_Vel.mat'],'Bound_img2','Sections2','Im','croppos2','mask2','cropmaster2','rawvelpath')
save([mpath,'Resized Images\Original_Final_Sections.mat'],'Bound_img11','Sections11','conf_seg','croppos1','mpath')
save([mpath,'Resized Images\Resized_Final_Sections.mat'],'Bound_img12','Sections12','croppos2','rawvelpath')

save([mpath,'Resized Images\RawFin.mat'],'Bound_img11');
save([mpath,'Resized Images\ResizedFin.mat'],'Bound_img12');
%% Resave cilia coverage:
% save([mpath,'Resized Images\ResizedFin_Cilia.mat'],'Bound_img12','Sections12')
% save([mpath,'Resized Images\Original_Final_Sections_Cilia.mat'],'Bound_img11','Sections11','conf_seg','croppos1','mpath')
% save([mpath,'Resized Images\Resized_Final_Sections_Cilia.mat'],'Bound_img12','Sections12','croppos2','rawvelpath')
%% Load all if needed:
% mpath=('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\');
% load([mpath,'Resized Images\Original_Final_Sections_Mem.mat']);
% load([mpath,'Resized Images\Original_Final_Sections_Act.mat']);
% load([mpath,'Resized Images\Original_Final_Sections_Vel.mat']);
% load([mpath,'Resized Images\Original_Final_Sections.mat']);
% load([mpath,'Resized Images\Resized_Final_Sections.mat']);
%% Resized Mem Act and save:
SZ = size(Bound_img2);
Iact2 = imresize(Bound_img13,SZ(:,1:2));
Imem2 = imresize(Bound_img1,SZ(:,1:2));

% Cilia
[HH11,MM11,TT11,MU11,MD11,~] = sectionembryofin(Iact2);
Sections23.Head = HH11;
Sections23.Tail = TT11;
Sections23.Midup = MU11;
Sections23.Middown = MD11;
Sections23.Mid = MM11;
visuzalize_sections(Iact2,Sections23)

clear HH11 MM11 TT11 MU11 MD11

% Membrane
[HH11,MM11,TT11,MU11,MD11,~] = sectionembryofin(Imem2);
Sections24.Head = HH11;
Sections24.Tail = TT11;
Sections24.Midup = MU11;
Sections24.Middown = MD11;
Sections24.Mid = MM11;
visuzalize_sections(Imem2,Sections24)

clear HH11 MM11 TT11 MU11 MD11
%%
save([mpath,'Resized Images\ResMemAct.mat'],'Sections23','Sections24','Iact2','Imem2')
%% Raw Mem and Act

% Raw Cilia
[Bound_img13,Sections13,~] = getsectionsfromcrop(KK.Iact,Org.croppos1);
[Bound_img14,Sections14,~] = getsectionsfromcrop(KK.Imem,Org.croppos1);