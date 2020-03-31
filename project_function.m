replace this text with your function definition line
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
replace this text with your program decription as a comment
%
% Function Call
replace this text with a comment that states the function call
%
% Input Arguments
replace this text with a commented list of the input arguments
%
% Output Arguments
replace this text with a commented list of the output arguments
%
% Assignment Information
%   Assignment:     M##, Problem #
%   Team member:    Name, login@purdue.edu [repeat for each person]
%   Team ID:        ###-##
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

%Importing the data
Substrate_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials
time = Substrate_data(:,1); %Times for each of the substrates transformations

%Enzyme A orgnaization
initial_375A = Substrate_data(:,2); % Initial Test of Enzyme A with initial concentration of 3.75 (uM)
initial_75A = Substrate_data(:,3); % Initial Test of Enzyme A with initial concentration of 7.5 (uM)
initial_15A = Substrate_data(:,4); % Initial Test of Enzyme A with initial concentration of 15 (uM)
initial_30A = Substrate_data(:,5); % Initial Test of Enzyme A with initial concentration of 30 (uM)
initial_65A = Substrate_data(:,6); % Initial Test of Enzyme A with initial concentration of 65 (uM)
initial_125A = Substrate_data(:,7); % Initial Test of Enzyme A with initial concentration of 125 (uM)
initial_250A = Substrate_data(:,8); % Initial Test of Enzyme A with initial concentration of 250 (uM)
initial_500A = Substrate_data(:,9); % Initial Test of Enzyme A with initial concentration of 500 (uM)
initial_1000A = Substrate_data(:,10); % Initial Test of Enzyme A with initial concentration of 1000 (uM)
initial_2000A = Substrate_data(:,11); % Initial Test of Enzyme A with initial concentration of 2000 (uM)
dup_375A = Substrate_data(:,12); % Duplicate Test of Enzyme A with initial concentration of 3.75 (uM)
dup_75A = Substrate_data(:,13); % Duplicate Test of Enzyme A with initial concentration of 7.5 (uM)
dup_15A = Substrate_data(:,14); % Duplicate Test of Enzyme A with initial concentration of 15 (uM)
dup_30A = Substrate_data(:,15); % Duplicate Test of Enzyme A with initial concentration of 30 (uM)
dup_65A = Substrate_data(:,16); % Duplicate Test of Enzyme A with initial concentration of 60 (uM)
dup_125A = Substrate_data(:,17); % Duplicate Test of Enzyme A with initial concentration of 125 (uM)
dup_250A = Substrate_data(:,18); % Duplicate Test of Enzyme A with initial concentration of 250 (uM)
dup_500A = Substrate_data(:,19); % Duplicate Test of Enzyme A with initial concentration of 500 (uM)
dup_1000A = Substrate_data(:,20); % Duplicate Test of Enzyme A with initial concentration of 1000 (uM)
dup_2000A = Substrate_data(:,21); % Duplicate Test of Enzyme A with initial concentration of 2000 (uM)

%Enzyme B orgnaization
initial_375B = Substrate_data(:,22); % Initial Test of Enzyme B with initial concentration of 3.75 (uM)
initial_75B = Substrate_data(:,23); % Initial Test of Enzyme B with initial concentration of 7.5 (uM)
initial_15B = Substrate_data(:,24); % Initial Test of Enzyme B with initial concentration of 15 (uM)
initial_30B = Substrate_data(:,25); % Initial Test of Enzyme B with initial concentration of 30 (uM)
initial_65B = Substrate_data(:,26); % Initial Test of Enzyme B with initial concentration of 65 (uM)
initial_125B = Substrate_data(:,27); % Initial Test of Enzyme B with initial concentration of 125 (uM)
initial_250B = Substrate_data(:,28); % Initial Test of Enzyme B with initial concentration of 250 (uM)
initial_500B = Substrate_data(:,29); % Initial Test of Enzyme B with initial concentration of 500 (uM)
initial_1000B = Substrate_data(:,30); % Initial Test of Enzyme B with initial concentration of 1000 (uM)
initial_2000B = Substrate_data(:,31); % Initial Test of Enzyme B with initial concentration of 2000 (uM)
dup_375B = Substrate_data(:,32); % Duplicate Test of Enzyme B with initial concentration of 3.75 (uM)
dup_75B = Substrate_data(:,33); % Duplicate Test of Enzyme B with initial concentration of 7.5 (uM)
dup_15B = Substrate_data(:,34); % Duplicate Test of Enzyme B with initial concentration of 15 (uM)
dup_30B = Substrate_data(:,35); % Duplicate Test of Enzyme B with initial concentration of 30 (uM)
dup_65B = Substrate_data(:,36); % Duplicate Test of Enzyme B with initial concentration of 60 (uM)
dup_125B = Substrate_data(:,37); % Duplicate Test of Enzyme B with initial concentration of 125 (uM)
dup_250B = Substrate_data(:,38); % Duplicate Test of Enzyme B with initial concentration of 250 (uM)
dup_500B = Substrate_data(:,39); % Duplicate Test of Enzyme B with initial concentration of 500 (uM)
dup_1000B = Substrate_data(:,40); % Duplicate Test of Enzyme B with initial concentration of 1000 (uM)
dup_2000B = Substrate_data(:,41); % Duplicate Test of Enzyme B with initial concentration of 2000 (uM)

%% ____________________
%% CALCULATIONS


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS


%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



