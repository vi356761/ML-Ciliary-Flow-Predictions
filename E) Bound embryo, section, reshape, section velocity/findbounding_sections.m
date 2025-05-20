% Function to get the bounding box of image and divide it into sections
function [Bound_img, Sections, croppos, cropmaster, mask] = findbounding_sections(Img)
figure;imshow(Img)
mask = roipoly;
bb = regionprops(mask,'BoundingBox');
croppos = bb.BoundingBox;
Bound_img = imcrop(Img,croppos);
figure;imshow(Bound_img)

[HH,MM,TT,MU,MD,cropmaster] = sectionembryofin(Bound_img);
Sections.Head = HH;
Sections.Tail = TT;
Sections.Midup = MU;
Sections.Middown = MD;
Sections.Mid = MM;
close all;
end