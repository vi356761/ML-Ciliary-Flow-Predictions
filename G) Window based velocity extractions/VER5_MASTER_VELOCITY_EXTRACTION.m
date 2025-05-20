function VER5_MASTER_VELOCITY_EXTRACTION(blocksize,overlap,pathy,path1,svpath2)
%tt=load([path1,'Sectioned_Velocity_Norm.mat']); %Only for T4_S1
%tt=load([pathy,'Only_Output.mat']);
tt=load([pathy,'Sectioned_Velocity.mat']);
%clearvars -except Velmapmag path1
%clearvars -except Velmapdiv path1 fpath
% For Velocity
% canvas11 = tt.Velmapmag{1,1}; %Head 
% canvas22 = tt.Velmapmag{2,1}; %Midup
% canvas33 = tt.Velmapmag{3,1}; %Middown
% canvas44 = tt.Velmapmag{4,1}; %Tail

% For Velocity
canvas11 = sqrt(tt.Velmapucom2{1,1}.^2 + tt.Velmapvcom2{1,1}.^2);%Head 
canvas22 = sqrt(tt.Velmapucom2{2,1}.^2 + tt.Velmapvcom2{2,1}.^2); %Midup
canvas33 = sqrt(tt.Velmapucom2{3,1}.^2 + tt.Velmapvcom2{3,1}.^2); %Middown
canvas44 = sqrt(tt.Velmapucom2{4,1}.^2 + tt.Velmapvcom2{4,1}.^2); %Tail

% For Divergence
% canvas1 = tt.Velmapdiv{1,1}; %Head 
% canvas2 = tt.Velmapdiv{2,1}; %Midup
% canvas3 = tt.Velmapdiv{3,1}; %Middown
% canvas4 = tt.Velmapdiv{4,1}; %Tail

% For Divergence
canvas1 = tt.Velmapdiv_org{1,1}; %Head 
canvas2 = tt.Velmapdiv_org{2,1}; %Midup
canvas3 = tt.Velmapdiv_org{3,1}; %Middown
canvas4 = tt.Velmapdiv_org{4,1}; %Tail

% For Velocity Direction
canvas1x = tt.Velmaptheta{1,1}; %Head 
canvas2x = tt.Velmaptheta{2,1}; %Midup
canvas3x = tt.Velmaptheta{3,1}; %Middown
canvas4x = tt.Velmaptheta{4,1}; %Tail
% For visualizing velocity
% canvas1 = rgb2gray(tt.Sections2.Head); %Head 
% canvas2 = rgb2gray(tt.Sections2.Midup); %Midup
% canvas3 = rgb2gray(tt.Sections2.Middown); %Middown
% canvas4 = rgb2gray(tt.Sections2.Tail); %Tail
%%
%For Magnitude
canvass11 = xExpandMatrix(canvas11, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass22 = xExpandMatrix(canvas22, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass33 = xExpandMatrix(canvas33, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass44 = xExpandMatrix(canvas44, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
%For Divergence
canvass1 = xExpandMatrix(canvas1, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass2 = xExpandMatrix(canvas2, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass3 = xExpandMatrix(canvas3, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass4 = xExpandMatrix(canvas4, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
%For Direction:
canvass1x = xExpandMatrix(canvas1x, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass2x = xExpandMatrix(canvas2x, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass3x = xExpandMatrix(canvas3x, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
canvass4x = xExpandMatrix(canvas4x, 1, 1, blocksize, blocksize, blocksize, blocksize, 0);
%%  Window based feature extraction
%For Magnitude
[~, ~, ~, ~, meanvel11] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass11);%Head
[~, ~, ~, ~, meanvel22] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass22);%Midup
[~, ~, ~, ~, meanvel33] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass33);%Middown
[~, ~, ~, ~, meanvel44] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass44);%Tail

%For Divergence
[~, ~, ~, ~, meanvel1] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass1);%Head
[~, ~, ~, ~, meanvel2] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass2);%Midup
[~, ~, ~, ~, meanvel3] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass3);%Middown
[~, ~, ~, ~, meanvel4] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass4);%Tail

%For Velocity Direction
[~, ~, ~, ~, meanvel1x] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass1x);%Head
[~, ~, ~, ~, meanvel2x] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass2x);%Midup
[~, ~, ~, ~, meanvel3x] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass3x);%Middown
[~, ~, ~, ~, meanvel4x] = windowmethod_ONE_Flow_New(blocksize,overlap,canvass4x);%Tail
%% Extract velcity values corresponding to the resized feature map
YY = load(svpath2);
ATT1 = isnan(YY.ro1);
ATT2 = isnan(YY.ro2);
ATT3 = isnan(YY.ro3);
ATT4 = isnan(YY.ro4);
clear YY
% For Magnitude
meansel11 = meanvel11(~ATT1);%Head 1
T_meanvel11 = array2table(meansel11,'VariableNames',{'Magnitude'});
meansel22 = meanvel22(~ATT3);%Midup 3 for confocal
T_meanvel22 = array2table(meansel22,'VariableNames',{'Magnitude'});
meansel33 = meanvel33(~ATT4);%Middown 4 for confocal
T_meanvel33 = array2table(meansel33,'VariableNames',{'Magnitude'});
meansel44 = meanvel44(~ATT2);%Tail 2 for confocal
T_meanvel44 = array2table(meansel44,'VariableNames',{'Magnitude'});

