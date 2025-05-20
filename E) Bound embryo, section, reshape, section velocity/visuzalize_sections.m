function visuzalize_sections(Bound_img1,Sections1)
figure;
subplot(2,2,1); imshow(Bound_img1)
title('Full Embryo')
subplot(2,2,2); imshow(Sections1.Head)
title('Head Section')
subplot(2,2,3); imshow(Sections1.Mid)
title('Mid Section')
subplot(2,2,4); imshow(Sections1.Tail)
title('Tail Section')

figure;%Draw top to bottom
subplot(1,2,1); imshow(Sections1.Midup)
title('Mid-up')
subplot(1,2,2); imshow(Sections1.Middown)
title('Mid-down')
end