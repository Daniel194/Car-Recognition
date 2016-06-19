function eticheta = clasificaBOVWBayes( histogramaBOVW_test, histogrameBOVW_exemplePozitive, histogrameBOVW_exempleNegative)
% eticheta = eticheta dedusa prin teorema lui Bayes
%
% Input: 
%       histogramaBOVW_test - matrice 1 x K, histograma BOVW a unei imagini test
%       histogrameBOVW_exemplePozitive - matrice #ImaginiExemplePozitive x K, fiecare linie reprezinta histograma BOVW a unei imagini pozitive
%       histogrameBOVW_exempleNegative - matrice #ImaginiExempleNegative x K, fiecare linie reprezinta histograma BOVW a unei imagini negative
% Output: 
%     eticheta - eticheta dedusa a imaginii test

[muPos, sigmaPos] = calculeazaMedieDeviatieStandardCuvinteVizuale(histogrameBOVW_exemplePozitive);
[muNeg, sigmaNeg] = calculeazaMedieDeviatieStandardCuvinteVizuale(histogrameBOVW_exempleNegative);

% calculati probabilitatea a-posteriori Bayes

probabilitateaNegativa=0;
probabilitateaPozitiva=0;

for i=1:size(histogramaBOVW_test,2)
    probabilitateaPozitiva = probabilitateaPozitiva + log(normpdf(histogramaBOVW_test(1,i),...
        muPos(1,i),sigmaPos(1,i)));
    
    probabilitateaNegativa = probabilitateaNegativa + log(normpdf(histogramaBOVW_test(1,i),...
        muNeg(1,i),sigmaNeg(1,i)));
end

probabilitatea = (probabilitateaPozitiva*0.5)/(probabilitateaPozitiva*0.5 + probabilitateaNegativa*0.5);
  
%Argumentare : datorita faptului ca abs(log(x)) < abs(log(1-x)), unde x>0.5
%si x<=1 vom avea o probabilitate inversa atunci cand calculam
%probabilitatea, de aceea avem nevoie de 1 - probabilitatea in if-ul de mai jos.
if 1 - probabilitatea > 0.5
    eticheta=1;
else
    eticheta=0;
end
end