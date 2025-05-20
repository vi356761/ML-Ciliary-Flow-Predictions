%% Get Veocity Sections
% Tropicalis:
% Sample 1 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\');
% velpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample4\All Velocity\');
% Res = load([orgpath,'Finresize_S1.mat']); % For Laevis

% Sample 4 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\');
% velpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\');
% Res = load([orgpath,'Finresize_S4.mat']); % For Laevis
%................................................................................................................................................................
%................................................................................................................................................................
% Laevis:
% Sample 9 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 9\Resized Images\');
% velpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S9\');
% Res = load([orgpath,'Reshaped_Seg_Fin.mat']); % For Laevis
%................................................................................................................................................................
% Sample 10 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\');
% velpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S10\');
% Res = load([orgpath,'Reshaped_Seg_Fin.mat']); % For Laevis
%................................................................................................................................................................
%................................................................................................................................................................
% Axolotl:
% Sample 4 
orgpath = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\E) After resizing, reshaping embryo\Resized Images\');
velpath = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\D) After velocity preparation and section\');
Res = load('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\E) After resizing, reshaping embryo\Reshaped Data\Reshaped_Seg_Cilia_Fin.mat'); % For Axolotls
%................................................................................................................................................................
% Sample 7 
% orgpath = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\');
% velpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S7\');
% Res = load([orgpath,'Reshaped_Seg_Cilia_Fin.mat']); % For Axolotls
%................................................................................................................................................................
%Org = load([orgpath,'Sections_Defined_Fin.mat']); % ONLY FOR TROPS S1
%Org = load([orgpath,'velocity_crop.mat.mat']); % ONLY FOR TROPS S2
%................................................................................................................................................................
Org = load([orgpath,'Original_Final_Sections_Vel.mat']); %get raw velocity crops
Map = load([velpath,'All_Vel_Vectors_Map_Norm.mat']); % Get normalized velocity mapped to the embryo
Map2 = load([velpath,'All_Vel_Vectors_Map.mat']); % Raw velocity
TT = load([velpath,'All_Vel_Vectors.mat']);
%% Draw New Mask:
figure;imshowpair(Org.Bound_img2,Res.Embfin)
msk = roipoly;
% figure;imshowpair(Org.Bound_img2,msk)
% figure;imshowpair(Res.Embfin,msk)
%% For For raw velocity data:
% velmap_norm = Map.velmap;
% velmap_norm(~msk) =0;
% vdiv_norm = Map.vdiv;
% vdiv_norm(~msk) = 0;
% thetamap = Map.thetamap;
% thetamap(~msk) = 0;
% ucomap = Map.ucomap;
% ucomap(~msk) = 0;
% vcomap = Map.vcomap;
% vcomap(~msk) = 0;
% vvdivmod = vdivmod;
% vvdivmod(~msk) =0;
% vvdivmod_norm = vdivmod_norm;
% vvdivmod_norm(~msk) =0;
% neg_ucomap = Map.neg_ucomap;
% neg_ucomap(~msk) = 0; 
%% For normalized data:
velmap_norm = imcrop(Map.velmap_norm,Org.croppos2);
velmap_norm(~msk) =0;
vdiv_norm = imcrop(Map.vdiv_norm,Org.croppos2);
vdiv_norm(~msk) = 0;
vdiv_norm2 = imcrop(Map2.vdiv,Org.croppos2);
vdiv_norm2(~msk) = 0;
thetamap = imcrop(Map.thetamap,Org.croppos2);
thetamap(~msk) = 0;
ucomap = imcrop(Map.ucomap_norm,Org.croppos2);
ucomap(~msk) = 0;
vcomap = imcrop(Map.vcomap_norm,Org.croppos2);
vcomap(~msk) = 0;
% vvdivmod = imcrop(vdivmod,Org.croppos2);
% vvdivmod(~msk) =0;
% vvdivmod_norm = imcrop(vdivmod_norm,Org.croppos2);
% vvdivmod_norm(~msk) =0;

