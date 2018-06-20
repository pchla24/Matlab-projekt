% Grupowanie obiektow

clear;

load projekt16.mat
data = t;

% Przygotowanie danych do grupowania
data_do_grup = array2table(data{:,1:11});
datX = data(:,1:end-1).Properties.VariableNames;
data_do_grup.Properties.VariableNames = datX;


%%  Grupowanie metod¹ k-œrednich

% Metoda k-œrednich dla dwóch danych
figure
odl=zeros(11,1);
dif=zeros(11,1);
for i=1:11
    [klasy, centr, sumaod] = kmeans([data_do_grup.dat7 data_do_grup.dat8],i,'Replicates',15);
    
    subplot(3,4,i);
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,klasy)
    hold on;
    scatter(centr(:,1),centr(:,2),30,[1 0 0],'*')
    hold off
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[])
    xlabel('dat7')
    ylabel('dat8')
    
    odl(i) = sum(sumaod)./length(data_do_grup.dat1);
    if (i>1) 
        dif(i-1) = (odl(i) - odl(i-1));
    end
end

% Metoda k-œrednich dla trzech danych
figure
odl3=zeros(11,1);
dif3=zeros(11,1);
for i=1:11
    [klasy3, centr3, sumaod3] = kmeans([data_do_grup.dat7, data_do_grup.dat8, data_do_grup.dat4],i,'Replicates',15);
    
    subplot(3,4,i);
    scatter3(data_do_grup.dat7,data_do_grup.dat8,data_do_grup.dat4,10,klasy3)
    hold on;
    scatter3(centr3(:,1),centr3(:,2),centr3(:,3),30,[1 0 0],'*')
    hold off
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[],'ztick',[])
    xlabel('dat7')
    ylabel('dat8')
    zlabel('dat4')
    
    odl3(i) = sum(sumaod3)./length(data_do_grup.dat1);
    if (i>1)
        dif3(i-1) = (odl3(i) - odl3(i-1)); 
    end
end
figure
subplot(1,2,1);
plot(odl);
hold on 
plot(odl3);
hold off
title('Œrednia odleg³oœæ punktów od centroidów ich klasy')
legend('2 dane','3 dane');
xlabel('Liczba klas');
ylabel('Œrednia odleg³oœæ');
subplot(1,2,2);
plot(dif);
hold on 
plot(dif3);
hold off
title('Przyrost œredniej odleg³oœæi punktów od centroidów ich klasy')
legend('2 dane','3 dane');
xlabel('Liczba klas');
ylabel('Przyrost');

% Metoda k-œrednich ze wszystkich danych
figure
for i=1:11
    [klasyw, centraw] = kmeans([data_do_grup.dat1 data_do_grup.dat2 data_do_grup.dat3 data_do_grup.dat4 data_do_grup.dat5 data_do_grup.dat7 data_do_grup.dat8 data_do_grup.dat9 data_do_grup.dat10 data_do_grup.dat11],i,'Replicates',15);  
    
    subplot(3,4,i);
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,klasyw)  
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[])
    xlabel('dat7')
    ylabel('dat8')
end

%%  Grupowanie aglomeracyjne 

d = pdist([data_do_grup.dat7 data_do_grup.dat8]);
Z = linkage(d,'average');
figure
ilowkl=nan(11,11);
for i=1:11
    c = cluster(Z,'maxclust',i);
    subplot(3,4,i);
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,c)
    title(['Liczba klas: ' num2str(i)])
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[])
    xlabel('dat7')
    ylabel('dat8')
    for j=1:i 
        ilowkl(i,j) = length(c(c==j));
    end
end

d3 = pdist([data_do_grup.dat7 data_do_grup.dat8 data_do_grup.dat4]);
Z3 = linkage(d3,'average');
figure
ilowkl3=nan(11,11);
for i=1:11
    c3 = cluster(Z3,'maxclust',i);
    
    subplot(3,4,i);
    scatter3(data_do_grup.dat7,data_do_grup.dat8,data_do_grup.dat4,10,c3)
    title(['Liczba klas: ' num2str(i)])
    set(gca,'xtick',[],'ytick',[],'ztick',[])
    xlabel('dat7')
    ylabel('dat8')
    zlabel('dat4')
    for j=1:i 
        ilowkl3(i,j) = length(c3(c3==j));
    end
end
 ilowkl3
 figure
 plot(nanmin(ilowkl,[],2))
 hold on 
 plot(nanmin(ilowkl3,[],2))
 hold off
 title('Liczba elementów w najmniej licznej klasie')
 legend('2 dane','3 dane');
 xlabel('Liczba klas')
 ylabel('Liczba elementów')