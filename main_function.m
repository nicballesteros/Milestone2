% %Importing the data
product_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials
product_data(2,:) = [];
product_data(1,:) = []; % gets rid of the headers
counter = 1;

time = product_data(:,1); %Times for each of the substrates transformations\
substate_data = 1 ./ product_data(:, 2:end);
initial_375A = substrate_data(:,1); % Initial Test of Enzyme A with initial concentration of 3.75 (uM)


initial_375A = rmmissing(initial_375A); %get rid of NaN values
%time = time(1:size(initial_375A), :); %make the time array the same size as the substrate_data

project_function(time(1:size(initial_375A), :), initial_375A);