%For flipped matrix
ucomap2 = imcrop(Map2.ucomap,Org.croppos2);
ucomap2(~msk) = 0;
vcomap2 = imcrop(Map2.vcomap,Org.croppos2);
vcomap2(~msk) = 0;
%% Visualize vectors
n=5;
Im = rgb2gray(Org.Bound_img2);
%Im(~msk)=0;
[xgrid,ygrid] = meshgrid(1:1:size(Im,2),1:1:size(Im,1)); 
figure; imshow(Im); hold on;
q=quiver(xgrid(1:n:end,1:n:end),ygrid(1:n:end,1:n:end),ucomap2(1:n:end,1:n:end),-vcomap2(1:n:end,1:n:end),'r');
q.MaxHeadSize = 3.5;
q.LineWidth = 3.5;
q.AutoScaleFactor = 12;
hold off;
%% DEFAULT 
[Velmag,Velmapmag] = V2_Get_velocity_sections(velmap_norm);
[Veldiv,Velmapdiv] = V2_Get_velocity_sections(vdiv_norm);
[Veldiv_org,Velmapdiv_org] = V2_Get_velocity_sections(vdiv_norm2);
[Veltheta,Velmaptheta] = V2_Get_velocity_sections(thetamap);
[Velucom,Velmapucom] = V2_Get_velocity_sections(ucomap);
[Velvcom,Velmapvcom] = V2_Get_velocity_sections(vcomap);
%..............................................................................................................................................................................
% [Velshear,Velmapshear] = Get_velocity_sections(Map.vshear,Org.croppos2);
% [Velstrain,Velmapstrain] = Get_velocity_sections(Map.vstrain,Org.croppos2);
% [Vorticity,Vorticitymap] = Get_velocity_sections(Map.vorticitymap,Org.croppos2);
% [Veldiv2,Velmapdiv2] = V2_Get_velocity_sections(vvdivmod);
% [Veldiv_norm2,Velmapdiv_norm2] = V2_Get_velocity_sections(vvdivmod_norm);
%[Velucom_neg,Velmapucom_neg] = Get_velocity_sections(neg_ucomap,Org.croppos2);
%% NOT DEFAULT
% If flow is from right to left strain and divergence won't change
% Ucomponenet, vorticity, and shear rate is -ve of flow from left to right

% [Velmag,Velmapmag] = V2_Get_velocity_section_reverse(velmap_norm);
% [Veldiv,Velmapdiv] = V2_Get_velocity_section_reverse(vdiv_norm);
% [Veldiv_org,Velmapdiv_org] = V2_Get_velocity_section_reverse(vdiv_norm2);
% [Veltheta,Velmaptheta] = V2_Get_velocity_section_reverse(thetamap);
% [Velucom,Velmapucom] = V2_Get_velocity_section_reverse(ucomap);
% [Velvcom,Velmapvcom] = V2_Get_velocity_section_reverse(vcomap);
%..............................................................................................................................................................................
% [Velmag,Velmapmag] = Get_velocity_sections_reverse(Map.velmap,Org.croppos2);
% [Velucom,Velmapucom] = Get_velocity_sections_reverse_oppflow(Map.ucomap,Org.croppos2);
% [Velvcom,Velmapvcom] = Get_velocity_sections_reverse(Map.vcomap,Org.croppos2);
% [Veldiv,Velmapdiv] = Get_velocity_sections_reverse(Map.vdiv,Org.croppos2);
% [Velshear,Velmapshear] = Get_velocity_sections_reverse_oppflow(Map.vshear,Org.croppos2);
% [Velstrain,Velmapstrain] = Get_velocity_sections_reverse(Map.vstrain,Org.croppos2);
% [Vorticity,Vorticitymap] = Get_velocity_sections_reverse_oppflow(Map.vorticitymap,Org.croppos2);
%% Visualize Sections
% figure;montage(Velmaptheta,'Size',[2 2])
% figure;montage(Velmapmag,'Size',[2 2])
%% Visualize raw velocity:
% rawvelocity{1,1} = [Org.Sections2.Head];
% rawvelocity{2,1} = [Org.Sections2.Midup];
% rawvelocity{3,1} = [Org.Sections2.Middown];
% rawvelocity{4,1} = [Org.Sections2.Tail];
% figure;montage(rawvelocity,'Size',[2 2])
%% Save mapped cropped resized velocities
if(exist([velpath,'Sectioned Velocity'])~=7)
    mkdir([velpath,'Sectioned Velocity'])
