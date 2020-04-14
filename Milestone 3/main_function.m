%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
%   This program calls project_function for each enzyme's data
%
% Assignment Information
%   Assignment:     M02, Problem 1
%   Team member:    Nic Ballesteros, nballes@purdue.edu
%   Team member:    Annabelle Johnson, john245@purdue.edu
%   Team member:    Alan Camacho, @purdue.edu
%   Team ID:        005-19
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

% %Importing the data
product_data = readmatrix('../Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials

product_data(2,:) = []; % gets rid of the column headers

for i = 1:5
  enzyme(i).data = product_data(:, (i * 20 - 18):(i * 20 + 1));
end;

time = product_data(:,1); %Times for each of the substrates transformations
time(1) = []; %get rid of the text above the time col

enzyme_parameters = zeros(5, 2); %data for each enzyme storing Vmax and Km
%the first col will be Km and the second column will be Vmax

%% ____________________
%% CALCULATIONS

for i = 1:5
  enzyme_parameters(i,:) = M2_Algorithm_005_19(time, enzyme(i).data);
end;
