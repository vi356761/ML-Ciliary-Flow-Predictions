%% Version 2: PIV Lab velocity extraction
% Load Path
%Emb1:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Trial1\8_10_22 Data\Flow Data\Sample4\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Trial1\8_10_22 Data\Flow Data\Sample4\S40000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample4\All Velocity\');
%Emb2:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Trial1\8_10_22 Data\Flow Data\Sample5\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Trial1\8_10_22 Data\Flow Data\Sample5\S50000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample5\All Velocity\');
%Emb3:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Trial2\8_30_22 Data\Flow\S2\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Trial2\8_30_22 Data\Flow\S2\S20000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample2\All Velocity\');
%Emb4:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Trial2\8_30_22 Data\Flow\S4\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Trial2\8_30_22 Data\Flow\S4\S40000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\');
%Emb5:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Trial3\11_8_22 Data\Flow\Sample3\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Trial3\11_8_22 Data\Flow\Sample3\S30000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial3\Sample3\All Velocity\');
%Emb6:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Trial3\11_8_22 Data\Flow\Sample4\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Trial3\11_8_22 Data\Flow\Sample4\S40000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial3\Sample4\All Velocity\');
%.......................................................................................................................................
%Validation1:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Validation Trial4\12_5_22 Data\Flow\Sample1\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Validation Trial4\12_5_22 Data\Flow\Sample1\S10000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial4\Sample1\All Velocity\');
%Validation2:
% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Validation Trial4\12_5_22 Data\Flow\Sample4\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Validation Trial4\12_5_22 Data\Flow\Sample4\S40000.tif');
% svpath=('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial4\Sample4\All Velocity\');
%% Velocity save paths:
%Trops:
%svpath =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample4\All Velocity\');
%svpath =('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial2\Sample4\All Velocity\');

%Laevis:
%svpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S9\');
%svpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Laevis\S10\');

%Axolotl:
%svpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S4\');
%svpath = ('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Axolotl\S7\');
%% General path:
% maspath1 = ('E:\Vignesh Backup\OneToOneFlow\For Saurabh\Morphants\M2\Results\Results_New.mat');
% maspath11 = ('E:\Vignesh Backup\OneToOneFlow\For Saurabh\Morphants\M2\St28_M20000.tif');

% maspath1 = ('D:\Embryo Tile Scans\Final Trials\Validation Trial4\12_5_22 Data\Flow\Sample4\Results_New.mat');
% maspath11 = ('D:\Embryo Tile Scans\Final Trials\Validation Trial4\12_5_22 Data\Flow\Sample4\S40000.tif');

[nme,mpath] = uigetfile({'*.tif';'*.jpg';'*.png'},'Select the first flow image');
maspath1 = ([mpath,'Results_New.mat']);
maspath11 = ([mpath,nme]);
%% Define windows based on the calcualted pixel shift
%1) Create a false image same size as the original image
%2) At each pixel shift 8 
load(maspath1);%..............................................
%load('F:\Final Flow\OneToOneFlow\Final Trials\Validation\1_20_23\No Embryo\T2\Results_New.mat');
x_s = zeros(size(x{1,1}));
y_s = zeros(size(y{1,1}));
u_s = zeros(size(x{1,1}));
v_s =zeros(size(y{1,1}));
v_m = zeros(size(x{1,1}));
v_div = zeros(size(x{1,1}));
v_shear = zeros(size(x{1,1}));
v_strain = zeros(size(x{1,1}));
v_vorticity = zeros(size(x{1,1}));
n = 0;
%test_mag = zeros(size(x{1,1}));

for jj = 1:length(x)
    n=n+1;
    x_s = x_s + [x{jj,1}];
    y_s = y_s + [y{jj,1}];
    u_s = u_s + [u_component{jj,1}];
    v_s = v_s + [v_component{jj,1}];
    v_m = v_m + [velocity_magnitude{jj,1}];
    v_div = v_div + [divergence{jj,1}];
    v_shear = v_shear + [shear_rate{jj,1}];
    v_strain = v_strain + [strain_rate{jj,1}];
    v_vorticity = v_vorticity + [vorticity{jj,1}];
    %test_mag = test_mag + [u_component{jj,1}];
end

%test_mag = test_mag/n;
xx = x_s/n;
yy = y_s/n;
u = u_s/n;
neg_u = -u;
v = v_s/n;
neg_v = -v;
vm = v_m/n;
v_div = v_div/n;
v_shear = v_shear/n;
v_strain = v_strain/n;
v_vorticity = v_vorticity/n;
vel_mag = mean2(vm(:));
vel_theta = atan2d(v,u);
vel_thetax = atan2d(v,-u);
vel_thetay = atan2d(-v,u);
figure;
quiverC2D(xx,yy,u,v,'scale',4,'LineWidth', 2,'MaxHeadSize', 1); %2

%Show every nth vector
n=5;
figure;
quiverC2D(xx(1:n:end,1:n:end),yy(1:n:end,1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end),'scale',2,'LineWidth', 2,'MaxHeadSize', 1);
title('Control')
% q=quiver(x{1,1},y{1,1},u_component{1,1},v_component{1,1});
% q.MaxHeadSize = 0.5;
% q.LineWidth = 1.5;
% q.AutoScaleFactor = 2;
% figure;
% quiverC2D(-xx(1:n:end,1:n:end),yy(1:n:end,1:n:end),neg_u(1:n:end,1:n:end),v(1:n:end,1:n:end),'scale',2,'LineWidth', 2,'MaxHeadSize', 1);
% title('X-axis flipped')

% figure;
% quiverC2D(xx(1:n:end,1:n:end),-yy(1:n:end,1:n:end),u(1:n:end,1:n:end),neg_v(1:n:end,1:n:end),'scale',2,'LineWidth', 2,'MaxHeadSize', 1);
% title('Y-axis flipped')
%% Get Image
Img = imread(maspath11);%..................................................................................................
figure;imshow(Img)
Im = rgb2gray(Img);
close all;
%% Normalize Data
%..........................
%u=-u;
%..........................
rng1=[0 1];
rng2=[-1 1];
u_norm = norm2dmatrix(u,rng1);
v_norm = norm2dmatrix(v,rng1);
vm_norm = norm2dmatrix(vm,rng1);
v_div_norm = norm2dmatrix(v_div,rng1);
v_strain_norm = norm2dmatrix(v_strain,rng1);
v_shear_norm = norm2dmatrix(v_shear,rng1);
v_vorticity_norm = norm2dmatrix(v_vorticity,rng1);
theta_norm = norm2dmatrix(vel_theta,rng2);
neg_u_norm = norm2dmatrix(neg_u,rng2);
neg_v_norm = norm2dmatrix(neg_v,rng2);
theta_normx = norm2dmatrix(vel_thetax,rng2);
theta_normy = norm2dmatrix(vel_thetay,rng2);
%% Quivers
xpf = round(xx.*((1/1.47)*10^6));
ypf = round(yy.*((1/1.47)*10^6));

% xpf = round(xx.*((1/2.14)*10^6));
% ypf = round(yy.*((1/2.14)*10^6));

xt = [xx./calxy];
yt = [yy./calxy];
diff1 = round(abs(xt(1,2) - xt(1,1)));
diff2 = round(abs(yt(1,1) - yt(2,1)));
if (diff1==diff2)
    diff = diff1;
end
pmf = calxy;
%...........................................
% figure;
% quiver(xpf,ypf,u,v,'r')%Original
% %set(gca,'Ydir','reverse')
% 
% 
% figure; imshow(Img)
% hold on;
% quiver(xpf,flip(ypf),u,-v,'r')%Flipped y use reverse y to show on image
% hold off;

%...........................................Select values
% figure;
% quiver(xpf(1:n:end,1:n:end),ypf(1:n:end,1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end),'b')

figure;
quiver(xpf(1:n:end,1:n:end),ypf(1:n:end,1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end),'b')

figure;imshow(Img)
hold on;
%quiver(xpf(1:n:end,1:n:end),ypf(1:n:end,1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end),'r')
quiver(xpf(1:n:end,1:n:end),flip(ypf(1:n:end,1:n:end)),u(1:n:end,1:n:end),-v(1:n:end,1:n:end),'r')
%set(gca,'Ydir','reverse')
hold off;

%Understand how flipping works
% figure;
% quiver(xpf(1:n:end,1:n:end),flip(ypf(1:n:end,1:n:end)),u(1:n:end,1:n:end),-v(1:n:end,1:n:end))%Flipped to use with reverse y
% %quiver(xpf(1:n:end,1:n:end),flip(ypf(1:n:end,1:n:end)),flip(u(1:n:end,1:n:end)),flip(v(1:n:end,1:n:end)))%Same as original
% %quiver(xpf(1:n:end,1:n:end),ypf(1:n:end,1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end))%Original
% set(gca,'Ydir','reverse')
%% Spread velocity on the image 
% uorg =u;
% vorg = - v; use only for superimposing plots with yreverse or actual image
%yorg = flip(yy);
%..............................................................................................................................................
% diff = 8;
% pmf = 1.47*10^-6; 
%..............................................................................................................................................
diff = 4;
pmf = 2.14*10^-6; 
%..............................................................................................................................................
velmap = zeros(size(Im));
velmap_norm = zeros(size(Im));
vcomap = zeros(size(Im));
vcomap_norm = zeros(size(Im));
ucomap = zeros(size(Im));
ucomap_norm = zeros(size(Im));
vdiv = zeros(size(Im));
vdiv_norm = zeros(size(Im));
vshear = zeros(size(Im));
vshear_norm = zeros(size(Im));
vstrain = zeros(size(Im));
vstrain_norm = zeros(size(Im));
vorticitymap = zeros(size(Im));
vorticity_norm = zeros(size(Im));
thetamap = zeros(size(Im));
thetamap_norm = zeros(size(Im));

neg_ucomap = zeros(size(Im));
neg_ucomap_norm = zeros(size(Im));
neg_vcomap = zeros(size(Im));
neg_vcomap_norm = zeros(size(Im));
thetamapx = zeros(size(Im));
thetamap_normx = zeros(size(Im));
thetamapy = zeros(size(Im));
thetamap_normy = zeros(size(Im));

%xgrid = zeros(size(Im));
%ygrid = zeros(size(Im));
ystart = round(yt(end,1));
xstart = round(xt(1,1));
ypx=0;

for ydir = ystart:diff:(size(Im,1)-diff)
    ypx=ypx+1;
    xpx=0;
    for xdir = xstart:diff:(size(Im,2))
        xpx= xpx+1;
        velmap(ydir,xdir) = vm(ypx,xpx);
        velmap_norm(ydir,xdir) = vm_norm(ypx,xpx);
        ucomap(ydir,xdir) = u(ypx,xpx);
        ucomap_norm(ydir,xdir) = u_norm(ypx,xpx);
        vcomap(ydir,xdir) = v(ypx,xpx);
        vcomap_norm(ydir,xdir) = v_norm(ypx,xpx);
        vdiv(ydir,xdir) = v_div(ypx,xpx);
        vdiv_norm(ydir,xdir) = v_div_norm (ypx,xpx);
        vshear(ydir,xdir) = v_shear (ypx,xpx);
        vshear_norm(ydir,xdir) = v_shear_norm (ypx,xpx);
        vstrain(ydir,xdir) = v_strain(ypx,xpx);
        vstrain_norm(ydir,xdir) = v_strain_norm(ypx,xpx);
        vorticitymap(ydir,xdir) = v_vorticity(ypx,xpx);
        vorticity_norm(ydir,xdir) = v_vorticity_norm(ypx,xpx);
        thetamap (ydir,xdir)= vel_theta(ypx,xpx);
        thetamap_norm (ydir,xdir)= theta_norm(ypx,xpx);

        neg_ucomap(ydir,xdir) = neg_u(ypx,xpx);
        neg_ucomap_norm(ydir,xdir) = neg_u_norm(ypx,xpx);
        neg_vcomap(ydir,xdir) = neg_v(ypx,xpx);
        neg_vcomap_norm(ydir,xdir) = neg_v_norm(ypx,xpx);
        thetamapx(ydir,xdir) = vel_thetax(ypx,xpx);
        thetamap_normx(ydir,xdir) = theta_normx(ypx,xpx);
        thetamapy(ydir,xdir) = vel_thetay(ypx,xpx);
        thetamap_normy(ydir,xdir) = theta_normy(ypx,xpx);
    end
end
%% Save all velocity details
filpath = ('D:\ALL MUCOCILIARY FLOW ML CODES\_Example\_Processed Examples\D) After velocity preparation and section\');
save([filpath,'All_Vel_Vectors.mat'],'xx','yy','u', 'v', 'vm','v_div', 'v_shear', 'v_strain','v_vorticity','vel_theta','neg_u','neg_v','vel_thetax','vel_thetay')
save([filpath,'All_Vel_Vectors_Normalized.mat'],'u_norm', 'v_norm', 'vm_norm', 'v_div_norm', 'v_strain_norm', 'v_shear_norm','v_vorticity_norm','theta_norm','neg_u_norm','neg_v_norm','theta_normx','theta_normy')
save([filpath,'All_Vel_Vectors_Map.mat'],'velmap', 'vcomap', 'ucomap','vdiv', 'vshear','vstrain','vorticitymap','thetamap','neg_ucomap','neg_vcomap','thetamapx','thetamapy')
save([filpath,'All_Vel_Vectors_Map_Norm.mat'],'velmap_norm', 'vcomap_norm', 'ucomap_norm','vdiv_norm', 'vshear_norm','vstrain_norm','vorticity_norm','thetamap_norm','neg_ucomap_norm','neg_vcomap_norm','thetamap_normx','thetamap_normy','thetamap','neg_ucomap','neg_vcomap','thetamapx','thetamapy')
%% Visulaize using original image dimensions
[xgrid,ygrid] = meshgrid(1:1:size(Im,2),1:1:size(Im,1)); 

%For plots............
% figure;
% quiverC2D(xgrid,flip(ygrid),ucomap,vcomap,'scale',4,'LineWidth', 2,'MaxHeadSize', 1)

figure;
quiverC2D(xgrid(1:n:end,1:n:end),flip(ygrid(1:n:end,1:n:end),1),ucomap(1:n:end,1:n:end),vcomap(1:n:end,1:n:end),'scale',10,'LineWidth', 3,'MaxHeadSize',2)
%set(gca,'Ydir','reverse')

%For figures............
% figure;
% imshow(Im);hold on;
% quiver(xgrid,ygrid,ucomap,-vcomap,'b')
% hold off;
figure; imshow(Im); hold on;
q=quiver(xgrid(1:n:end,1:n:end),ygrid(1:n:end,1:n:end),ucomap(1:n:end,1:n:end),-vcomap(1:n:end,1:n:end),'g');
%q=quiver(xgrid(1:n:end,1:n:end),ygrid(1:n:end,1:n:end)),ucomap(1:n:end,1:n:end),vcomap(1:n:end,1:n:end),'r');
%quiver(xpf(1:n:end,1:n:end),flip(ypf(1:n:end,1:n:end)),u(1:n:end,1:n:end),-v(1:n:end,1:n:end),'r')
q.MaxHeadSize = 2;
q.LineWidth = 2;
q.AutoScaleFactor = 2;
hold off;
%% Check if angles make sense:
% figure;
% quiverC2D(xgrid(1:n:end,1:n:end),flip(ygrid(1:n:end,1:n:end),1),ucomap(1:n:end,1:n:end),neg_vcomap(1:n:end,1:n:end),'scale',10,'LineWidth', 3,'MaxHeadSize',2)
% 
% figure;
% quiverC2D(flip(xgrid(1:n:end,1:n:end),2),flip(ygrid(1:n:end,1:n:end),1),neg_ucomap(1:n:end,1:n:end),vcomap(1:n:end,1:n:end),'scale',10,'LineWidth', 3,'MaxHeadSize',2)

ucheck = vm.*cosd(vel_theta);
vcheck = vm.*sind(vel_theta);

n=5;
figure;
quiverC2D(xx(1:n:end,1:n:end),yy(1:n:end,1:n:end),ucheck(1:n:end,1:n:end),vcheck(1:n:end,1:n:end),'scale',2,'LineWidth', 2,'MaxHeadSize', 1);
title('Control')
%% Color code magnitude and divergence:
%T = load('D:\Cilia Map\PIV\Window_PIV_Vignesh\Analysis\Final Trials\Trial1\Sample4\All Velocity\Sectioned Velocity\Sectioned_Velocity.mat');
%load('D:\Embryo Tile Scans\Final Trials\Trops MCI 1 Cell\Flow\All_Vel_Vectors_Map_Norm.mat');
%Im = imread('D:\Embryo Tile Scans\Final Trials\Trops MCI 1 Cell\Flow\S40000.tif');
% figure;imshow(Im)
% msk = roipoly;
% vdiv_norm(~msk)=0;
% velmap_norm(~msk)=0;
%load('D:\Embryo Tile Scans\Final Trials\Trops MCI 1 Cell\Flow\All_Vel_Vectors_Normalized.mat');
edges = 0:0.01:1;
%[~,~,idx] = histcounts(velmap_norm,edges);
%[~,~,idx] = histcounts(v_div_norm,edges);
[~,~,idx] = histcounts(vm_norm,edges);
L1 = idx;

% vdiv_id = find(vdiv_norm>0);
% vdiv2 =vdiv_norm(vdiv_id);
%T1 = load('D:\Embryo Tile Scans\Final Trials\Trops MCI 1 Cell\Flow\All_Vel_Vectors_Normalized.mat');
%% Colorplot Orientation
sy = size(L1,1); sx = size(L1,2);
figure1 = figure('Colormap',...
        [0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 0.9375;0.125 1 0.875;0.1875 1 0.8125;0.25 1 0.75;0.3125 1 0.6875;0.375 1 0.625;0.4375 1 0.5625;0.5 1 0.5;0.5625 1 0.4375;0.625 1 0.375;0.6875 1 0.3125;0.75 1 0.25;0.8125 1 0.1875;0.875 1 0.125;0.9375 1 0.0625;1 1 0;1 0.899999976158142 0;1 0.800000011920929 0;1 0.699999988079071 0;1 0.600000023841858 0;1 0.5 0;1 0.400000005960464 0;1 0.300000011920929 0;1 0.200000002980232 0;1 0.100000001490116 0;1 0 0;0.964285731315613 0 0;0.928571403026581 0 0;0.892857134342194 0 0;0.857142865657806 0 0;0.821428596973419 0 0;0.785714268684387 0 0;0.75 0 0;0.714285731315613 0 0;0.678571403026581 0 0;0.642857134342194 0 0;0.607142865657806 0 0;0.571428596973419 0 0;0.535714268684387 0 0;0.5 0 0]);
%Lrgb = label2rgb(L1);
Lrgb = label2rgb(L1,'turbo','w');
% Setting up axis
%axes1 = axes('Parent',figure1,'YDir','reverse','Layer','top','CLim',[1 5]);
axes1 = axes('Parent',figure1,'YDir','reverse','Layer','top','CLim',[0 1]);
%Lim = caxis;
%caxis([1 5])
set(axes1,'TickLength',[0 0]);
%           xlim auto;
%           ylim auto;
        xlim(axes1,[0 sx]);
        ylim(axes1,[0 sy]);
%         xlim(axes1,[0.5 305.5]);
%         ylim(axes1,[0.5 305.5]);
%         xlim(axes1,[0.5 1024.5]);
%         ylim(axes1,[0.5 1024.5]);
        box(axes1,'on');
        hold(axes1,'all');
        % Create image
        image(Lrgb,'Parent',axes1,'CDataMapping','scaled');
        %image(L,'Parent',axes1,'CDataMapping','scaled');
        % Create colorbar
        colorbar('peer',axes1);
        %box on;
           % code
        %set(axes1,'XTick',[], 'YTick', [])
        % gca = ax
        %set(axes1,'xticklabel',[])
        title('Velocity Magnitude','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
        %title('Divergence','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
        set(axes1,'TickLength',[0 0],'LineWidth',2,'XTick',[],'YTick',[]);
        %set(axes1,'TickLength',[0 0],'LineWidth',2,'XTick',[],'YTick',[],'xticklabel',[],'yticklabel',[]);
        yyaxis right
        ylabel ('Normalized Velocity Magnitude','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
        %ylabel ('Normalized Divergence','FontSize', 15, 'Color', 'black', 'FontWeight', 'bold')
        k = [0, 0, 0];
        axes1.YColor = k;%
        %set(axes1,'YTick',[],'yticklabel',[]);
        set(axes1,'YTick',[]);
        % set(gcf,'Position',get(0,'Screensize'))
        % saveas(figure1,'D:\Embryo Tile Scans\Final Trials\Trops MCI 1 Cell\Flow\Magnitude_Color2.tif');