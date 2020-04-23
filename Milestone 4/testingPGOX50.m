%Importing and organizing the data
Data = readmatrix('../Milestone 3/Data_PGOX50_enzyme.csv'); %imports the PGOX50 data
Data(1,:) = []; %Gets rid of collumn headers
Data(2:3,:) = []; %Gets rid of more collumn headers
time = Data(:,1); %Creates the time matrix
time(1) = (0); %Gets rid of first NAN value
enzymeData = Data(:,2:11); %creates a matrix of the enzyme data


%% ____________________
%% CALCULATIONS

%Calling the first code to get our parameters
[Km,Vmax,V_initials] = M4_Algorithm_005_19(time,enzymeData);

%Calling the second code to get the error data
% M4_Algorithm_005_19(enzymeData,V_initials,Vmax,Km);
