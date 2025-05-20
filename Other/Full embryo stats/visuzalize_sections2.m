function visuzalize_sections2(Sections1,Sections2)

figure;
subplot(3,2,1); imshowpair(Sections1{1,1},Sections2{1,1})
title('Full Embryo1')
subplot(3,2,2); imshowpair(Sections1{2,1},Sections2{2,1})
title('Full Embryo2')
subplot(3,2,3); imshowpair(Sections1{3,1},Sections2{3,1})
title('Full Embryo3')
subplot(3,2,4); imshowpair(Sections1{4,1},Sections2{4,1})
title('Full Embryo4')
subplot(3,2,5); imshowpair(Sections1{5,1},Sections2{5,1})
title('Full Embryo5')
subplot(3,2,6); imshowpair(Sections1{6,1},Sections2{6,1})
title('Full Embryo6')

end