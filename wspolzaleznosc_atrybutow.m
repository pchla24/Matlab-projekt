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

Kowariancja_dla_klasy_1 = cov(data{data.klasa==1,1:11});

tabelaKowariancji_klasy_1 = array2table(Kowariancja_dla_klasy_1);
tabelaKowariancji_klasy_1.Properties.VariableNames = datX;
tabelaKowariancji_klasy_1.Properties.RowNames = datX;
tabelaKowariancji_klasy_1

Korelacja_dla_klasy_1 = corr(data{data.klasa==1,1:11});

tabelaKorelacji_klasy_1 = array2table(Korelacja_dla_klasy_1);
tabelaKorelacji_klasy_1.Properties.VariableNames = datX;
tabelaKorelacji_klasy_1.Properties.RowNames = datX;
tabelaKorelacji_klasy_1

Kowariancja_dla_klasy_2 = cov(data{data.klasa==2,1:11});

tabelaKowariancji_klasy_2 = array2table(Kowariancja_dla_klasy_2);
tabelaKowariancji_klasy_2.Properties.VariableNames = datX;
tabelaKowariancji_klasy_2.Properties.RowNames = datX;
tabelaKowariancji_klasy_2

Korelacja_dla_klasy_2 = corr(data{data.klasa==2,1:11});

tabelaKorelacji_klasy_2 = array2table(Korelacja_dla_klasy_2);
tabelaKorelacji_klasy_2.Properties.VariableNames = datX;
tabelaKorelacji_klasy_2.Properties.RowNames = datX;
tabelaKorelacji_klasy_2

Kowariancja_dla_klasy_3 = cov(data{data.klasa==3,1:11});

tabelaKowariancji_klasy_3 = array2table(Kowariancja_dla_klasy_3);
tabelaKowariancji_klasy_3.Properties.VariableNames = datX;
tabelaKowariancji_klasy_3.Properties.RowNames = datX;
tabelaKowariancji_klasy_3

Korelacja_dla_klasy_3 = corr(data{data.klasa==3,1:11});

tabelaKorelacji_klasy_3 = array2table(Korelacja_dla_klasy_3);
tabelaKorelacji_klasy_3.Properties.VariableNames = datX;
tabelaKorelacji_klasy_3.Properties.RowNames = datX;
tabelaKorelacji_klasy_3

Kowariancja_dla_klasy_4 = cov(data{data.klasa==4,1:11});

tabelaKowariancji_klasy_4 = array2table(Kowariancja_dla_klasy_4);
tabelaKowariancji_klasy_4.Properties.VariableNames = datX;
tabelaKowariancji_klasy_4.Properties.RowNames = datX;
tabelaKowariancji_klasy_4

Korelacja_dla_klasy_4 = corr(data{data.klasa==4,1:11});

tabelaKorelacji_klasy_4 = array2table(Korelacja_dla_klasy_4);
tabelaKorelacji_klasy_4.Properties.VariableNames = datX;
tabelaKorelacji_klasy_4.Properties.RowNames = datX;
tabelaKorelacji_klasy_4

% Wykresy korelacji -------------------------------------

% corrplot(data{data.klasa==1,1:11})

% corrplot(data{data.klasa==2,1:11})

% corrplot(data{data.klasa==3,1:11})

% corrplot(data{data.klasa==4,1:11})

% corrplot(data{:,1:11})

gplotmatrix(data{:,1:11},[],data.klasa)
title('Macierze wykresów punktowych')




