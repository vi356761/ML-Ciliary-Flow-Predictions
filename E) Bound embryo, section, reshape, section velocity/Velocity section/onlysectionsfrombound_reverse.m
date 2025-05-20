function [Sections11,cropmaster11] = onlysectionsfrombound_reverse(Im_bound)
[HH11,MM11,TT11,MU11,MD11,cropmaster11] = sectionembryofin_reverse(Im_bound);
Sections11.Head = TT11;
Sections11.Tail = HH11;
Sections11.Midup = MU11;
Sections11.Middown = MD11;
Sections11.Mid = MM11;
end