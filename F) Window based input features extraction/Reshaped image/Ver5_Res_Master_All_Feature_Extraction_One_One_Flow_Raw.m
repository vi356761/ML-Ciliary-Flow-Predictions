function Ver5_Res_Master_All_Feature_Extraction_One_One_Flow_Raw(pathi1,pathi2,blocksize,overlap,pf,thresh)
%J = load([pathi1,pathi2]);
J = load([pathi2]);
%..........................................................................................................................
%For cropped sections: Orginial Image
canvas1 = J.Sections12.Head;
canvas2 = J.Sections12.Tail;
canvas3 = J.Sections12.Midup;
canvas4 = J.Sections12.Middown;
%..........................................................................................................................
figure; 
subplot(2,2,1); imshow(canvas1)
title('Head portion of the embryo')
subplot(2,2,2); imshow(canvas3)
title('Upper mid of the embryo')
subplot(2,2,3); imshow(canvas4)
title('Lower mid of the embryo')
subplot(2,2,4); imshow(canvas2)
title('Tail portion of the embryo')
%%
canvas_full = J.Embfin;
RGB1=colormap(canvas_full(:,1:ceil(size(canvas_full,2)*0.25)),1,0,0);
%RGB2=colormap(canvas_full(:,(ceil(size(canvas_full,2)*0.25)+1:size(canvas_full,2)*0.77)),0,1,1);
RGB21 = colormap(canvas_full(1:ceil(size(canvas_full,1)/2),(ceil(size(canvas_full,2)*0.25)+1:size(canvas_full,2)*0.77)),0,1,1);
RGB22 = colormap(canvas_full(ceil(size(canvas_full,1)/2)+1:size(canvas_full,1),(ceil(size(canvas_full,2)*0.25)+1:size(canvas_full,2)*0.77)),1,1,0);
RGB2 = [RGB21;RGB22];
RGB3=colormap(canvas_full(:,(ceil(size(canvas_full,2)*0.77)+1):size(canvas_full,2)),0,1,0);
RGB=[RGB1,RGB2,RGB3];
figure;imshow(RGB)
%%  Window based feature extraction
canvass1 = logical(xExpandMatrix(bwareaopen(canvas1,7), 1, 1, blocksize, blocksize, blocksize, blocksize, 0));
canvass2 = logical(xExpandMatrix(bwareaopen(canvas2,7), 1, 1, blocksize, blocksize, blocksize, blocksize, 0));
canvass3 = logical(xExpandMatrix(bwareaopen(canvas3,7), 1, 1, blocksize, blocksize, blocksize, blocksize, 0));
canvass4 = logical(xExpandMatrix(bwareaopen(canvas4,7), 1, 1, blocksize, blocksize, blocksize, blocksize, 0));

% [window_centx1,window_centy1,Master_Images1,Master_Images_Col1] = ONLY_Windows(blocksize,overlap,canvass1);%Head
% [window_centx2,window_centy2,Master_Images2,Master_Images_Col2] = ONLY_Windows(blocksize,overlap,canvass2);%Tail
% [window_centx3,window_centy3,Master_Images3,Master_Images_Col3] = ONLY_Windows(blocksize,overlap,canvass3);%Mid-up
% [window_centx4,window_centy4,Master_Images4,Master_Images_Col4] = ONLY_Windows(blocksize,overlap,canvass4);%Mid-down

