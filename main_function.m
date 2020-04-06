% %Importing the data
product_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials

product_data(2,:) = []; % gets rid of the column headers

for i = 1:5
  enzyme(i).data = product_data(:, (i * 20 - 18):(i * 20 + 1));
end;

time = product_data(:,1); %Times for each of the substrates transformations
time(1) = []; %get rid of the text above the time col

for i = 1:5
  project_function(time, enzyme(i).data);
end;
