function [Out1,Out2] = reducenoisewiener(I1)
II1 = rgb2gray(I1);
Out1 = wiener2(II1,[4 4]);
Out2 = imadjust(Out1);
end