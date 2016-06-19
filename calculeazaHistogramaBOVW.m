function histogramaBOVW = calculeazaHistogramaBOVW(descriptoriHOG, cuvinteVizuale)
  % calculeaza histograma BOVW pe baza descriptorilor si a cuvintelor
  % vizuale, gasind pentru fiecare descriptor cuvantul vizual cel mai
  % apropiat (in sensul distantei Euclidiene)
  %
  % Input:
  %   descriptori: matrice MxD, contine M descriptori de dimensiune D
  %   cuvinteVizuale: matrice NxD, contine N centri de dimensiune D 
  % Output:
  %   histogramaBOVW: vector linie 1xN 
  
 % completati codul
 histogramaBOVW = zeros(1,size(cuvinteVizuale,1));
     
 for i=1:size(descriptoriHOG,1)
     min = Inf;
     cuvantVizual = 0;
     for j=1:size(cuvinteVizuale,1)
        distantaEuclidiana = sqrt(sum((descriptoriHOG(i,:)-cuvinteVizuale(j,:)).^2));
        
        if min > distantaEuclidiana
            cuvantVizual = j;
            min = distantaEuclidiana;
        end       
     end
     histogramaBOVW(1,cuvantVizual) = histogramaBOVW(1,cuvantVizual) + 1;
 end
end