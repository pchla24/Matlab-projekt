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

% Srednie ------------------------------
Srednie = zeros(4,11);

for i=1:11
    Srednie(1,i) = mean(klasa1(:,i));
end
for i=1:11
    Srednie(2,i) = mean(klasa2(:,i));
end
for i=1:11
    Srednie(3,i) = mean(klasa3(:,i));
end
for i=1:11
    Srednie(4,i) = mean(klasa4(:,i));
end

        
        
        
        
        
        
        
