function [Full_Emb1,Seg] = getfullsizeseg_ver2(Head_Fin,Midup_Fin,Middown_Fin,Tail_Fin,Mem)
Mid = [Midup_Fin;Middown_Fin];
%diff = size(Head_Fin,1)-size(Mid,1);
if(size(Mid,1)==size(Head_Fin,1))
    Full_Emb1 = [Head_Fin,Mid,Tail_Fin];
    figure;imshow(Full_Emb1)
else
    yd = size(Mem.Imem_adapt,1)-ceil(Mem.Ymid2)+1; ydpad = zeros(yd,size(Mid,2));
    yu = floor(Mem.Ymid1); yupad = zeros(yu,size(Mid,2)); %Use floor for axolotls
    Mid_New = [yupad;Mid;ydpad];
    Full_Emb1 = [Head_Fin,Mid_New,Tail_Fin];
    figure;imshow(Full_Emb1)
end
% L = ceil(sqrt(((Mem.X2-Mem.X1)^2) + ((Mem.Y2-Mem.Y1)^2)));
% delH = L*0.25; delM = L*0.52; DelT = L*0.23;
% Leng =  floor(Mem.X1) + ceil(delH) + ceil(delM) + ceil(DelT)-1; 
Xpad1 = false((size(Full_Emb1,1)),floor(Mem.X1));%ceil for laevis/trops if fails
Xpad2 = false((size(Full_Emb1,1)),(size(Mem.Imem_rotate,2)-(size(Full_Emb1,2)+floor(Mem.X1))));
%Xpad2 = false((size(Full_Emb1,1)),(size(Mem.Imem_rotate,2)-floor(Mem.X2)+1));
Seg = [Xpad1,Full_Emb1,Xpad2];
figure;imshow(Seg)
end