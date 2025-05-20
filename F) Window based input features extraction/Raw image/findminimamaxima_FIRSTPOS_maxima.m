function [minima,maxima] = findminimamaxima_FIRSTPOS_maxima(FF,thresh)
%% Now find the maxima and minima Xdir
%Only consider the first local maximum peak after minima 
%X-Direction................................................................
[~,maxind1] = max(FF);
FFF = FF(maxind1 : end);
% Define the axial distance r
% [~,indi] = min(FFF);
% 
if(size(FFF,1)==1)
   rr = round(linspace(0,length(FFF),length(FFF)));
else
    rr = round(linspace(0,length(FFF),length(FFF)).');
end

%Find maxima
[peaks1,indpeaks1] = findpeaks(FFF);
distpeaks = rr(indpeaks1);

indpos = peaks1>0;
distpeaksnew = distpeaks(indpos);
%indpeaksnew = indpeaks1(indpos);

ind2 = distpeaksnew>thresh; %Choose values above thresh as maxima must be less than thresh
%indpeaks2 = indpeaksnew(ind2);
distpeaks2 = distpeaksnew(ind2);

if (isempty(distpeaks2))
    maxima = length(FFF);
elseif (length(distpeaks2)==1)
    maxima = distpeaks2(1);
else
    maxi=0;ii=0;
    while(maxi<thresh)
        ii=ii+1;
        maxi=distpeaks2(ii);
    end
    maxima=maxi;
end

%......................Find Minima.........................................
if (maxima>thresh)
    nmin = round(maxima);
elseif(maxima<thresh)
    nmin = round(thresh+10);
end
minmatrix = -FFF(1:nmin);
[~,indpeaks2] = findpeaks(minmatrix);
%minima = rr(indpeaks2(1));
if (isempty(indpeaks2))
    minima=0;
else
    minima = rr(indpeaks2(1,1));
end
end