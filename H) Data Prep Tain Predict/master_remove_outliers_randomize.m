function [H_Test_Div, H_Train_Div, H_Test_Theta, H_Train_Theta, H_Test_Rms, H_Train_Rms, Im_Test, Im_Train] = master_remove_outliers_randomize(Col_Img1,ATT1,path1,subpathname,subpathname_div,subpathname_rms,subpathname_theta,hol)

HH = readtable([path1,subpathname]);
H_div = readtable([path1,subpathname_div],'Range','K:K');
H_rms = readtable([path1,subpathname_rms],'Range','K:K');
H_theta = readtable([path1,subpathname_theta],'Range','K:K');
in=0;
for mm=1:length(ATT1)
    if(ATT1(mm,1)~=1)
        in = in+1;
        Im1{in,1} =Col_Img1{mm,1};
    end
end
[HH1,HI] = rmoutliers(HH,'Mean');

H_div = H_div(~HI,:);
H_rms = H_rms(~HI,:);
H_theta = H_theta(~HI,:);

in2=0;
for mm=1:length(HI)
    if(HI(mm,1)~=1)
        in2 = in2+1;
        Im2{in2,1} =Im1{mm,1};
    end
end

szz = randperm(size(HH1,1));
HH2 = HH1(szz, :);

H_div = H_div(szz, :);
H_rms = H_rms(szz, :);
H_theta = H_theta(szz, :);

hnum = round(hol*size(HH2,1)/100);

i_test = szz(1:hnum); i_train = szz(hnum+1:end);

for nn=1:length(i_test)
    indi = i_test(nn);
    Im_Test{nn,1} = Im2{indi,1};
end

for nn=1:length(i_train)
    indi = i_train(nn);
    Im_Train{nn,1} = Im2{indi,1};
end

H_Test = HH2(1:hnum,:); H_Train =  HH2(hnum+1:end,:);
H_Test_Div = [H_Test,H_div(1:hnum,1)];
H_Train_Div = [H_Train,H_div(hnum+1:end,1)];
H_Test_Rms= [H_Test,H_rms(1:hnum,1)];
H_Train_Rms = [H_Train,H_rms(hnum+1:end,1)];
H_Test_Theta= [H_Test,H_theta(1:hnum,1)];
H_Train_Theta = [H_Train,H_theta(hnum+1:end,1)];
end