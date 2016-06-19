function eticheta = clasificaBOVWCelMaiApropiatVecin(histogramaBOVW_test,histogrameBOVW_exemplePozitive,histogrameBOVW_exempleNegative)
% eticheta = eticheta celui mai apropiat vecin (in sensul distantei Euclidiene)
% eticheta = 1, daca cel mai apropiat vecin este un exemplu pozitiv,
% eticheta = 0, daca cel mai apropiat vecin este un exemplu negativ. 
% Input: 
%       histogramaBOVW_test - matrice 1 x K, histograma BOVW a unei imagini test
%       histogrameBOVW_exemplePozitive - matrice #ImaginiExemplePozitive x K, fiecare linie reprezinta histograma BOVW a unei imagini pozitive
%       histogrameBOVW_exempleNegative - matrice #ImaginiExempleNegative x K, fiecare linie reprezinta histograma BOVW a unei imagini negative
% Output: 
%     eticheta - eticheta dedusa a imaginii test

  
min = Inf;

for i=1:size(histogrameBOVW_exemplePozitive,1)
    distantaEuclidiana = sqrt(sum((histogrameBOVW_exemplePozitive(i,:)-histogramaBOVW_test).^2));      
    if min > distantaEuclidiana
        eticheta=1;
        min = distantaEuclidiana;
    end   
end

for i=1:size(histogrameBOVW_exempleNegative,1)
    distantaEuclidiana = sqrt(sum((histogrameBOVW_exempleNegative(i,:)-histogramaBOVW_test).^2));      
    if min > distantaEuclidiana
        eticheta=0;
        min = distantaEuclidiana;
    end   
end
  
end
