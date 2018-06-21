% Klasyfikacja obiekt�w

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);
NazwyAtryb = data(:,1:12).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);

c = cvpartition(data.klasa,'HoldOut',0.3);

% Klasyfikacja obiektow (czesc I) --------------------------------------

% Klasyfikator najblizszego sasiada ------------------------------------

kl_nn = fitcknn(data{c.training,1:11},data{c.training,12},'NumNeighbors',1);
% Wynik klasyfikacji zbioru ucz�cego
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
% Wynik klasyfikacji zbioru ucz�cego
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

% figure % Opcjonalny wykres
% subplot(1,2,1)
% scatter(data{c.training,7},data{c.training,8},5,wynik_training_bay)
% title('Zbi�r ucz�cy Bayesa')
% xlabel('dat7')
% ylabel('dat8')
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_bay = kl_bay.predict(data{c.test,1:11});
test_test_bay = crosstab(data{c.test,12},wynik_test_bay);

% subplot(1,2,2)
% scatter(data{c.test,7},data{c.test,8},5,wynik_test_bay)
% title('Zbi�r testowy Bayesa')
% xlabel('dat7')
% ylabel('dat8')
% Wynik prawidlowy

% Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

kl_tree = fitctree(data{c.training,1:11},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_tree = kl_tree.predict(data{c.training,1:11});
test_training_tree = crosstab(data{c.training,12},wynik_training_tree);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_tree = kl_tree.predict(data{c.test,1:11});
test_test_tree = crosstab(data{c.test,12},wynik_test_tree);
% Wynik prawidlowy


% Klasyfikacja obiektow (czesc II) --------------------------------------

% Klasyfikator najblizszego sasiada -------------------------------------

kl_nn2 = fitcknn(data{c.training,7:8},data{c.training,12},'NumNeighbors',1);
% Wynik klasyfikacji zbioru ucz�cego
wynik_training_nn2 = kl_nn2.predict(data{c.training,7:8});
test_training_nn2 = crosstab(data{c.training,12},wynik_training_nn2);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_nn2 = kl_nn2.predict(data{c.test,7:8});
test_test_nn2 = crosstab(data{c.test,12},wynik_test_nn2);
% Wynik prawidlowy


% Klasyfikator k-najblizszych sasiadow --------------------------------

% W tym przypadku za k przyjmiemy 4
kl_knn2 = fitcknn(data{c.training,7:8},data{c.training,12},'NumNeighbors',4);
% Wynik klasyfikacji zbioru ucz�cego
wynik_training_knn2 = kl_knn2.predict(data{c.training,7:8});
test_training_knn2 = crosstab(data{c.training,12},wynik_training_knn2);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_knn2 = kl_knn2.predict(data{c.test,7:8});
test_test_knn2 = crosstab(data{c.test,12},wynik_test_knn2);
% Wynik prawidlowy


% Metoda najblizszych prototypow --------------------------------------

kl_pro2 = fitcknn(pro{:,7:8},pro{:,12},'NumNeighbors',1);

% Wynik klasyfikacji zbioru uczacego
wynik_training_pro2 = kl_pro2.predict(data{c.training,7:8});
test_training_pro2 = crosstab(data{c.training,12},wynik_training_pro2);
% % Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_pro2 = kl_pro2.predict(data{c.test,7:8});
test_test_pro2 = crosstab(data{c.test,12},wynik_test_pro2);
% Wynik prawidlowy

% Naiwny klasyfikator Bayesa ------------------------------------------

kl_bay2 = fitcnb(data{c.training,7:8},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_bay2 = kl_bay2.predict(data{c.training,7:8});
test_training_bay2 = crosstab(data{c.training,12},wynik_training_bay2);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_bay2 = kl_bay2.predict(data{c.test,7:8});
test_test_bay2 = crosstab(data{c.test,12},wynik_test_bay2);
% Wynik prawidlowy

% Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

kl_tree2 = fitctree(data{c.training,7:8},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_tree2 = kl_tree2.predict(data{c.training,7:8});
test_training_tree2 = crosstab(data{c.training,12},wynik_training_tree2);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_tree2 = kl_tree2.predict(data{c.test,7:8});
test_test_tree2 = crosstab(data{c.test,12},wynik_test_tree2);
% Wynik prawidlowy

% Klasyfikacja obiektow (czesc III) --------------------------------------

% Klasyfikator najblizszego sasiada -------------------------------------

kl_nn3 = fitcknn(data{c.training,[7 8 4]},data{c.training,12},'NumNeighbors',1);
% Wynik klasyfikacji zbioru ucz�cego
wynik_training_nn3 = kl_nn3.predict(data{c.training,[7 8 4]});
test_training_nn3 = crosstab(data{c.training,12},wynik_training_nn3);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_nn3 = kl_nn3.predict(data{c.test,[7 8 4]});
test_test_nn3 = crosstab(data{c.test,12},wynik_test_nn3);
% Wynik prawidlowy


% Klasyfikator k-najblizszych sasiadow --------------------------------

% W tym przypadku za k przyjmiemy 4
kl_knn3 = fitcknn(data{c.training,[7 8 4]},data{c.training,12},'NumNeighbors',4);
% Wynik klasyfikacji zbioru ucz�cego
wynik_training_knn3 = kl_knn3.predict(data{c.training,[7 8 4]});
test_training_knn3 = crosstab(data{c.training,12},wynik_training_knn3);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_knn3 = kl_knn3.predict(data{c.test,[7 8 4]});
test_test_knn3 = crosstab(data{c.test,12},wynik_test_knn3);
% Wynik prawidlowy


% Metoda najblizszych prototypow --------------------------------------

kl_pro3 = fitcknn(pro{:,[7 8 4]},pro{:,12},'NumNeighbors',1);

% Wynik klasyfikacji zbioru uczacego
wynik_training_pro3 = kl_pro3.predict(data{c.training,[7 8 4]});
test_training_pro3 = crosstab(data{c.training,12},wynik_training_pro3);
% % Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_pro3 = kl_pro3.predict(data{c.test,[7 8 4]});
test_test_pro3 = crosstab(data{c.test,12},wynik_test_pro3);
% Wynik prawidlowy

% Naiwny klasyfikator Bayesa ------------------------------------------

kl_bay3 = fitcnb(data{c.training,[7 8 4]},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_bay3 = kl_bay3.predict(data{c.training,[7 8 4]});
test_training_bay3 = crosstab(data{c.training,12},wynik_training_bay3);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_bay3 = kl_bay3.predict(data{c.test,[7 8 4]});
test_test_bay3 = crosstab(data{c.test,12},wynik_test_bay3);
% Wynik prawidlowy

% Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

kl_tree3 = fitctree(data{c.training,[7 8 4]},data{c.training,12});

% Wynik klasyfikacji zbioru uczacego
wynik_training_tree3 = kl_tree3.predict(data{c.training,[7 8 4]});
test_training_tree3 = crosstab(data{c.training,12},wynik_training_tree3);
% Wynik prawidlowy

% Wynik klasyfikacji zbioru testowego
wynik_test_tree3 = kl_tree3.predict(data{c.test,[7 8 4]});
test_test_tree3 = crosstab(data{c.test,12},wynik_test_tree3);
% Wynik prawidlowy

sep=NaN(4,1);
test_test_nna = [test_test_nn sep test_test_nn2 sep test_test_nn3] % nn knn pro, wszystkie - �le, 2 i 3 te same pojedyncze b��dy
test_test_knna = [test_test_knn sep test_test_knn2 sep test_test_knn3]
test_test_proa = [test_test_pro sep test_test_pro2 sep test_test_pro3]
test_test_baya = [test_test_bay sep test_test_bay2 sep test_test_bay3] % Myli pojedyncze dla 2, dla wszystkie i 3 bezb��dnie
test_test_treea = [test_test_tree sep test_test_tree2 sep test_test_tree3] % R�nie








