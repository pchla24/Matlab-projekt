% Grupowanie obiektow

clear;

load projekt16.mat
data = t;

% Przygotowanie danych do grupowania
data_do_grup = array2table(data{:,1:11});
datX = data(:,1:end-1).Properties.VariableNames;
data_do_grup.Properties.VariableNames = datX;

%%  Grupowanie metod¹ k-œrednich

for i=1:11
    [klasy, centr, sumaod] = kmeans([data_do_grup.dat7 data_do_grup.dat8],i,'Replicates',15);
    subplot(3,4,i);
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,klasy)
    
    hold on;
    scatter(centr(:,1),centr(:,2),30,[1 0 0],'*')
    hold off
    title(['klas' num2str(i)])
    
    odl(i) = sum(sumaod)/length(data_do_grup.dat7);
    if (i>1) dif(i-1) = (odl(i) - odl(i-1))/odl(i-1); end
end
figure
subplot(1,2,1);
plot(odl);
title('Œrednia odleg³oœæ dla klasy')
subplot(1,2,2);
plot(dif);
title('Wzglêdny przyrost odleg³oœæi')


for i=1:11
     [klasya, centra, sumaoda] = kmeans([data_do_grup.dat1 data_do_grup.dat2 data_do_grup.dat3 data_do_grup.dat4 data_do_grup.dat5 
        data_do_grup.dat7 data_do_grup.dat8 data_do_grup.dat9 data_do_grup.dat10 data_do_grup.dat11],i,'Replicates',15);  
    odla(i) = sum(sumaoda)/length(data_do_grup.dat1);
    if (i>1) difa(i-1) = (odla(i) - odla(i-1))/odla(i-1); end
end
figure
subplot(1,2,1);
plot(odla);
title('Œrednia odleg³oœæ dla klasy')
subplot(1,2,2);
plot(difa);
title('Wzglêdny przyrost odleg³oœci')

%%  Grupowanie aglomeracyjne 

figure
scatter(data_do_grup.dat7,data_do_grup.dat8,5)

d = pdist([data_do_grup.dat7 data_do_grup.dat8]);
Z = linkage(d,'average');
for i=1:11
    c = cluster(Z,'maxclust',i);
    subplot(3,4,i);
    scatter(data_do_grup.dat7,data_do_grup.dat8,10,c)
    avg=zeros(1);
    for j=1:i 
        avg(j,1) = mean(data_do_grup{c==j,7});
        avg(j,2) = mean(data_do_grup{c==j,8});
    end
    hold on 
    scatter( avg(:,1),avg(:,2),10,[1 0 0],'*')
    hold off
    
end


