function [Km,Vmax] = project_function(time, enzymeData);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
%   This program calculates the Michaelis-Menten parameters, Km and Vmax, for
% a given substate's data.
%
% Function Call
%
% [Km, Vmax] = project_function(time, substate_data);
%
% Input Arguments
%
%   time: the time variable for each given data set.
%   enzymeData: First row is the inital concentrations of the substrates for
% each given test. The rest of the rows are the data points for each test; each
% test in a serparate column.
%
% Output Arguments
%
% Km: Outputs the estimated Km value for the enzyme
% Vmax: Outputs the estimated Vmax value for the enzyme
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

% Each test is stored in the following manner
% to get the data for a test the following command is used :
%     test(test#).data;
% to get the duplicate data for a test the following command is used:
%     test(test#).dupData;
% to get the concentation of the test use:
%     test(test#).concentation;

for i = 1:10
  test(i).data = smoothdata(rmmissing(enzymeData(2:end, i))); %get all not NaN values in each col for each test
  test(i).dataSize = size(test(i).data);
  test(i).time = time(1:test(i).dataSize(1));
  %store the duplicate data
  test(i).dupData = smoothdata(rmmissing(enzymeData(2:end, i + 10))); %get all not NaN values in each col for each duplicate test
  test(i).dupDataSize = size(test(i).dupData);
  test(i).dupTime = time(1:test(i).dupDataSize(1));
  %store the concentation
  test(i).concentation = enzymeData(1, i);
end;

mmData = zeros(20, 2); %Michaelis-Menten data

%% ____________________
%% CALCULATIONS

for i = 1:10
  %find the inital slope of each test
  test(i).v0 = (test(i).data(2) - test(i).data(1)) / (test(i).time(2) - test(i).time(1));
  %find the inital slope of each duplicate test
  test(i).dupv0 = (test(i).dupData(2) - test(1).dupData(1)) / (test(i).dupTime(2) - test(i).dupTime(1));
  %store the values to easily plot the Michaelis-Menten data
  mmData(2 * i - 1, 1) = test(i).concentation;
  mmData(2 * i, 1) = test(i).concentation;

  mmData(2 * i - 1, 2) = test(i).v0;
  mmData(2 * i, 2) = test(i).dupv0;
end;

%implementing Hanes-Woolf Linearization

disp(mmData);

plot(mmData(:,1), mmData(:, 2));

% Y = y / v0;
%
% X = enzymeData
% figure(1);
% plot(X,Y, 'ro');
% hold on;
%
% Xline = mean(X)
% Yline = mean(Y)
% XYline = mean(X .* Y)
%
% a = (Xline * Yline - XYline) / (Xline ^ 2 - mean(X .^ 2))
% b = Yline - a * Xline
%
% fx = X * a + b;
%
% plot(X, fx, 'b-');
%
% Vmax = 1 / a
% Km = b / a
%
% mme = (Vmax * enzymeData) / (Km + enzymeData);%Michaelis-Menten Equation


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

% figure(2);
%
%
% figure(3);
% plot(time, enzymeData, 'k.');
%plot(time, mme, 'r-');

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
