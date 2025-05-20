function Master_Features = getrawvaluesback_V3(Avg_Test,M_Test)
Mini = min(M_Test);
Maxi = max(M_Test);
minimaxi = [Mini;Maxi];
Min_Max = table2array(minimaxi);
%Master=[Master_Test;Master_Train];
Avg_Test2 = table2array(Avg_Test);
New_norm = zeros(size(Avg_Test2,1),size(Avg_Test2,2));
for xx=1:size(Avg_Test2,2)
    New_Col = [Avg_Test2(:,xx)-Min_Max(1,xx)]./[Min_Max(2,xx)-Min_Max(1,xx)];
    Master_Feat(:,xx)=New_Col;
    clear New_Col
end
varnames = Avg_Test.Properties.VariableNames;
Master_Features = array2table(Master_Feat,'VariableNames',varnames);
end