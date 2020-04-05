% %Importing the data
Substrate_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials
time = Substrate_data(:,1); %Times for each of the substrates transformations\
initial_375A = Substrate_data(:,2); % Initial Test of Enzyme A with initial concentration of 3.75 (uM)

project_function(time, initial_375A);
