% Dane ilosciowe

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);

all = height(data);
Ilosc_wszystkich_obiektow = all
klasa_1 = height(data(data.klasa==1,1));
klasa_2 = height(data(data.klasa==2,1));
klasa_3 = height(data(data.klasa==3,1));
klasa_4 = height(data(data.klasa==4,1));

dane_ilosciowe = [ klasa_1, klasa_2, klasa_3 klasa_4 ];
figure
pie(dane_ilosciowe);
title('Ilosc obiektow z podzialem na klasy')

lgd = legend('Klasa 1','Klasa 2','Klasa 3','Klasa 4');
lgd.Position = [ 0 0.1 0.3 0 ];

