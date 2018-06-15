% Miary

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);

datX = data(:,1:end-1).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);


% Srednie ---------------------------------------------------

Srednie = zeros(4,11);
for i=1:4
    for j=1:11
        Srednie(i,j) = mean(data_num(data_num(:,12)==i,j));
    end
end

figure
for i=1:11
    subplot(3,4,i)
    bar(klasy,Srednie(:,i));
    title(['dat' num2str(i)]);
    ylabel('Wartosc srednia')
end

tabelaSrednich = array2table(Srednie);
tabelaSrednich.Properties.VariableNames = datX;
tabelaSrednich.Properties.RowNames = klasyCell;
tabelaSrednich

% Mediany ---------------------------------------------------

Mediany = zeros(4,11);

for i=1:4
    for j=1:11
        Mediany(i,j) = median(data_num(data_num(:,12)==i,j));
    end
end

figure
for i=1:11
    subplot(3,4,i)
    bar(klasy,Mediany(:,i));
    title(['dat' num2str(i)]);
    ylabel('Wartosc mediany')
end

tabelaMedian = array2table(Srednie);
tabelaMedian.Properties.VariableNames = datX;
tabelaMedian.Properties.RowNames = klasyCell;
tabelaMedian

% Rozstep ----------------------------------------------------

Rozstep = zeros(4,11);

for i=1:4
    for j=1:11
        Rozstep(i,j) = max(data_num(data_num(:,12)==i,j)) - min(data_num(data_num(:,12)==i,j));
    end
end

figure
for i=1:11
    subplot(3,4,i)
    bar(klasy,Rozstep(:,i));
    title(['dat' num2str(i)]);
    ylabel('Wartosc rozstepu')
end

tabelaRozstepu = array2table(Rozstep);
tabelaRozstepu.Properties.VariableNames = datX;
tabelaRozstepu.Properties.RowNames = klasyCell;
tabelaRozstepu

% Odchylenie standardowe i wariancja ------------------------

OdchStd = zeros(4,11);
Wariancja = zeros(4,11);

for i=1:4
    for j=1:11
        OdchStd(i,j) = std(data_num(data_num(:,12)==i,j));
        Wariancja(i,j) = var(data_num(data_num(:,12)==i,j));
    end
end

figure
for i=1:11
    subplot(3,4,i)
    bar(klasy,OdchStd(:,i));
    title(['dat' num2str(i)]);
    ylabel('Wartosc odchylenia std.')
end

figure
for i=1:11
    subplot(3,4,i)
    bar(klasy,Wariancja(:,i));
    title(['dat' num2str(i)]);
    ylabel('Wartosc Wariancji')
end

tabelaOdchStd = array2table(OdchStd);
tabelaOdchStd.Properties.VariableNames = datX;
tabelaOdchStd.Properties.RowNames = klasyCell;
tabelaOdchStd

tabelaWariancji = array2table(Wariancja);
tabelaWariancji.Properties.VariableNames = datX;
tabelaWariancji.Properties.RowNames = klasyCell;
tabelaWariancji




        
        
        

        
        
        
        
        
        
        
