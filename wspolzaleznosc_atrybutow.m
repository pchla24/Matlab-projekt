% Zaleznosci miedzy atrybutami dla poszczegolnych klas obiektow

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);

datX = data(:,1:end-1).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);


% Kowariancja i korelacja ----------------------------------

Kowar1 = cov(data{data.klasa==1,1:11});
Korel1 = corr(data{data.klasa==1,1:11});

Kowar2 = cov(data{data.klasa==2,1:11});
Korel2 = corr(data{data.klasa==2,1:11});

Kowar3 = cov(data{data.klasa==3,1:11});
Korel3 = corr(data{data.klasa==3,1:11});

Kowar4 = cov(data{data.klasa==4,1:11});
Korel4 = corr(data{data.klasa==4,1:11});

% corrplot(data{data.klasa==1,1:11})
% 
% corrplot(data{data.klasa==2,1:11})
% 
% corrplot(data{data.klasa==3,1:11})
% 
% corrplot(data{data.klasa==4,1:11})