[window_centx1,window_centy1,Master_Images1,Master_Images_Col1,idx1] = ONLY_Windows_Tol_VER2(blocksize,overlap,canvass1);%Head
[window_centx2,window_centy2,Master_Images2,Master_Images_Col2,idx2] = ONLY_Windows_Tol_VER2(blocksize,overlap,canvass2);%Tail
[window_centx3,window_centy3,Master_Images3,Master_Images_Col3,idx3] = ONLY_Windows_Tol_VER2(blocksize,overlap,canvass3);%Mid-up
[window_centx4,window_centy4,Master_Images4,Master_Images_Col4,idx4] = ONLY_Windows_Tol_VER2(blocksize,overlap,canvass4);%Mid-down
%% Get Lamda and Gamma
[centx1, centy1, All_Props1, n1, ro1, ~, stdro1, uniformity1, minima1, lamda1, gamma1] = windowmethod_ensembledtissueparam(Master_Images_Col1,thresh); %Head
[centx2, centy2, All_Props2, n2, ro2, ~, stdro2, uniformity2, minima2, lamda2, gamma2] = windowmethod_ensembledtissueparam(Master_Images_Col2,thresh); %Tail
[centx3, centy3, All_Props3, n3, ro3, ~, stdro3, uniformity3, minima3, lamda3, gamma3] = windowmethod_ensembledtissueparam(Master_Images_Col3,thresh); %Mid-up
[centx4, centy4, All_Props4, n4, ro4, ~, stdro4, uniformity4, minima4, lamda4, gamma4] = windowmethod_ensembledtissueparam(Master_Images_Col4,thresh); %Mid-down
%% Create Savepath:
svpath = ([pathi1,'ReshapedData\']);
if(exist(svpath)~=7)
    mkdir(svpath)
end
%% Figures using functions 
%...........................Uniformity.....................................
getplotsofhistogram(uniformity1,'Uniformity distribution','Uniformity Head',svpath)
getplotsofhistogram(uniformity2,'Uniformity distribution','Uniformity Tail',svpath)
getplotsofhistogram(uniformity3,'Uniformity distribution','Uniformity Midup',svpath)
getplotsofhistogram(uniformity4,'Uniformity distribution','Uniformity Middown',svpath)
%% ...........................Wavelength(lamda).....................................
getplotsofhistogram(lamda1,'Lamda distribution','Lamda Head',svpath)
getplotsofhistogram(lamda2,'Lamda distribution','Lamda Tail',svpath)
getplotsofhistogram(lamda3,'Lamda distribution','Lamda Midup',svpath)
getplotsofhistogram(lamda4,'Lamda distribution','Lamda Middown',svpath)
%% ...........................MCC Number(n).....................................
getplotsofhistogram(n1,'MCC Number distribution','MCC Number Head',svpath)
getplotsofhistogram(n2,'MCC Number distribution','MCC Number Tail',svpath)
getplotsofhistogram(n3,'MCC Number distribution','MCC Number Midup',svpath)
getplotsofhistogram(n4,'MCC Number distribution','MCC Number Middown',svpath)
%% ...........................Average Minimum Distance (um).....................................
getplotsofhistogram(ro1,'Average minimum distance distribution','Avgmindist Head',svpath)
getplotsofhistogram(ro2,'Average minimum distance distribution','Avgmindist Tail',svpath)
getplotsofhistogram(ro3,'Average minimum distance distribution','Avgmindist Midup',svpath)
getplotsofhistogram(ro4,'Average minimum distance distribution','Avgmindist Middown',svpath)
%% Gather Data:
% Head Section
for jj=1:length(All_Props1.Area)
CF_Head = sum(All_Props1.Area{jj,1})/(blocksize*blocksize);
Coverage_Fraction_Head{jj,1} = CF_Head;
Head_loop = All_Props1.Area{jj,1}.*(pf^2);
Head_Area_Ensemble{jj,1} = Head_loop;
Head_Area_Mean(jj,1) = mean2(Head_loop);
Head_Orient_Mean(jj,1) = mean2(All_Props1.Orient{jj,1});
Head_Aspect_Mean(jj,1) = mean2(All_Props1.Aspect{jj,1});
Head_Circularity_Mean(jj,1) = mean2(All_Props1.Circularity{jj,1});
clear Head_loop
end

% Tail Section
for jj=1:length(All_Props2.Area)
CF_Tail = sum(All_Props2.Area{jj,1})/(blocksize*blocksize);
Coverage_Fraction_Tail{jj,1} = CF_Tail;
Tail_loop_As = All_Props2.Area{jj,1}.*(pf^2);
Tail_Area_Ensemble{jj,1} = Tail_loop_As;
Tail_Area_Mean(jj,1) = mean2(Tail_loop_As);
Tail_Orient_Mean(jj,1) = mean2(All_Props2.Orient{jj,1});
Tail_Aspect_Mean(jj,1) = mean2(All_Props2.Aspect{jj,1});
Tail_Circularity_Mean(jj,1) = mean2(All_Props2.Circularity{jj,1});
clear Tail_loop_As
end

% Mid-up Section
for jj=1:length(All_Props3.Area)
CF_Midup = sum(All_Props3.Area{jj,1})/(blocksize*blocksize);
Coverage_Fraction_Midup{jj,1} = CF_Midup;
Midup_loop_As = All_Props3.Area{jj,1}.*(pf^2);
Midup_Area_Ensemble{jj,1} = Midup_loop_As;
Midup_Area_Mean(jj,1) = mean2(Midup_loop_As);
Midup_Orient_Mean(jj,1) = mean2(All_Props3.Orient{jj,1});
Midup_Aspect_Mean(jj,1) = mean2(All_Props3.Aspect{jj,1});
Midup_Circularity_Mean(jj,1) = mean2(All_Props3.Circularity{jj,1});
clear Midup_loop_As
end

% Mid-down Section
for jj=1:length(All_Props4.Area)
CF_Middown = sum(All_Props4.Area{jj,1})/(blocksize*blocksize);
Coverage_Fraction_Middown{jj,1} = CF_Middown;
Middown_loop_As = All_Props4.Area{jj,1}.*(pf^2);
Middown_Area_Ensemble{jj,1} = Middown_loop_As;
Middown_Area_Mean(jj,1) = mean2(Middown_loop_As);
Middown_Orient_Mean(jj,1) = mean2(All_Props4.Orient{jj,1});
Middown_Aspect_Mean(jj,1) = mean2(All_Props4.Aspect{jj,1});
Middown_Circularity_Mean(jj,1) = mean2(All_Props4.Circularity{jj,1});
clear Middown_loop_As
end
%% Ensembled props section wise
% Head section
%Props order: Area, Orientation, Aspect Ratio, Circularity
Master_Head_Props = [Head_Area_Mean,Head_Orient_Mean,Head_Aspect_Mean,Head_Circularity_Mean,cell2mat(Coverage_Fraction_Head)];
%Features order: number of MCCs, avg min dist, std of min dist, uniformity1, lamda (wavelength), gamma (order parameter), minima
Master_Head_Features = [n1, ro1.*pf, stdro1.*pf, uniformity1,lamda1.*pf, gamma1,minima1.*pf] ;
Master_Head_AllProps = [Master_Head_Props,Master_Head_Features];

% Tail section
%Props order: Area, Orientation, Aspect Ratio, Circularity
Master_Tail_Props = [Tail_Area_Mean,Tail_Orient_Mean,Tail_Aspect_Mean,Tail_Circularity_Mean,cell2mat(Coverage_Fraction_Tail)];
%Features order: number of MCCs, avg min dist, std of min dist, uniformity1, lamda (wavelength), gamma (order parameter), minima
Master_Tail_Features = [n2, ro2.*pf, stdro2.*pf, uniformity2,lamda2.*pf, gamma2, minima2.*pf] ;
Master_Tail_AllProps = [Master_Tail_Props,Master_Tail_Features];

% Midup section
%Props order: Area, Orientation, Aspect Ratio, Circularity
Master_Midup_Props = [Midup_Area_Mean,Midup_Orient_Mean,Midup_Aspect_Mean,Midup_Circularity_Mean,cell2mat(Coverage_Fraction_Midup)];
%Features order: number of MCCs, avg min dist, std of min dist, uniformity1, lamda (wavelength), gamma (order parameter), minima
Master_Midup_Features = [n3, ro3.*pf, stdro3.*pf, uniformity3,lamda3.*pf, gamma3,minima3.*pf] ;
Master_Midup_AllProps = [Master_Midup_Props,Master_Midup_Features];

% Middown section
%Props order: Area, Orientation, Aspect Ratio, Circularity
Master_Middown_Props = [Middown_Area_Mean,Middown_Orient_Mean,Middown_Aspect_Mean,Middown_Circularity_Mean,cell2mat(Coverage_Fraction_Middown)];
%Features order: number of MCCs, avg min dist, std of min dist, uniformity1, lamda (wavelength), gamma (order parameter), minima
Master_Middown_Features = [n4, ro4.*pf, stdro4.*pf, uniformity4,lamda4.*pf, gamma4,minima4.*pf] ;
Master_Middown_AllProps = [Master_Middown_Props,Master_Middown_Features];

%% Feature wise grouping
% Area
Area_Master_Table = groupunevenmatrix(removeNaN(Head_Area_Mean),removeNaN(Midup_Area_Mean),removeNaN(Middown_Area_Mean),removeNaN(Tail_Area_Mean));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',1)

% Orient
Area_Master_Table = groupunevenmatrix(removeNaN(Head_Orient_Mean),removeNaN(Midup_Orient_Mean),removeNaN(Middown_Orient_Mean),removeNaN(Tail_Orient_Mean));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',2)

% Aspect
Area_Master_Table = groupunevenmatrix(removeNaN(Head_Aspect_Mean),removeNaN(Midup_Aspect_Mean),removeNaN(Middown_Aspect_Mean),removeNaN(Tail_Aspect_Mean));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',3)

% Circularity
Area_Master_Table = groupunevenmatrix(removeNaN(Head_Circularity_Mean),removeNaN(Midup_Circularity_Mean),removeNaN(Middown_Circularity_Mean),removeNaN(Tail_Circularity_Mean));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',4)

% Coverage Fraction
Area_Master_Table = groupunevenmatrix(removeNaN(cell2mat(Coverage_Fraction_Head)),removeNaN(cell2mat(Coverage_Fraction_Midup)),removeNaN(cell2mat(Coverage_Fraction_Middown)),removeNaN(cell2mat(Coverage_Fraction_Tail)));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',5)

% Number of MCC
Area_Master_Table = groupunevenmatrix(removeNaN(n1),removeNaN(n3),removeNaN(n4),removeNaN(n2));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',6)

% Average minimum distance
Area_Master_Table = groupunevenmatrix(removeNaN(ro1.*pf),removeNaN(ro3.*pf),removeNaN(ro4.*pf),removeNaN(ro2.*pf));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',7)

% Std avg min dist 
Area_Master_Table = groupunevenmatrix(removeNaN(stdro1.*pf),removeNaN(stdro3.*pf),removeNaN(stdro4.*pf),removeNaN(stdro2.*pf));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',8)

% Uniformity 
Area_Master_Table = groupunevenmatrix(removeNaN(uniformity1),removeNaN(uniformity3),removeNaN(uniformity4),removeNaN(uniformity2));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',9)

% Lamda
Area_Master_Table = groupunevenmatrix(removeNaN(lamda1.*pf),removeNaN(lamda3.*pf),removeNaN(lamda4.*pf),removeNaN(lamda2.*pf));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',10)

% Gamma
Area_Master_Table = groupunevenmatrix(removeNaN(gamma1),removeNaN(gamma3),removeNaN(gamma4),removeNaN(gamma2));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',11)

% Minima
Area_Master_Table = groupunevenmatrix(removeNaN(minima1.*pf),removeNaN(minima3.*pf),removeNaN(minima4.*pf),removeNaN(minima2.*pf));%Head,Mid-up,Middown,Tail
writetable(Area_Master_Table,[svpath,'Features.xlsx'],'Sheet',12)

%Master Save:
save([svpath,'Extracted_All_MAT_Files.mat'])
end