% For Divergence
meansel1 = meanvel1(~ATT1);%Head 1
meansel2 = meanvel2(~ATT3);%Midup 3 for confocal
meansel3 = meanvel3(~ATT4);%Middown 4 for confocal
meansel4 = meanvel4(~ATT2);%Tail 2 for confocal

T_meanvel1 = array2table(meansel1,'VariableNames',{'Divergence'});
T_meanvel2 = array2table(meansel2,'VariableNames',{'Divergence'});
T_meanvel3 = array2table(meansel3,'VariableNames',{'Divergence'});
T_meanvel4 = array2table(meansel4,'VariableNames',{'Divergence'});

% For theta
meansel1x = meanvel1x(~ATT1);%Head 1
meansel2x = meanvel2x(~ATT3);%Midup 3 for confocal
meansel3x = meanvel3x(~ATT4);%Middown 4 for confocal
meansel4x = meanvel4x(~ATT2);%Tail 2 for confocal

T_meanvel1x = array2table(meansel1x,'VariableNames',{'Theta'});
T_meanvel2x = array2table(meansel2x,'VariableNames',{'Theta'});
T_meanvel3x = array2table(meansel3x,'VariableNames',{'Theta'});
T_meanvel4x = array2table(meansel4x,'VariableNames',{'Theta'});
%4...................................................................................................................................
%save(svpathi{kk,1})
%% Group data together
HH = readtable([path1,'Head_Master_Tol.xlsx']);
MU = readtable([path1,'Midup_Master_Tol.xlsx']);
MD = readtable([path1,'Middown_Master_Tol.xlsx']);
TT = readtable([path1,'Tail_Master_Tol.xlsx']);

% Head all velocity
HH_Mag = [HH,T_meanvel11];
writetable(HH_Mag,[path1,'Velocity_Features\Head_Master_RMS.xlsx'])
HH_Div = [HH,T_meanvel1];
writetable(HH_Div,[path1,'Divergence_Features\Head_Master_Div.xlsx'])
HH_x = [HH,T_meanvel1x];
writetable(HH_x,[path1,'Velocity_Features\Head_Master_Theta.xlsx'])

% Midup all velocity
MU_Mag = [MU,T_meanvel22];
writetable(MU_Mag,[path1,'Velocity_Features\Midup_Master_RMS.xlsx'])
MU_Div = [MU,T_meanvel2];
writetable(MU_Div,[path1,'Divergence_Features\Midup_Master_Div.xlsx'])
MU_x = [MU,T_meanvel2x];
writetable(MU_x,[path1,'Velocity_Features\Midup_Master_Theta.xlsx'])

% Middown all velocity
MD_Mag = [MD,T_meanvel33];
writetable(MD_Mag,[path1,'Velocity_Features\Middown_Master_RMS.xlsx'])
MD_Div = [MD,T_meanvel3];
writetable(MD_Div,[path1,'Divergence_Features\Middown_Master_Div.xlsx'])
MD_x = [MD,T_meanvel3x];
writetable(MD_x,[path1,'Velocity_Features\Middown_Master_Theta.xlsx'])

% Tail all velocity
TT_Mag = [TT,T_meanvel44];
writetable(TT_Mag,[path1,'Velocity_Features\Tail_Master_RMS.xlsx'])
TT_Div = [TT,T_meanvel4];
writetable(TT_Div,[path1,'Divergence_Features\Tail_Master_Div.xlsx'])
TT_x = [TT,T_meanvel4x];
writetable(TT_x,[path1,'Velocity_Features\Tail_Master_Theta.xlsx'])
%%
Table_Master1 = [HH_Mag;MU_Mag;MD_Mag;TT_Mag];
Table_Master2 = [HH_Div;MU_Div;MD_Div;TT_Div];
Table_Master3 = [HH_x;MU_x;MD_x;TT_x];

writetable(Table_Master1,[path1,'Velocity_Features\Ensembled_Data_Table_Mag_All.xlsx']);
writetable(Table_Master2,[path1,'Divergence_Features\Ensembled_Data_Table_Div_All.xlsx']);
writetable(Table_Master3,[path1,'Velocity_Features\Ensembled_Data_Table_Theta_All.xlsx']);

indi1 = find(Table_Master1.Magnitude ==0);
Table_Master_New1 = Table_Master1;
Table_Master_New1(indi1,:) = [];
writetable(Table_Master_New1,[path1,'Velocity_Features\Ensembled_Data_Table_Mag_Sel.xlsx']);
save([path1,'Velocity_Features\selindex.mat'],'indi1')

%indi2 = find(Table_Master2.Divergence ==0);
Table_Master_New2 = Table_Master2;
Table_Master_New2(indi1,:) = [];
writetable(Table_Master_New2,[path1,'Divergence_Features\Ensembled_Data_Table_Div_Sel.xlsx']);


%indi3 = find(Table_Master3.U_Comp ==0);
Table_Master_New3 = Table_Master3;
Table_Master_New3(indi1,:) = [];
writetable(Table_Master_New3,[path1,'Velocity_Features\Ensembled_Data_Table_Theta_Sel.xlsx']);

%save([path1,'Extracted_Velocity_All.mat'])
clearvars -except path1 path1 blocksize overlap svpath2 
end