end

save([velpath,'Sectioned Velocity','\Sectioned_Velocity.mat']);
save([velpath,'Sectioned Velocity','\Only_Output.mat'],'Velmapdiv','Velmaptheta','Velmapmag');
%save([velpath,'Sectioned Velocity','\Modified_Divergence.mat'],'Veldiv2','Veldiv_norm2','Velmapdiv_norm2','Velmapdiv2');
save([velpath,'Sectioned Velocity','\Divergence.mat'],'Veldiv','vdiv_norm','Velmapdiv','Veldiv_org','Velmapdiv_org');
%% Generate flipped versions:
Flip_x = flip(-ucomap2,2);
Flip_y = flip(vcomap2,2);
Flip_mag = sqrt(Flip_x.^2 + Flip_y.^2 );
Flip_mag_norm = flip(velmap_norm,2); 
Flip_theta = atan2d(Flip_y,Flip_x);
Flip_div1 = flip(vdiv_norm,2);
Flip_div2 = flip(vdiv_norm2,2);
%% Flipped image:
Bound2_Flip = flip(Org.Bound_img2,2);
[HH1,MM1,TT1,MU1,MD1,~] = sectionembryofin_reverse(Bound2_Flip); %Default
Sections2.Head = TT1; %Default
Sections2.Tail = HH1; %Default
%..............................................................................................................................................................................
% [HH1,MM1,TT1,MU1,MD1,~] = sectionembryofin(Bound2_Flip);%Not default
% Sections2.Head = HH1; %Not default
% Sections2.Tail = TT1; %Not default
%..............................................................................................................................................................................
Sections2.Midup = MU1;
Sections2.Middown = MD1;
Sections2.Mid = MM1;
visuzalize_sections(Bound2_Flip,Sections2)
%..............................................................................................................................................................................
%..............................................................................................................................................................................
%..............................................................................................................................................................................
%..............................................................................................................................................................................
Embfin_Flip = flip(Res.Embfin,2);
[HH11,MM11,TT11,MU11,MD11,~] = sectionembryofin_reverse(Embfin_Flip);%Default
Sections12.Head = TT11; %Default
Sections12.Tail = HH11; %Default
%..............................................................................................................................................................................
% [HH11,MM11,TT11,MU11,MD11,~] = sectionembryofin(Embfin_Flip);%Not default
% Sections12.Head = HH11; %Not default
% Sections12.Tail = TT11; %Not default
%..............................................................................................................................................................................

Sections12.Midup = MU11;
Sections12.Middown = MD11;
Sections12.Mid = MM11;
visuzalize_sections(Embfin_Flip,Sections12)

