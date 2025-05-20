%% Get only mean velocity from rectangular ROI
% [file,path] = uigetfile('*.mat');
% load([path,file]);

%clear all;clc
%pathname=('F:\Final Flow\');

%load([pathname,'3\S3\Results.mat']);
%load('F:\Final Flow\OneToOneFlow\Trial 1\S4\Results.mat');
%load([pathname,'Animal Caps\1\S3\Results.mat']);
x_s = zeros(size(x{1,1}));
y_s = zeros(size(y{1,1}));
u_s = zeros(size(x{1,1}));
v_s =zeros(size(y{1,1}));
v_m = zeros(size(x{1,1}));
n = length(x);

for jj=1:length(x)
    x_s = x_s + [x{jj,1}];
    y_s = y_s + [y{jj,1}];
    u_s = u_s + [u_component{jj,1}];
    v_s = v_s + [v_component{jj,1}];
    v_m = v_m + [velocity_magnitude{jj,1}];
end

xx = x_s/n;
yy = y_s/n;
u = u_s/n;
v = v_s/n;
vm = v_m/n;
vel_mag = mean2(vm(:));

figure;
quiverC2D(xx,yy,u,v,'scale',4,'LineWidth', 2,'MaxHeadSize', 1); %2

%Show every nth vector
n=5;
figure;
quiverC2D(xx(1:n:end,1:n:end),yy(1:n:end,1:n:end),u(1:n:end,1:n:end),v(1:n:end,1:n:end),'scale',2,'LineWidth', 2,'MaxHeadSize', 1);
% figure;
% quiverC2D(xx,yy,u,v,'scale',5,'LineWidth', 2,'MaxHeadSize', 2); %2
%% Get velocity from the rectangular ROI
%..............Head average velocity.......................................
close all;
[~, ~, ~, ~, xhead, yhead, uhead, vhead, vrmshead] = getcroppedrectangle(xx,yy,u,v,vm);
figure;
quiverC2D(xhead, yhead, uhead, vhead,'scale',5,'LineWidth', 2,'MaxHeadSize', 2);
Head_vrms = mean2(vrmshead);

%..............Mid1(UP) average velocity.......................................
%close all;
[~, ~, ~, ~, xmidup, ymidup, umidup, vmidup, vrmsmidup] = getcroppedrectangle(xx,yy,u,v,vm);
figure;
quiverC2D(xmidup, ymidup, umidup, vmidup,'scale',5,'LineWidth', 2,'MaxHeadSize', 2);
Midup_vrms = mean2(vrmsmidup);

%..............Mid2(DOWN) average velocity.......................................
%close all;
[~, ~, ~, ~, xmiddown, ymiddown, umiddown, vmiddown, vrmsmiddown] = getcroppedrectangle(xx,yy,u,v,vm);
figure;
quiverC2D(xmiddown, ymiddown, umiddown, vmiddown,'scale',5,'LineWidth', 2,'MaxHeadSize', 2);
Middown_vrms = mean2(vrmsmiddown);

%..............Tail average velocity.......................................
%close all;
[~, ~, ~, ~, xtail, ytail, utail, vtail, vrmstail] = getcroppedrectangle(xx,yy,u,v,vm);
figure;
quiverC2D(xtail, ytail, utail, vtail,'scale',5,'LineWidth', 2,'MaxHeadSize', 2);
Tail_vrms = mean2(vrmstail);
%% Collect data together
close all;
%Sections = {'Head';'Mid-up';'Mid-down';'Tail'};
%Vel_RMS =[Head_vrms;Midup_vrms;Middown_vrms;Tail_vrms];
Vel_RMS =[Head_vrms;Midup_vrms;Middown_vrms;Tail_vrms].';
%Fintable = table(Sections,Vel_RMS);
%ANS=Sections.';
%velrms_hor = Vel_RMS.';
