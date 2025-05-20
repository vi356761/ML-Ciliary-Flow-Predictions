function label = labelsamples(M_Test_Images)
label{length(M_Test_Images),1}=[];
for oo=1:length(M_Test_Images)
    if(isequal(size(M_Test_Images{oo,1},1),150))
        label{oo,1} = ('Tropicalis');
    elseif(isequal(size(M_Test_Images{oo,1},1),120))
        label{oo,1} = ('Laevis');
    else
        label{oo,1} = ('Axolotl');
    end
end
end