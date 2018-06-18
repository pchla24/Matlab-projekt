% Klasyfikacja obiektów

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);
NazwyAtryb = data(:,1:12).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);

c = cvpartition(data.klasa,'HoldOut',0.3);


% Klasyfikator najblizszego sasiada ------------------------------------

kl_nn = fitcknn(data{c.training,1:11},data{c.training,12},'NumNeighbors',1);
% Wynik klasyfikacji zbioru ucz¹cego
wynik_training_nn = kl_nn.predict(data{c.training,1:11});
test_training_nn = crosstab(data{c.training,12},wynik_training_nn);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_nn = kl_nn.predict(data{c.test,1:11});
test_test_nn = crosstab(data{c.test,12},wynik_test_nn);
% Wynik nieprawidlowy

% Klasyfikator k-najblizszych sasiadow --------------------------------

% W tym przypadku za k przyjmiemy 4
kl_knn = fitcknn(data{c.training,1:11},data{c.training,12},'NumNeighbors',4);
% Wynik klasyfikacji zbioru ucz¹cego
wynik_training_knn = kl_knn.predict(data{c.training,1:11});
test_training_knn = crosstab(data{c.training,12},wynik_training_knn);
% Wynik nieprawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_knn = kl_knn.predict(data{c.test,1:11});
test_test_knn = crosstab(data{c.test,12},wynik_test_knn);
% Wynik nieprawidlowy

% Metoda najblizszych prototypow --------------------------------------

% Tworzenie tablicy prototypow
pro_c(1,:) = mean(data{c.training & data.klasa == 1,1:11});
pro_c(2,:) = mean(data{c.training & data.klasa == 2,1:11});
pro_c(3,:) = mean(data{c.training & data.klasa == 3,1:11});
pro_c(4,:) = mean(data{c.training & data.klasa == 4,1:11});
num_klas = [ 1; 2; 3; 4 ];
pro_c(:,12) = num_klas;
pro = array2table(pro_c);
pro.Properties.RowNames = klasyCell;
pro.Properties.VariableNames = NazwyAtryb;

kl_pro = fitcknn(pro{:,1:11},pro{:,12},'NumNeighbors',1);

% Wynik klasyfikacji zbioru uczacego
wynik_training_pro = kl_pro.predict(data{c.training,1:11});
test_training_pro = crosstab(data{c.training,12},wynik_training_pro);
% % Wynik nieprawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_pro = kl_pro.predict(data{c.test,1:11});
test_test_pro = crosstab(data{c.test,12},wynik_test_pro);
% Wynik nieprawidlowy

% Naiwny klasyfikator Bayesa ------------------------------------------

kl_bay = fitcnb(data{c.training,1:11},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_bay = kl_bay.predict(data{c.training,1:11});
test_training_bay = crosstab(data{c.training,12},wynik_training_bay);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_bay = kl_bay.predict(data{c.test,1:11});
test_test_bay = crosstab(data{c.test,12},wynik_test_bay);
% Wynik prawidlowy

% Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

kl_tree = fitctree(data{c.training,1:11},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_tree = kl_tree.predict(data{c.training,1:11});
test_training_tree = crosstab(data{c.training,12},wynik_training_tree);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_tree = kl_tree.predict(data{c.test,1:11});
test_test_tree = crosstab(data{c.test,12},wynik_test_tree)
% Wynik prawidlowy





















