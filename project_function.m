function [Km,Vmax] = project_function(time,Initial_375,Initial_75,Initial_15,Initial_30,Initial_65,Initial_125,Initial_250,Initial_500,Initial_1000,Initial_2000,Duplicate_375,Duplicate_75,Duplicate_15,Duplicate_30,Duplicate_65,Duplicate_125,Duplicate_250,Duplicate_500,Duplicate_1000,Duplicate_2000)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
% This program runs analysis
%
% Function Call
%
%function [Km,Vmax] = project_function(time,Initial_375,Initial_75,Initial_15,Initial_30,Initial_65,Initial_125,Initial_250,Initial_500,Initial_1000,Initial_2000,Duplicate_375,Duplicate_75,Duplicate_15,Duplicate_30,Duplicate_65,Duplicate_125,Duplicate_250,Duplicate_500,Duplicate_1000,Duplicate_2000)
%
% Input Arguments
%
% time: Input the time column, s
% Initial_375: Input the substrate concentration column for the initial substrate
% concentration of 3.75, uM
% Initial_75: Input the substrate concentration column for the initial substrate
% concentration of 7.5, uM
% Initial_15: Input the substrate concentration column for the initial substrate
% concentration of 15, uM
% Initial_30: Input the substrate concentration column for the initial substrate
% concentration of 30, uM
% Initial_65: Input the substrate concentration column for the initial substrate
% concentration of 65, uM
% Initial_125: Input the substrate concentration column for the initial substrate
% concentration of 125, uM
% Initial_250: Input the substrate concentration column for the initial substrate
% concentration of 250, uM
% Initial_500: Input the substrate concentration column for the initial substrate
% concentration of 500, uM
% Initial_1000: Input the substrate concentration column for the initial substrate
% concentration of 1000, uM
% Initial_2000: Input the substrate concentration column for the initial substrate
% concentration of 2000, uM
% Duplicate_375: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 3.75, uM
% Duplicate_75: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 7.5, uM
% Duplicate_15: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 15, uM
% Duplicate_30: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 30, uM
% Duplicate_65: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 65, uM
% Duplicate_125: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 125, uM
% Duplicate_250: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 250, uM
% Duplicate_500: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 500, uM
% Duplicate_1000: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 1000, uM
% Duplicate_2000: Input the substrate concentration column for the duplicate test
% substrate initial concentration of 2000, uM
%
% Output Arguments
%
% Km: Outputs the calculated Km value for the enzyme
% Vmax: Outputs the calculated Vmax value for the enzyme
%
% Assignment Information
%   Assignment:     M02, Problem 
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
% Substrate_data = readmatrix('Data_nextGen_KEtesting_allresults.csv'); %All five of the enzymes substrate data with two trials
% time = Substrate_data(:,1); %Times for each of the substrates transformations
% 
% %Enzyme A orgnaization
% initial_375A = Substrate_data(:,2); % Initial Test of Enzyme A with initial concentration of 3.75 (uM)
% initial_75A = Substrate_data(:,3); % Initial Test of Enzyme A with initial concentration of 7.5 (uM)
% initial_15A = Substrate_data(:,4); % Initial Test of Enzyme A with initial concentration of 15 (uM)
% initial_30A = Substrate_data(:,5); % Initial Test of Enzyme A with initial concentration of 30 (uM)
% initial_65A = Substrate_data(:,6); % Initial Test of Enzyme A with initial concentration of 65 (uM)
% initial_125A = Substrate_data(:,7); % Initial Test of Enzyme A with initial concentration of 125 (uM)
% initial_250A = Substrate_data(:,8); % Initial Test of Enzyme A with initial concentration of 250 (uM)
% initial_500A = Substrate_data(:,9); % Initial Test of Enzyme A with initial concentration of 500 (uM)
% initial_1000A = Substrate_data(:,10); % Initial Test of Enzyme A with initial concentration of 1000 (uM)
% initial_2000A = Substrate_data(:,11); % Initial Test of Enzyme A with initial concentration of 2000 (uM)
% dup_375A = Substrate_data(:,12); % Duplicate Test of Enzyme A with initial concentration of 3.75 (uM)
% dup_75A = Substrate_data(:,13); % Duplicate Test of Enzyme A with initial concentration of 7.5 (uM)
% dup_15A = Substrate_data(:,14); % Duplicate Test of Enzyme A with initial concentration of 15 (uM)
% dup_30A = Substrate_data(:,15); % Duplicate Test of Enzyme A with initial concentration of 30 (uM)
% dup_65A = Substrate_data(:,16); % Duplicate Test of Enzyme A with initial concentration of 60 (uM)
% dup_125A = Substrate_data(:,17); % Duplicate Test of Enzyme A with initial concentration of 125 (uM)
% dup_250A = Substrate_data(:,18); % Duplicate Test of Enzyme A with initial concentration of 250 (uM)
% dup_500A = Substrate_data(:,19); % Duplicate Test of Enzyme A with initial concentration of 500 (uM)
% dup_1000A = Substrate_data(:,20); % Duplicate Test of Enzyme A with initial concentration of 1000 (uM)
% dup_2000A = Substrate_data(:,21); % Duplicate Test of Enzyme A with initial concentration of 2000 (uM)
% 
% %Enzyme B orgnaization
% initial_375B = Substrate_data(:,22); % Initial Test of Enzyme B with initial concentration of 3.75 (uM)
% initial_75B = Substrate_data(:,23); % Initial Test of Enzyme B with initial concentration of 7.5 (uM)
% initial_15B = Substrate_data(:,24); % Initial Test of Enzyme B with initial concentration of 15 (uM)
% initial_30B = Substrate_data(:,25); % Initial Test of Enzyme B with initial concentration of 30 (uM)
% initial_65B = Substrate_data(:,26); % Initial Test of Enzyme B with initial concentration of 65 (uM)
% initial_125B = Substrate_data(:,27); % Initial Test of Enzyme B with initial concentration of 125 (uM)
% initial_250B = Substrate_data(:,28); % Initial Test of Enzyme B with initial concentration of 250 (uM)
% initial_500B = Substrate_data(:,29); % Initial Test of Enzyme B with initial concentration of 500 (uM)
% initial_1000B = Substrate_data(:,30); % Initial Test of Enzyme B with initial concentration of 1000 (uM)
% initial_2000B = Substrate_data(:,31); % Initial Test of Enzyme B with initial concentration of 2000 (uM)
% dup_375B = Substrate_data(:,32); % Duplicate Test of Enzyme B with initial concentration of 3.75 (uM)
% dup_75B = Substrate_data(:,33); % Duplicate Test of Enzyme B with initial concentration of 7.5 (uM)
% dup_15B = Substrate_data(:,34); % Duplicate Test of Enzyme B with initial concentration of 15 (uM)
% dup_30B = Substrate_data(:,35); % Duplicate Test of Enzyme B with initial concentration of 30 (uM)
% dup_65B = Substrate_data(:,36); % Duplicate Test of Enzyme B with initial concentration of 60 (uM)
% dup_125B = Substrate_data(:,37); % Duplicate Test of Enzyme B with initial concentration of 125 (uM)
% dup_250B = Substrate_data(:,38); % Duplicate Test of Enzyme B with initial concentration of 250 (uM)
% dup_500B = Substrate_data(:,39); % Duplicate Test of Enzyme B with initial concentration of 500 (uM)
% dup_1000B = Substrate_data(:,40); % Duplicate Test of Enzyme B with initial concentration of 1000 (uM)
% dup_2000B = Substrate_data(:,41); % Duplicate Test of Enzyme B with initial concentration of 2000 (uM)
% 
% %Enzyme C orgnaization
% initial_375C = Substrate_data(:,42); % Initial Test of Enzyme C with initial concentration of 3.75 (uM)
% initial_75C = Substrate_data(:,43); % Initial Test of Enzyme C with initial concentration of 7.5 (uM)
% initial_15C = Substrate_data(:,44); % Initial Test of Enzyme C with initial concentration of 15 (uM)
% initial_30C = Substrate_data(:,45); % Initial Test of Enzyme C with initial concentration of 30 (uM)
% initial_65C = Substrate_data(:,46); % Initial Test of Enzyme C with initial concentration of 65 (uM)
% initial_125C = Substrate_data(:,47); % Initial Test of Enzyme C with initial concentration of 125 (uM)
% initial_250C = Substrate_data(:,48); % Initial Test of Enzyme C with initial concentration of 250 (uM)
% initial_500C = Substrate_data(:,49); % Initial Test of Enzyme C with initial concentration of 500 (uM)
% initial_1000C = Substrate_data(:,50); % Initial Test of Enzyme C with initial concentration of 1000 (uM)
% initial_2000C = Substrate_data(:,51); % Initial Test of Enzyme C with initial concentration of 2000 (uM)
% dup_375C = Substrate_data(:,52); % Duplicate Test of Enzyme C with initial concentration of 3.75 (uM)
% dup_75C = Substrate_data(:,53); % Duplicate Test of Enzyme C with initial concentration of 7.5 (uM)
% dup_15C = Substrate_data(:,54); % Duplicate Test of Enzyme C with initial concentration of 15 (uM)
% dup_30C = Substrate_data(:,55); % Duplicate Test of Enzyme C with initial concentration of 30 (uM)
% dup_65C = Substrate_data(:,56); % Duplicate Test of Enzyme C with initial concentration of 60 (uM)
% dup_125C = Substrate_data(:,57); % Duplicate Test of Enzyme C with initial concentration of 125 (uM)
% dup_250C = Substrate_data(:,58); % Duplicate Test of Enzyme C with initial concentration of 250 (uM)
% dup_500C = Substrate_data(:,59); % Duplicate Test of Enzyme C with initial concentration of 500 (uM)
% dup_1000C = Substrate_data(:,60); % Duplicate Test of Enzyme C with initial concentration of 1000 (uM)
% dup_2000C = Substrate_data(:,61); % Duplicate Test of Enzyme C with initial concentration of 2000 (uM)
% 
% %Enzyme D orgnaization
% initial_375D = Substrate_data(:,62); % Initial Test of Enzyme D with initial concentration of 3.75 (uM)
% initial_75D = Substrate_data(:,63); % Initial Test of Enzyme D with initial concentration of 7.5 (uM)
% initial_15D = Substrate_data(:,64); % Initial Test of Enzyme D with initial concentration of 15 (uM)
% initial_30D = Substrate_data(:,65); % Initial Test of Enzyme D with initial concentration of 30 (uM)
% initial_65D = Substrate_data(:,66); % Initial Test of Enzyme D with initial concentration of 65 (uM)
% initial_125D = Substrate_data(:,67); % Initial Test of Enzyme D with initial concentration of 125 (uM)
% initial_250D = Substrate_data(:,68); % Initial Test of Enzyme D with initial concentration of 250 (uM)
% initial_500D = Substrate_data(:,69); % Initial Test of Enzyme D with initial concentration of 500 (uM)
% initial_1000D = Substrate_data(:,70); % Initial Test of Enzyme D with initial concentration of 1000 (uM)
% initial_2000D = Substrate_data(:,71); % Initial Test of Enzyme D with initial concentration of 2000 (uM)
% dup_375D = Substrate_data(:,72); % Duplicate Test of Enzyme D with initial concentration of 3.75 (uM)
% dup_75D = Substrate_data(:,73); % Duplicate Test of Enzyme D with initial concentration of 7.5 (uM)
% dup_15D = Substrate_data(:,74); % Duplicate Test of Enzyme D with initial concentration of 15 (uM)
% dup_30D = Substrate_data(:,75); % Duplicate Test of Enzyme D with initial concentration of 30 (uM)
% dup_65D = Substrate_data(:,76); % Duplicate Test of Enzyme D with initial concentration of 60 (uM)
% dup_125D = Substrate_data(:,77); % Duplicate Test of Enzyme D with initial concentration of 125 (uM)
% dup_250D = Substrate_data(:,78); % Duplicate Test of Enzyme D with initial concentration of 250 (uM)
% dup_500D = Substrate_data(:,79); % Duplicate Test of Enzyme D with initial concentration of 500 (uM)
% dup_1000D = Substrate_data(:,80); % Duplicate Test of Enzyme D with initial concentration of 1000 (uM)
% dup_2000D = Substrate_data(:,81); % Duplicate Test of Enzyme D with initial concentration of 2000 (uM)
% 
% %Enzyme E orgnaization
% initial_375E = Substrate_data(:,82); % Initial Test of Enzyme E with initial concentration of 3.75 (uM)
% initial_75E = Substrate_data(:,83); % Initial Test of Enzyme E with initial concentration of 7.5 (uM)
% initial_15E = Substrate_data(:,84); % Initial Test of Enzyme E with initial concentration of 15 (uM)
% initial_30E = Substrate_data(:,85); % Initial Test of Enzyme E with initial concentration of 30 (uM)
% initial_65E = Substrate_data(:,86); % Initial Test of Enzyme E with initial concentration of 65 (uM)
% initial_125E = Substrate_data(:,87); % Initial Test of Enzyme E with initial concentration of 125 (uM)
% initial_250E = Substrate_data(:,88); % Initial Test of Enzyme E with initial concentration of 250 (uM)
% initial_500E = Substrate_data(:,89); % Initial Test of Enzyme E with initial concentration of 500 (uM)
% initial_1000E = Substrate_data(:,90); % Initial Test of Enzyme E with initial concentration of 1000 (uM)
% initial_2000E = Substrate_data(:,91); % Initial Test of Enzyme E with initial concentration of 2000 (uM)
% dup_375E = Substrate_data(:,92); % Duplicate Test of Enzyme E with initial concentration of 3.75 (uM)
% dup_75E = Substrate_data(:,93); % Duplicate Test of Enzyme E with initial concentration of 7.5 (uM)
% dup_15E = Substrate_data(:,94); % Duplicate Test of Enzyme E with initial concentration of 15 (uM)
% dup_30E = Substrate_data(:,95); % Duplicate Test of Enzyme E with initial concentration of 30 (uM)
% dup_65E = Substrate_data(:,96); % Duplicate Test of Enzyme E with initial concentration of 60 (uM)
% dup_125E = Substrate_data(:,97); % Duplicate Test of Enzyme E with initial concentration of 125 (uM)
% dup_250E = Substrate_data(:,98); % Duplicate Test of Enzyme E with initial concentration of 250 (uM)
% dup_500E = Substrate_data(:,99); % Duplicate Test of Enzyme E with initial concentration of 500 (uM)
% dup_1000E = Substrate_data(:,100); % Duplicate Test of Enzyme E with initial concentration of 1000 (uM)
% dup_2000E = Substrate_data(:,101); % Duplicate Test of Enzyme E with initial concentration of 2000 (uM)

