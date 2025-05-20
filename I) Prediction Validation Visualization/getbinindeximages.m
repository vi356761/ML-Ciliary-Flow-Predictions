function [bindiv1,seldiv1] = getbinindeximages(ET1_Div,Index1,idx)
seldiv1 = [];
bindiv1 =[];
co=0;

% Master1_Img_Idx = Master_Images1;
% Master1_Img_Bi = Master_Images1;
for rr=1:size(Index1,1)
    for cc=1:size(Index1,2)
        if(Index1(rr,cc)==1)
            %Master1_Img_Bi{rr,cc}=[];
            %Master1_Img_Idx{rr,cc}=0;
            seldiv1(rr,cc)=0;
            bindiv1(rr,cc)=0;
        else
            co=co+1;
            seldiv1(rr,cc)=ET1_Div(co,1);
            bindiv1(rr,cc)=idx(co,1);
%             Tempi = [Master_Images1{rr,cc}];
%             Tempi2 = im2double(Tempi);
%             Tempi2(:) = idx(co,1);
%             Master1_Img_Idx{rr,cc}=Tempi2;
        end
    end
end