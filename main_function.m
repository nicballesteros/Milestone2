% %Importing the data
Substrate_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials
Substrate_data(2,:) = [];
Substrate_data(1,:) = []; % gets rid of the headers
counter = 1;

time = Substrate_data(:,1); %Times for each of the substrates transformations\
initial_375A = Substrate_data(:,2); % Initial Test of Enzyme A with initial concentration of 3.75 (uM)


initial_375A = rmmissing(initial_375A); %get rid of NaN values
%time = time(1:size(initial_375A), :); %make the time array the same size as the substrate_data

project_function(time(1:size(initial_375A), :), initial_375A);
