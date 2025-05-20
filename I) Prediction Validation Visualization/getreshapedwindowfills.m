function [G_ET_Head,G_EET_Head] =getreshapedwindowfills(ATT1,ET_Head,EET_Head)
G_ET_Head =zeros(size(ATT1));
G_EET_Head =zeros(size(ATT1));
cn=0;
for bb=1:length(ATT1)
    if(ATT1(bb,1)~=1)
        cn = cn+1;
        G_ET_Head(bb,1) = ET_Head(cn,1);
        G_EET_Head(bb,1) = EET_Head(cn,1);
    end
end
end