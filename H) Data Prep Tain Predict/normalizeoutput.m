function [S_Test_Norm,S_Train_Norm] = normalizeoutput(S_Test_Div,S_Train_Div)

O_Total = [S_Test_Div(:,end);S_Train_Div(:,end)];
O_Total_Norm = normalize(O_Total,'range',[0 1]);
O_Test_Norm = O_Total_Norm(1:size(S_Test_Div,1),:);
O_Train_Norm = O_Total_Norm(size(S_Test_Div,1)+1:end,:);
S_Test_Norm = [S_Test_Div(:,1:end-1),O_Test_Norm];
S_Train_Norm = [S_Train_Div(:,1:end-1),O_Train_Norm];

end