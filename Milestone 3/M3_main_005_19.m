%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
%   This program calls project_function for enzyme data
%
% Assignment Information
%   Assignment:     M03, Problem 1
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

%Importing and organizing the data
Data = readmatrix('Data_PGOX50_enzyme.csv'); %imports the PGOX50 data
Data(1,:) = []; %Gets rid of collumn headers
Data(2:3,:) = []; %Gets rid of more collumn headers
time = Data(:,1); %Creates the time matrix
time(1) = (0); %Gets rid of first NAN value
enzymeData = Data(:,2:11); %creates a matrix of the enzyme data


%% ____________________
%% CALCULATIONS

%Calling the first code to get our parameters
[Km,Vmax,V_initials] = M3_Algorithm_005_19(time,enzymeData)

%Calling the second code to get the error data
M3_MM_PGOX50_005_19(enzymeData,V_initials,Vmax,Km)