%% ____________________
%% CALCULATIONS


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

initial_375A = Substrate_data(:,2); % Initial Test of Enzyme A with initial concentration of 3.75 (uM)
initial_75A = Substrate_data(:,3); % Initial Test of Enzyme A with initial concentration of 7.5 (uM)
initial_15A = Substrate_data(:,4); % Initial Test of Enzyme A with initial concentration of 15 (uM)
initial_30A = Substrate_data(:,5); % Initial Test of Enzyme A with initial concentration of 30 (uM)
initial_65A = Substrate_data(:,6); % Initial Test of Enzyme A with initial concentration of 65 (uM)
initial_125A = Substrate_data(:,7); % Initial Test of Enzyme A with initial concentration of 125 (uM)
initial_250A = Substrate_data(:,8); % Initial Test of Enzyme A with initial concentration of 250 (uM)
initial_500A = Substrate_data(:,9); % Initial Test of Enzyme A with initial concentration of 500 (uM)
initial_1000A = Substrate_data(:,10); % Initial Test of Enzyme A with initial concentration of 1000 (uM)
initial_2000A = Substrate_data(:,11);

figure(1); % initial tests of enzyme A

subplot(2, 5, 1);
plot(time, initial_375A);

subplot(2, 5, 2);
plot(time, initial_75A);

