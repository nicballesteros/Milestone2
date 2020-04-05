% %Importing the data
product_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials
% product_data(2,:) = [];
product_data(2,:) = []; % gets rid of the column headers

enzymeA = product_data(:, 2:21);
enzymeB = product_data(:, 22:41);
enzymeC = product_data(:, 42:61);
enzymeD = product_data(:, 62:81);
enzymeE = product_data(:, 82:101);

time = product_data(:,1); %Times for each of the substrates transformations
time(1) = []; %get rid of the text above the time col

project_function(time, enzymeA);
% project_function(time, enzymeB);
% project_function(time, enzymeC);
% project_function(time, enzymeD);
% project_function(time, enzymeE);
