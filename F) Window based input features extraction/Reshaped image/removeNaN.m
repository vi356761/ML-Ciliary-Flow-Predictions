function Tail1 = removeNaN(T1)
%T1 = Dat1(:,2);
T11 = find(~isnan(T1));
Tail1 = T1(T11);
end