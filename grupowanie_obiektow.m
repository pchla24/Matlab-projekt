% Grupowanie obiektow

clear;

load projekt16.mat
data = t;

% Przygotowanie danych do grupowania
data_do_grup = array2table(data{:,1:11});
datX = data(:,1:end-1).Properties.VariableNames;
data_do_grup.Properties.VariableNames = datX;

% data_do_grup = data{:,1:11};


% klasy = kmeans([data_do_grup.dat4 data_do_grup.dat5 data_do_grup.dat6 ...
%     data_do_grup.dat8 data_do_grup.dat7],4,'Replicates',10);

klasy = kmeans([data_do_grup.dat7 data_do_grup.dat8],4,'Replicates',10);
test1 = crosstab(klasy,data.klasa)

% c = clusterdata(data_do_grup,'maxclust',4,'linkage','complete');
% test1 = crosstab(c,data.klasa);







