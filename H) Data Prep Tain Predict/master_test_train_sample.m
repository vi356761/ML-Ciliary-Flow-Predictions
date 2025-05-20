function [Test_Images,Train_Images,S_Test_Div,S_Train_Div,S_Test_Norm_Div,S_Train_Norm_Div,S_Test_Rms,S_Train_Rms,S_Test_Norm_Rms,S_Train_Norm_Rms,S_Test_Theta,S_Train_Theta,S_Test_Norm_Theta,S_Train_Norm_Theta] = master_test_train_sample(path1,subpathname,subpathname_div,subpathname_rms,subpathname_theta,hol)
YY = load([path1,'Extracted_All_MAT_Files.mat']);
ATT1=isnan(YY.ro1);
ATT4=isnan(YY.ro2);
ATT2=isnan(YY.ro3);
ATT3=isnan(YY.ro4);

Col_Img1 = YY.Master_Images_Col1;
Col_Img2 = YY.Master_Images_Col3;
Col_Img3 = YY.Master_Images_Col4;
Col_Img4 = YY.Master_Images_Col2;

[H_Test_Div, H_Train_Div, H_Test_Theta, H_Train_Theta, H_Test_Rms, H_Train_Rms, H_Im_Test, H_Im_Train] = master_remove_outliers_randomize(Col_Img1,ATT1,path1,subpathname{1,1},subpathname_div{1,1},subpathname_rms{1,1},subpathname_theta{1,1},hol);
[MU_Test_Div, MU_Train_Div, MU_Test_Theta, MU_Train_Theta, MU_Test_Rms, MU_Train_Rms, MU_Im_Test, MU_Im_Train] = master_remove_outliers_randomize(Col_Img2,ATT2,path1,subpathname{2,1},subpathname_div{2,1},subpathname_rms{2,1},subpathname_theta{2,1},hol);
[MD_Test_Div, MD_Train_Div, MD_Test_Theta, MD_Train_Theta, MD_Test_Rms, MD_Train_Rms, MD_Im_Test, MD_Im_Train] = master_remove_outliers_randomize(Col_Img3,ATT3,path1,subpathname{3,1},subpathname_div{3,1},subpathname_rms{3,1},subpathname_theta{3,1},hol);
[TT_Test_Div, TT_Train_Div, TT_Test_Theta, TT_Train_Theta, TT_Test_Rms, TT_Train_Rms, TT_Im_Test, TT_Im_Train] = master_remove_outliers_randomize(Col_Img4,ATT4,path1,subpathname{4,1},subpathname_div{4,1},subpathname_rms{4,1},subpathname_theta{4,1},hol);

Test_Images = [H_Im_Test;MU_Im_Test;MD_Im_Test;TT_Im_Test];
Train_Images = [H_Im_Train;MU_Im_Train;MD_Im_Train;TT_Im_Train];

S_Test_Div = [H_Test_Div;MU_Test_Div;MD_Test_Div;TT_Test_Div]; 
S_Train_Div = [H_Train_Div;MU_Train_Div;MD_Train_Div;TT_Train_Div];
[S_Test_Norm_Div,S_Train_Norm_Div] = normalizeoutput(S_Test_Div,S_Train_Div);

S_Test_Rms = [H_Test_Rms;MU_Test_Rms;MD_Test_Rms;TT_Test_Rms]; 
S_Train_Rms = [H_Train_Rms;MU_Train_Rms;MD_Train_Rms;TT_Train_Rms];
[S_Test_Norm_Rms,S_Train_Norm_Rms] = normalizeoutput(S_Test_Rms,S_Train_Rms);

S_Test_Theta = [H_Test_Theta;MU_Test_Theta;MD_Test_Theta;TT_Test_Theta]; 
S_Train_Theta = [H_Train_Theta;MU_Train_Theta;MD_Train_Theta;TT_Train_Theta];
[S_Test_Norm_Theta,S_Train_Norm_Theta] = normalizeoutput(S_Test_Theta,S_Train_Theta);

end