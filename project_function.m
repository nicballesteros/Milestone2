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
Substrate_data = readmatrix('Data_nextGen_KEtesting_allresults.csv');
time = Substrate_data(:,1);

%Enzyme A orgnaization
initial_375A = Substrate_data(:,2);
initial_75A = Substrate_data(:,3);
initial_15A = Substrate_data(:,4);
initial_30A = Substrate_data(:,5);
initial_65A = Substrate_data(:,6);
initial_125A = Substrate_data(:,7);
initial_250A = Substrate_data(:,8);
initial_500A = Substrate_data(:,9);
initial_1000A = Substrate_data(:,10);
initial_2000A = Substrate_data(:,11);
dup_375A = Substrate_data(:,12);
dup_75A = Substrate_data(:,13);
dup_15A = Substrate_data(:,14);
dup_30A = Substrate_data(:,15);
dup_65A = Substrate_data(:,16);
dup_125A = Substrate_data(:,17);
dup_250A = Substrate_data(:,18);
dup_500A = Substrate_data(:,19);
dup_1000A = Substrate_data(:,20);
dup_2000A = Substrate_data(:,21);

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



