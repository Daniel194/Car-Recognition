function puncteCaroiaj = genereazaPuncteCaroiaj(img,nrPuncteX,nrPuncteY,margine)
% genereaza puncte pe baza unui caroiaj
% un caroiaj este o retea de drepte orizontale si verticale de forma urmatoare:
%
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%      --+---+---+---+--
%        |   |   |   |
%
% Input:
%       img - imaginea input
%       nrPuncteX - numarul de drepte verticale folosit la constructia caroiajului
%                 - in desenul de mai sus aceste drepte sunt identificate cu simbolul |
%       nrPuncteY - numarul de drepte orizontale folosit la constructia caroiajului
%                 - in desenul de mai sus aceste drepte sunt identificate cu simbolul --
%         margine - numarul de pixeli de la marginea imaginii (sus, jos, stanga, dreapta) pentru care nu se considera puncte
% Output:
%       puncteCaroiaj - matrice (nrPuncteX * nrPuncteY) X 2
%                     - fiecare linie reprezinta un punct (y,x) de pe caroiaj aflat la intersectia dreptelor orizontale si verticale
%                     - in desenul de mai sus aceste puncte sunt idenficate cu semnul +

puncteCaroiaj = zeros(nrPuncteX*nrPuncteY,2);

%completati codul
k=0;
pasY = floor((size(img,1) - 2*margine)/nrPuncteY);
pasX = floor((size(img,2) - 2*margine)/nrPuncteX); 

for X= pasX+margine:pasX:size(img,2)-margine
    for Y= pasY+margine:pasY:size(img,1)-margine
        k = k+1;
        puncteCaroiaj(k,1) = Y;
        puncteCaroiaj(k,2) = X;
    end 
end
end