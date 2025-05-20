function [conf_seg_crop,Sections11,cropmaster11] = getsectionsfromcrop_reverse(conf_seg,croppos1)
conf_seg_crop = imcrop(conf_seg,croppos1);
figure;imshow(conf_seg_crop)
[HH11,MM11,TT11,MU11,MD11,cropmaster11] = sectionembryofin_reverse(conf_seg_crop);
Sections11.Head = TT11;
Sections11.Tail = HH11;
Sections11.Midup = MU11;
Sections11.Middown = MD11;
Sections11.Mid = MM11;
close all;
end