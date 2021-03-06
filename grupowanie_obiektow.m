% Grupowanie obiektow

clear;

load projekt16.mat
data = t;

% Przygotowanie atrybut�w do grupowania
data_do_grup = array2table(data{:,1:11});
datX = data(:,1:end-1).Properties.VariableNames;
data_do_grup.Properties.VariableNames = datX;


%%  Grupowanie metod� k-�rednich

% Metoda k-�rednich dla dw�ch atrybut�w
figure
odl=zeros(11,1);
dif=zeros(11,1);
for i=1:11
    [klasy, centr, sumaod] = kmeans([data_do_grup.dat7 data_do_grup.dat8],i,'Replicates',15);
    
    subplot(3,4,i); % Wykresy dla r�nej ilo�ci klas
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,klasy)
    hold on;
    scatter(centr(:,1),centr(:,2),30,[1 0 0],'*')
    hold off
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[])
    xlabel('dat7')
    ylabel('dat8')
    
    odl(i) = sum(sumaod)./length(data_do_grup.dat1); % �rednia odleg�o�� dla wszystkich obiekt�w
    if (i>1) 
        dif(i-1) = (odl(i) - odl(i-1)); % Obliczanie przyrostu �redniej odleg�o�ci
    end
    if (i==4)
        disp('Grupowanie k-�rednich do 4 klas, 2 atrybuty')
        ksr2 = crosstab(data.klasa,klasy) % Crosstab dla 4 klas
    end
end



% Metoda k-�rednich dla trzech atrybut�w
figure
odl3=zeros(11,1);
dif3=zeros(11,1);
for i=1:11
    [klasy3, centr3, sumaod3] = kmeans([data_do_grup.dat7, data_do_grup.dat8, data_do_grup.dat4],i,'Replicates',15);
    
    subplot(3,4,i); % Wykresy dla r�nej ilo�ci klas
    scatter3(data_do_grup.dat7,data_do_grup.dat8,data_do_grup.dat4,10,klasy3)
    hold on;
    scatter3(centr3(:,1),centr3(:,2),centr3(:,3),30,[1 0 0],'*')
    hold off
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[],'ztick',[])
    xlabel('dat7')
    ylabel('dat8')
    zlabel('dat4')
    
    odl3(i) = sum(sumaod3)./length(data_do_grup.dat1); % �rednia odleg�o�� dla wszystkich obiekt�w
    if (i>1)
        dif3(i-1) = (odl3(i) - odl3(i-1)); % Obliczanie przyrostu �redniej odleg�o�ci 
    end
    if (i==4)
        disp('Grupowanie k-�rednich do 4 klas, 3 atrybuty')
        ksr3 = crosstab(data.klasa,klasy3) % Crosstab dla 4 klas
    end
end
figure 
subplot(1,2,1); % Wykres �redniej odleg�o�ci i jej przyrostu
plot(odl);
hold on 
plot(odl3);
hold off
title('�rednia odleg�o��')
legend('2 dane','3 dane');
xlabel('Liczba klas');
ylabel('�rednia odleg�o��');
subplot(1,2,2);
plot(dif);
hold on 
plot(dif3);
hold off
title('Przyrost odleg�o��i')
legend('2 dane','3 dane');
xlabel('Liczba klas');
ylabel('Przyrost');


%%  Grupowanie aglomeracyjne 

% Grupowanie dla dw�ch atrybut�w
d = pdist([data_do_grup.dat7 data_do_grup.dat8]);
Z = linkage(d,'average');
figure
ilowkl=nan(11,11);
for i=1:11
    c = cluster(Z,'maxclust',i);
    
    subplot(3,4,i); % Wykresy dla r�nej ilo�ci klas
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,c)
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[])
    xlabel('dat7')
    ylabel('dat8')
    for j=1:i 
        ilowkl(i,j) = length(c(c==j)); % Macierz ilo�ci elemet�w w klasie od liczby klas
    end
    if (i==4)
        disp('Grupowanie aglomeracyjne do 4 klas, 2 atrybuty')
        algom2 = crosstab(data.klasa,c) % Crosstab dla 4 klas
    end
end

% Grupowanie dla trzech atrybut�w
d3 = pdist([data_do_grup.dat7 data_do_grup.dat8 data_do_grup.dat4]);
Z3 = linkage(d3,'average');
figure
ilowkl3=nan(11,11);
for i=1:11
    c3 = cluster(Z3,'maxclust',i);
    
    subplot(3,4,i); % Wykresy dla r�nej ilo�ci klas
    scatter3(data_do_grup.dat7,data_do_grup.dat8,data_do_grup.dat4,10,c3)
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[],'ztick',[])
    xlabel('dat7')
    ylabel('dat8')
    zlabel('dat4')
    for j=1:i 
        ilowkl3(i,j) = length(c3(c3==j)); % Macierz ilo�ci elemet�w w klasie od liczby klas
    end
    if (i==4)
        disp('Grupowanie aglomeracyjne do 4 klas, 3 atrybuty')
        algom3 = crosstab(data.klasa,c3) % Crosstab dla 4 klas
    end
end
 
 figure % Wykres iloe�ci element�w w najmniej licznej klasie
 plot(nanmin(ilowkl,[],2))
 hold on 
 plot(nanmin(ilowkl3,[],2))
 hold off
 title('Liczba element�w w najmniej licznej klasie')
 legend('2 dane','3 dane');
 xlabel('Liczba klas')
 ylabel('Liczba element�w')