subplot(2, 5, 3);
plot(time, initial_15A);

subplot(2, 5, 4);
plot(time, initial_30A);

subplot(2, 5, 5);
plot(time, initial_65A);

subplot(2, 5, 6);
plot(time, initial_125A);

subplot(2, 5, 7);
plot(time, initial_250A);

subplot(2, 5, 8);
plot(time, initial_500A);

subplot(2, 5, 9);
plot(time, initial_1000A);

subplot(2, 5, 10);
plot(time, initial_1000A);

figure(2); % duplicate tests of enzyme A

subplot(2, 5, 1);
plot(time, dup_375A);

subplot(2, 5, 2);
plot(time, dup_75A);

subplot(2, 5, 3);
plot(time, dup_15A);

subplot(2, 5, 4);
plot(time, dup_30A);

subplot(2, 5, 5);
plot(time, dup_65A);

subplot(2, 5, 6);
plot(time, dup_125A);

subplot(2, 5, 7);
plot(time, dup_250A);

subplot(2, 5, 8);
plot(time, dup_500A);

subplot(2, 5, 9);
plot(time, dup_1000A);

subplot(2, 5, 10);
plot(time, dup_1000A);

figure(3); % inital tests of enzyme B

subplot(2, 5, 1);
plot(time, initial_375B);

subplot(2, 5, 2);
plot(time, initial_75B);

subplot(2, 5, 3);
plot(time, initial_15B);

subplot(2, 5, 4);
plot(time, initial_30B);

subplot(2, 5, 5);
plot(time, initial_65B);

subplot(2, 5, 6);
plot(time, initial_125B);

subplot(2, 5, 7);
plot(time, initial_250B);

subplot(2, 5, 8);
plot(time, initial_500B);

subplot(2, 5, 9);
plot(time, initial_1000B);

subplot(2, 5, 10);
plot(time, initial_1000B);

figure(4); % duplicate tests of enzyme B

subplot(2, 5, 1);
plot(time, dup_375B);

subplot(2, 5, 2);
plot(time, dup_75B);

subplot(2, 5, 3);
plot(time, dup_15B);

subplot(2, 5, 4);
plot(time, dup_30B);

subplot(2, 5, 5);
plot(time, dup_65B);

subplot(2, 5, 6);
plot(time, dup_125B);

subplot(2, 5, 7);
plot(time, dup_250B);

subplot(2, 5, 8);
plot(time, dup_500B);

subplot(2, 5, 9);
plot(time, dup_1000B);

subplot(2, 5, 10);
plot(time, dup_1000B);

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
