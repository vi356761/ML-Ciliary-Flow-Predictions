function showimagepairs(n,Mem,Tub)
switch n
    case 'both'
        figure; imshowpair(adapthisteq(Mem),adapthisteq(Tub));
    case 'mem'
        figure; imshowpair(adapthisteq(Mem),Tub);
    case 'tub'
        figure; imshowpair(Mem,adapthisteq(Tub));
    otherwise
        figure; imshowpair(Mem,Tub);
end
end