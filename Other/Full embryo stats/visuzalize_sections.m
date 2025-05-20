function visuzalize_sections(Sections1)

figure;
subplot(2,2,1); imshow(Sections1{1,1})
title('Full Embryo1')
subplot(2,2,2); imshow(Sections1{2,1})
title('Full Embryo2')
subplot(2,2,3); imshow(Sections1{3,1})
title('Full Embryo3')
subplot(2,2,4); imshow(Sections1{4,1})
title('Full Embryo4')

end