% Miary

clear;

load projekt16.mat
data = t;
data_cell = table2cell(t);
data_num = cell2mat(data_cell);

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

klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});

figure
subplot(3,4,1)
bar(klasy,Srednie(:,1));
title('dat1');
ylabel('Wartosc srednia')
subplot(3,4,2)
bar(klasy,Srednie(:,2));
title('dat2');
ylabel('Wartosc srednia')
subplot(3,4,3)
bar(klasy,Srednie(:,3));
title('dat3');
ylabel('Wartosc srednia')
subplot(3,4,4)
bar(klasy,Srednie(:,4));
title('dat4');
ylabel('Wartosc srednia')
subplot(3,4,5)
bar(klasy,Srednie(:,5));
title('dat5');
ylabel('Wartosc srednia')
subplot(3,4,6)
bar(klasy,Srednie(:,6));
title('dat6');
ylabel('Wartosc srednia')
subplot(3,4,7)
bar(klasy,Srednie(:,7));
title('dat7');
ylabel('Wartosc srednia')
subplot(3,4,8)
bar(klasy,Srednie(:,8));
title('dat8');
ylabel('Wartosc srednia')
subplot(3,4,9)
bar(klasy,Srednie(:,9));
title('dat9');
ylabel('Wartosc srednia')
subplot(3,4,10)
bar(klasy,Srednie(:,10));
title('dat10');
ylabel('Wartosc srednia')
subplot(3,4,11)
bar(klasy,Srednie(:,11));
title('dat11');
ylabel('Wartosc srednia')






        
        
        

        
        
        
        
        
        
        