figure;imshowpair(Sections2.Head,Sections12.Head)
figure;imshowpair(Sections2.Tail,Sections12.Tail)
figure;imshowpair(Sections2.Mid,Sections12.Mid)
%% Make new crop
% new_start = (size(Org.Im,2))+1- (Org.croppos2(1,1) + Org.croppos2(1,3));
% New_croppos = Org.croppos2;
% New_croppos (1,1) = new_start;
% Test_img = imcrop(flip(Org.Im,2),New_croppos);
% figure;imshow(Test_img)
% figure; montage([Org.Bound_img2;Test_img],'Size',[1 1])
%% Get flipped sections: Default
[Velucom2,Velmapucom2] = V2_Get_velocity_sections(ucomap2);%This is from raw velocity not normalized
[Velvcom2,Velmapvcom2] = V2_Get_velocity_sections(vcomap2);%This is from raw velocity not normalized
[Velucom_flip,Velmapucom_flip] = V2_Get_velocity_section_reverse(Flip_x); %This is from raw velocity not normalized
[Velvcom_flip,Velmapvcom_flip] = V2_Get_velocity_section_reverse(Flip_y); %This is from raw velocity not normalized
% All normalized values (except theta)
[Velmag_flip,Velmapmag_flip] = V2_Get_velocity_section_reverse(Flip_mag_norm);
[Veltheta_flip,Velmaptheta_flip] = V2_Get_velocity_section_reverse(Flip_theta);
[Veldiv_flip1,Velmapdiv_flip1] = V2_Get_velocity_section_reverse(Flip_div1);
[Veldiv_flip2,Velmapdiv_flip2] = V2_Get_velocity_section_reverse(Flip_div2);
%% Get flipped sections: Not default
% [Velucom2,Velmapucom2] = V2_Get_velocity_section_reverse(ucomap2);%This is from raw velocity not normalized
% [Velvcom2,Velmapvcom2] = V2_Get_velocity_section_reverse(vcomap2);%This is from raw velocity not normalized
% [Velucom_flip,Velmapucom_flip] = V2_Get_velocity_sections(Flip_x); %This is from raw velocity not normalized
% [Velvcom_flip,Velmapvcom_flip] = V2_Get_velocity_sections(Flip_y); %This is from raw velocity not normalized
% % All normalized values (except theta)
% [Velmag_flip,Velmapmag_flip] = V2_Get_velocity_sections(Flip_mag_norm);
% [Veltheta_flip,Velmaptheta_flip] = V2_Get_velocity_sections(Flip_theta);
% [Veldiv_flip1,Velmapdiv_flip1] = V2_Get_velocity_sections(Flip_div1);
% [Veldiv_flip2,Velmapdiv_flip2] = V2_Get_velocity_sections(Flip_div2);
%% Save flipped versions:
save([orgpath,'Reshaped_Seg_Cilia_Fin_Flip.mat'],'Embfin_Flip','Sections12')
save([orgpath,'Original_Final_Sections_Vel_Flip.mat'],'Bound2_Flip','Sections2')
save([velpath,'Sectioned Velocity','\Sectioned_Velocity_Flipped.mat'],'Flip_x','Flip_y','Flip_mag','Flip_mag_norm','Flip_theta','Flip_div1','Flip_div2','Embfin_Flip','Velucom_flip','Velmapucom_flip','Velvcom_flip','Velmapvcom_flip','Velmag_flip','Velmapmag_flip','Veltheta_flip','Velmaptheta_flip','Veldiv_flip1','Velmapdiv_flip1','Veldiv_flip2','Velmapdiv_flip2');
save([velpath,'Sectioned Velocity','\Only_Output_Flipped.mat'],'Velmapdiv_flip1','Velmaptheta_flip','Velmapmag_flip');
save([velpath,'Sectioned Velocity','\Divergence_Flipped.mat'],'Veldiv_flip1','Velmapdiv_flip1','Veldiv_flip2','Velmapdiv_flip2');
%%
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Original_Final_Sections_Mem.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Original_Final_Sections_Vel.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Original_Final_Sections.mat');
% load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial3\Sample4\Defined Crops\Resized_Final_Sections.mat');
%% For reverse velocity sections
% [Bound_img22,Sections22,cropmaster22] = getsectionsfromcrop_reverse(Im,croppos2);
% visuzalize_sections(Bound_img22,Sections22)
%% Get Velocity Sections
% Org = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S4\Defined Crops\Original_Final_Sections_Vel.mat');
% %Res_conf = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Validation Trial4\S1\Defined Crops\Resized_Final_Sections2.mat');
% Map = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial4\Sample4\All Velocity\All_Vel_Vectors_Map_Norm.mat');
%% DEFAULT 
% [Velmag,Velmapmag] = Get_velocity_sections(Map.velmap_norm,Org.croppos2);
% [Velucom,Velmapucom] = Get_velocity_sections(Map.ucomap_norm,Org.croppos2);
% [Velvcom,Velmapvcom] = Get_velocity_sections(Map.vcomap_norm,Org.croppos2);
% [Veldiv,Velmapdiv] = Get_velocity_sections(Map.vdiv_norm,Org.croppos2);
% [Velshear,Velmapshear] = Get_velocity_sections(Map.vshear_norm,Org.croppos2);
% [Velstrain,Velmapstrain] = Get_velocity_sections(Map.vstrain_norm,Org.croppos2);
% [Vorticity,Vorticitymap] = Get_velocity_sections(Map.vorticity_norm,Org.croppos2);
%% NOT DEFAULT
% If flow is from right to left strain and divergence won't change
% Ucomponenet, vorticity, and shear rate is -ve of flow from left to right
% 
% [Velmag,Velmapmag] = Get_velocity_sections_reverse(Map.velmap_norm,Org.croppos2);
% [Velucom,Velmapucom] = Get_velocity_sections_reverse_oppflow(Map.ucomap_norm,Org.croppos2);
% [Velvcom,Velmapvcom] = Get_velocity_sections_reverse(Map.vcomap_norm,Org.croppos2);
% [Veldiv,Velmapdiv] = Get_velocity_sections_reverse(Map.vdiv_norm,Org.croppos2);
% [Velshear,Velmapshear] = Get_velocity_sections_reverse_oppflow(Map.vshear_norm,Org.croppos2);
% [Velstrain,Velmapstrain] = Get_velocity_sections_reverse(Map.vstrain_norm,Org.croppos2);
% [Vorticity,Vorticitymap] = Get_velocity_sections_reverse_oppflow(Map.vorticity_norm,Org.croppos2);
%% Visualize if sectioned images are correct:
% [xgrid,ygrid] = meshgrid(1:1:size(Im,2),1:1:size(Im,1)); 
% figure;
% quiverC2D(xgrid(1:n:end,1:n:end),flip(ygrid(1:n:end,1:n:end),1),ucomap(1:n:end,1:n:end),vcomap(1:n:end,1:n:end),'scale',10,'LineWidth', 3,'MaxHeadSize',2)
% figure; imshow(Im); hold on;
% q=quiver(xgrid(1:n:end,1:n:end),ygrid(1:n:end,1:n:end),ucomap(1:n:end,1:n:end),-vcomap(1:n:end,1:n:end),'r');
% q.MaxHeadSize = 2;
% q.LineWidth = 2;
% q.AutoScaleFactor = 8;
% hold off;
%Full cropped bound embryo
visualize_section_vectors(Org.Bound_img2,ucomap2,vcomap2,5);
visualize_section_vectors(Bound2_Flip,Flip_x,Flip_y,5); %Mirror image
% Normal image
visualize_section_vectors(Org.Sections2.Head,Velmapucom2{1,1},Velmapvcom2{1,1},5);
visualize_section_vectors(Org.Sections2.Midup,Velmapucom2{2,1},Velmapvcom2{2,1},5);
visualize_section_vectors(Org.Sections2.Middown,Velmapucom2{3,1},Velmapvcom2{3,1},5);
visualize_section_vectors(Org.Sections2.Tail,Velmapucom2{4,1},Velmapvcom2{4,1},5);
% Flipped image
visualize_section_vectors(Sections2.Head,Velmapucom_flip{1,1},Velmapvcom_flip{1,1},5);
visualize_section_vectors(Sections2.Midup,Velmapucom_flip{2,1},Velmapvcom_flip{2,1},5);
visualize_section_vectors(Sections2.Middown,Velmapucom_flip{3,1},Velmapvcom_flip{3,1},5);
visualize_section_vectors(Sections2.Tail,Velmapucom_flip{4,1},Velmapvcom_flip{4,1},5);
%% Save flipped and reference if needed Normal:
path = ('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\New ROI\');
name1 = 'Head'; name2 = 'Midup'; name3 = 'Middown'; name4 = 'Tail';
visualize_section_vectors_save(Org.Sections2.Head,Velmapucom2{1,1},Velmapvcom2{1,1},path,name1,5);
visualize_section_vectors_save(Org.Sections2.Midup,Velmapucom2{2,1},Velmapvcom2{2,1},path,name2,5);
visualize_section_vectors_save(Org.Sections2.Middown,Velmapucom2{3,1},Velmapvcom2{3,1},path,name3,5);
visualize_section_vectors_save(Org.Sections2.Tail,Velmapucom2{4,1},Velmapvcom2{4,1},path,name4,5);
%% Save flipped and reference if needed Normal:
name11 = 'Head_Flipped'; name22 = 'Midup_Flipped'; name33 = 'Middown_Flipped'; name44 = 'Tail_Flipped';
visualize_section_vectors_save(Sections2.Head,Velmapucom_flip{1,1},Velmapvcom_flip{1,1},path,name11,5);
visualize_section_vectors_save(Sections2.Midup,Velmapucom_flip{2,1},Velmapvcom_flip{2,1},path,name22,5);
visualize_section_vectors_save(Sections2.Middown,Velmapucom_flip{3,1},Velmapvcom_flip{3,1},path,name33,5);
visualize_section_vectors_save(Sections2.Tail,Velmapucom_flip{4,1},Velmapvcom_flip{4,1},path,name44,5);
%% Test magnitude, theta upon flipping:
% %Flip_x = flip(neg_ucomap,2);
% Flip_x = flip(-ucomap,2);
% Flip_y = flip(vcomap,2);
% 
% % Magnitude
% Flip_mag1 = flip(velmap_norm ,2);
% Flip_mag2 = sqrt(Flip_x.^2 + Flip_y.^2 );
% corrcoef(Flip_mag1(:),Flip_mag2(:))
% %% Theta
% Flip_theta1 = flip(thetamap,2);
% Flip_theta2 = atan2d(Flip_y,Flip_x);
% Flip_theta3= atan2d(Flip_y,flip(ucomap,2));
% corrcoef(Flip_theta1(:),Flip_theta2(:))
% corrcoef(Flip_theta1(:),Flip_theta3(:))
% %
% u_flip = Flip_mag2.*cosd(Flip_theta2);
% v_flip = Flip_mag2.*sind(Flip_theta2);
% visualize_section_vectors(flip(Org.Im,2),u_flip,v_flip,5);
% %% Divergence Test
% Flip_div1 = flip(v_div_mod,2);
% Flip_div2 = Divergence_Modified(flip(-TT.xx,2),flip(TT.yy,2),flip(-TT.u,2),flip(TT.v,2));
% corrcoef(Flip_div1(:),Flip_div2(:))
%% Check if saved correctly:
%Axolotl path:
% Org1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\Original_Final_Sections_Vel.mat');
% Org2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\Original_Final_Sections_Vel_Flip.mat');
% Res1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\Reshaped_Seg_Cilia_Fin.mat');
% Res2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Axolotl\Sample 7\Resized Images\Reshaped_Seg_Cilia_Fin_Flip.mat');
% O1 = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S7\Sectioned Velocity\Only_Output.mat');
% O2 = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S7\Sectioned Velocity\Only_Output_Flipped.mat');

%Laevis path:
% Org1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\Original_Final_Sections_Vel.mat');
% Org2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\Original_Final_Sections_Vel_Flip.mat');
% Res1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\Reshaped_Seg_Fin.mat');
% Res2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Laevis\Trial 2\Sample 10\Resized Images\Reshaped_Seg_Cilia_Fin_Flip.mat');
% O1 = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S10\Sectioned Velocity\Only_Output.mat');
% O2 = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S10\Sectioned Velocity\Only_Output_Flipped.mat');

%Trops path:
%Org1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial1\Sample4\Defined Crops\Sections_Defined_Fin.mat');
Org1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Original_Final_Sections_Vel.mat');
Org2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Original_Final_Sections_Vel_Flip.mat');
%Res1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Finresize_S1.mat');
Res1 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Finresize_S4.mat');
Res2 = load('D:\Cilia Map\Image Segmentation\Embryo Map\Section Embryos\Final Trials\Trial2\Sample4\Defined Crops\Reshaped_Seg_Cilia_Fin_Flip.mat');
O1 = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\Sectioned Velocity\Only_Output.mat');
O2 = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\Sectioned Velocity\Only_Output_Flipped.mat');

figure;imshowpair(Res1.Embfin,Res2.Embfin_Flip,'montage')
figure;imshowpair(Org1.Bound_img2,Org2.Bound2_Flip,'montage')
%% Test Vectors:
u1 = O1.Velmapmag{1,1}.*cosd(O1.Velmaptheta{1,1});
v1 = O1.Velmapmag{1,1}.*sind(O1.Velmaptheta{1,1});

u2 = O2.Velmapmag_flip{1,1}.*cosd(O2.Velmaptheta_flip{1,1});
v2 = O2.Velmapmag_flip{1,1}.*sind(O2.Velmaptheta_flip{1,1});
%%
visualize_section_vectors(Org1.Sections2.Head,u1,v1,5);
visualize_section_vectors(Org2.Sections2.Head,u2,v2,5);