function T1 = groupunevenmatrix(lamda1,lamda2,lamda3,lamda4)
Highsz = max([length(lamda1),length(lamda2),length(lamda3),length(lamda4)]);
LamdaEN = nan(Highsz,4); 
LamdaEN(1:size(lamda1,1),1) = lamda1;
LamdaEN(1:size(lamda2,1),2) = lamda2;
LamdaEN(1:size(lamda3,1),3) = lamda3;
LamdaEN(1:size(lamda4,1),4) = lamda4;
%LamdaEN(1:size(lamda5,1),5) = lamda5;
T1 = array2table(LamdaEN,'VariableNames',{'Head','Midup','Middown','Tail'});
end