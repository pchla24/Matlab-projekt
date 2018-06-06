% Miary

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);

datX = data(:,1:end-1).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);

klasa1 = data_num(data_num(:,12)==1,:);
klasa2 = data_num(data_num(:,12)==2,:);
klasa3 = data_num(data_num(:,12)==3,:);
klasa4 = data_num(data_num(:,12)==4,:);

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




        
        
        

        
        
        
        
        
        
        
