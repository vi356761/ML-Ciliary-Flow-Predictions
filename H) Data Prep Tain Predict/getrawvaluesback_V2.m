function Master_Features = getrawvaluesback_V2(Avg_Test,M_Test)
Mini = min(M_Test);
Maxi = max(M_Test);
minimaxi = [Mini;Maxi];
Min_Max = table2array(minimaxi);
%Master=[Master_Test;Master_Train];
New_norm = zeros(size(Avg_Test,1),size(Avg_Test,2)-2);
for xx=1:9
    Temp_norm = normalize(Avg_Test(:,xx),'range',[Min_Max(1,xx) Min_Max(2,xx)]);
    New_norm(:,xx) = table2array(Temp_norm);
    clear Temp_Norm
end
varnames = Avg_Test.Properties.VariableNames;
newvarnames = varnames(1,1:9);
New_norm_Tab = array2table(New_norm,'VariableNames',newvarnames);
Master_Features = [New_norm_Tab,Avg_Test(:,10)];
end