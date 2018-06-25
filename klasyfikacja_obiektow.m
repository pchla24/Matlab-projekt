% Klasyfikacja obiektów

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);
NazwyAtryb = data(:,1:12).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);

for i=1:15
    c = cvpartition(data.klasa,'HoldOut',0.3);

    % Klasyfikacja obiektow (czesc I) --------------------------------------
    
    % Klasyfikator najblizszego sasiada ------------------------------------

    kl_nn = fitcknn(data{c.training,1:11},data{c.training,12},'NumNeighbors',1);
    % Wynik klasyfikacji zbioru ucz¹cego
    wynik_training_nn = kl_nn.predict(data{c.training,1:11});
    test_training_nn = crosstab(data{c.training,12},wynik_training_nn); % Wynik prawidlowy
    
    % Wynik klasyfikacji zbioru testowego
    wynik_test_nn = kl_nn.predict(data{c.test,1:11});
    test_test_nn(:,:,i) = crosstab(data{c.test,12},wynik_test_nn);  % Wynik nieprawidlowy
   
    % Klasyfikator k-najblizszych sasiadow --------------------------------

    % W tym przypadku za k przyjmiemy 4
    kl_knn = fitcknn(data{c.training,1:11},data{c.training,12},'NumNeighbors',4);
    % Wynik klasyfikacji zbioru ucz¹cego
    wynik_training_knn = kl_knn.predict(data{c.training,1:11});
    test_training_knn = crosstab(data{c.training,12},wynik_training_knn);  % Wynik nieprawidlowy
    
    % Wynik klasyfikacji zbioru testowego
    wynik_test_knn = kl_knn.predict(data{c.test,1:11});
    test_test_knn(:,:,i) = crosstab(data{c.test,12},wynik_test_knn);  % Wynik nieprawidlowy
   
    % Metoda najblizszych prototypow --------------------------------------

    % Tworzenie tablicy prototypow
    pro_c = [];
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
    test_training_pro = crosstab(data{c.training,12},wynik_training_pro);   % Wynik nieprawidlowy
    
    % Wynik klasyfikacji zbioru testowego
    wynik_test_pro = kl_pro.predict(data{c.test,1:11});
    test_test_pro(:,:,i) = crosstab(data{c.test,12},wynik_test_pro);     % Wynik nieprawidlowy

    % Naiwny klasyfikator Bayesa ------------------------------------------

    kl_bay = fitcnb(data{c.training,1:11},data{c.training,12});

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_bay = kl_bay.predict(data{c.training,1:11});
    test_training_bay = crosstab(data{c.training,12},wynik_training_bay);

    % Wynik klasyfikacji zbioru testowego
    wynik_test_bay = kl_bay.predict(data{c.test,1:11});
    test_test_bay(:,:,i) = crosstab(data{c.test,12},wynik_test_bay);  % Wynik prawidlowy


    % Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

    kl_tree = fitctree(data{c.training,1:11},data{c.training,12});

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_tree = kl_tree.predict(data{c.training,1:11});
    test_training_tree = crosstab(data{c.training,12},wynik_training_tree);    % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_tree = kl_tree.predict(data{c.test,1:11});
    test_test_tree(:,:,i) = crosstab(data{c.test,12},wynik_test_tree);   % Wynik prawidlowy
    

    % Klasyfikacja obiektow (czesc II) --------------------------------------
    
    % Klasyfikator najblizszego sasiada -------------------------------------

    kl_nn2 = fitcknn(data{c.training,7:8},data{c.training,12},'NumNeighbors',1);
    % Wynik klasyfikacji zbioru ucz¹cego
    wynik_training_nn2 = kl_nn2.predict(data{c.training,7:8});
    test_training_nn2 = crosstab(data{c.training,12},wynik_training_nn2);    % Wynik prawidlowy
 
    % Wynik klasyfikacji zbioru testowego
    wynik_test_nn2 = kl_nn2.predict(data{c.test,7:8});
    test_test_nn2(:,:,i) = crosstab(data{c.test,12},wynik_test_nn2); % Wynik prawidlowy
    
    % Klasyfikator k-najblizszych sasiadow --------------------------------

    % W tym przypadku za k przyjmiemy 4
    kl_knn2 = fitcknn(data{c.training,7:8},data{c.training,12},'NumNeighbors',4);
    % Wynik klasyfikacji zbioru ucz¹cego
    wynik_training_knn2 = kl_knn2.predict(data{c.training,7:8});
    test_training_knn2 = crosstab(data{c.training,12},wynik_training_knn2);     % Wynik prawidlowy
    
    % Wynik klasyfikacji zbioru testowego
    wynik_test_knn2 = kl_knn2.predict(data{c.test,7:8});
    test_test_knn2(:,:,i) = crosstab(data{c.test,12},wynik_test_knn2);     % Wynik prawidlowy

    % Metoda najblizszych prototypow --------------------------------------
    
    kl_pro2 = fitcknn(pro{:,7:8},pro{:,12},'NumNeighbors',1);

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_pro2 = kl_pro2.predict(data{c.training,7:8});
    test_training_pro2 = crosstab(data{c.training,12},wynik_training_pro2);    % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_pro2 = kl_pro2.predict(data{c.test,7:8});
    test_test_pro2(:,:,i) = crosstab(data{c.test,12},wynik_test_pro2);    % Wynik prawidlowy

    % Naiwny klasyfikator Bayesa ------------------------------------------

    kl_bay2 = fitcnb(data{c.training,7:8},data{c.training,12});

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_bay2 = kl_bay2.predict(data{c.training,7:8});
    test_training_bay2 = crosstab(data{c.training,12},wynik_training_bay2);     % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_bay2 = kl_bay2.predict(data{c.test,7:8});
    test_test_bay2(:,:,i) = crosstab(data{c.test,12},wynik_test_bay2);     % Wynik prawidlowy

    % Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

    kl_tree2 = fitctree(data{c.training,7:8},data{c.training,12});

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_tree2 = kl_tree2.predict(data{c.training,7:8});
    test_training_tree2 = crosstab(data{c.training,12},wynik_training_tree2);     % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_tree2 = kl_tree2.predict(data{c.test,7:8});
    test_test_tree2(:,:,i) = crosstab(data{c.test,12},wynik_test_tree2);     % Wynik prawidlowy


    % Klasyfikacja obiektow (czesc III) --------------------------------------
    
    % Klasyfikator najblizszego sasiada -------------------------------------

    kl_nn3 = fitcknn(data{c.training,[7 8 4]},data{c.training,12},'NumNeighbors',1);
    % Wynik klasyfikacji zbioru ucz¹cego
    wynik_training_nn3 = kl_nn3.predict(data{c.training,[7 8 4]});
    test_training_nn3 = crosstab(data{c.training,12},wynik_training_nn3);
    % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_nn3 = kl_nn3.predict(data{c.test,[7 8 4]});
    test_test_nn3(:,:,i) = crosstab(data{c.test,12},wynik_test_nn3);
    % Wynik prawidlowy


    % Klasyfikator k-najblizszych sasiadow --------------------------------

    % W tym przypadku za k przyjmiemy 4
    kl_knn3 = fitcknn(data{c.training,[7 8 4]},data{c.training,12},'NumNeighbors',4);
    % Wynik klasyfikacji zbioru ucz¹cego
    wynik_training_knn3 = kl_knn3.predict(data{c.training,[7 8 4]});
    test_training_knn3 = crosstab(data{c.training,12},wynik_training_knn3);     % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_knn3 = kl_knn3.predict(data{c.test,[7 8 4]});
    test_test_knn3(:,:,i) = crosstab(data{c.test,12},wynik_test_knn3);     % Wynik prawidlowy

    % Metoda najblizszych prototypow --------------------------------------

    kl_pro3 = fitcknn(pro{:,[7 8 4]},pro{:,12},'NumNeighbors',1);

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_pro3 = kl_pro3.predict(data{c.training,[7 8 4]});
    test_training_pro3 = crosstab(data{c.training,12},wynik_training_pro3);     % % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_pro3 = kl_pro3.predict(data{c.test,[7 8 4]});
    test_test_pro3(:,:,i) = crosstab(data{c.test,12},wynik_test_pro3);     % Wynik prawidlowy

    % Naiwny klasyfikator Bayesa ------------------------------------------

    kl_bay3 = fitcnb(data{c.training,[7 8 4]},data{c.training,12});

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_bay3 = kl_bay3.predict(data{c.training,[7 8 4]});
    test_training_bay3 = crosstab(data{c.training,12},wynik_training_bay3);     % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_bay3 = kl_bay3.predict(data{c.test,[7 8 4]});
    test_test_bay3(:,:,i) = crosstab(data{c.test,12},wynik_test_bay3);    % Wynik prawidlowy

    % Klasyfikacja z wykorzystaniem drzewa decyzyjnego -------------------

    kl_tree3 = fitctree(data{c.training,[7 8 4]},data{c.training,12});

    % Wynik klasyfikacji zbioru uczacego
    wynik_training_tree3 = kl_tree3.predict(data{c.training,[7 8 4]});
    test_training_tree3 = crosstab(data{c.training,12},wynik_training_tree3);    % Wynik prawidlowy

    % Wynik klasyfikacji zbioru testowego
    wynik_test_tree3 = kl_tree3.predict(data{c.test,[7 8 4]});
    test_test_tree3(:,:,i) = crosstab(data{c.test,12},wynik_test_tree3);    % Wynik prawidlowy

end

sep=NaN(4,1);
disp('Uœrednione wyniki dla 15 iteracji dla wszystich klasyfikatorów w kolejnoœci: wszystkie, 2 atrybuty, 3 atrybuty')
disp('Klasyfikator najblizszego s¹siada')
test_test_nna = [mean(test_test_nn,3) sep mean(test_test_nn2,3) sep mean(test_test_nn3,3)] 
disp('Klasyfikator k-najblizszych s¹siadów')
test_test_knna = [mean(test_test_knn,3) sep mean(test_test_knn2,3) sep mean(test_test_knn3,3)]
disp('Metoda najblizszych prototypów')
test_test_proa = [mean(test_test_pro,3) sep mean(test_test_pro2,3) sep mean(test_test_pro3,3)]
disp('Naiwny klasyfikator Bayesa')
test_test_baya = [mean(test_test_bay,3) sep mean(test_test_bay2,3) sep mean(test_test_bay3,3)] 
disp('Klasyfikacja z wykorzystaniem drzewa decyzyjnego')
test_test_treea = [mean(test_test_tree,3) sep mean(test_test_tree2,3) sep mean(test_test_tree3,3)] 




