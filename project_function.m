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

for i = 1:10
  test(i).data = rmmissing(enzymeData(2:end, i)); %get all not NaN values in each col for each test
  test(i).dupData = rmmissing(enzymeData(2:end, i + 10)); %get all not NaN values in each col for each duplicate test
  test(i).concentation = enzymeData(1, i);
end;

size(test(1).data)

%slice up the enzyme data

% test1 = enzymeData(2:end, 1);
% test2 = enzymeData(2:end, 2);
% test3 = enzymeData(2:end, 3);
% test4 = enzymeData(2:end, 4);
% test5 = enzymeData(2:end, 5);
% test6 = enzymeData(2:end, 6);
% test7 = enzymeData(2:end, 7);
% test8 = enzymeData(2:end, 8);
% test9 = enzymeData(2:end, 9);
% test10 = enzymeData(2:end, 10);

v0 = zeros(20, 1);

y = enzymeData;
x = time;

%% ____________________
%% CALCULATIONS

for i = 1:20
  v0(i) = (testData(2, i) - testData(1, i)) / (time(2) - time(1)); %find the inital slope of each one
end;

%implementing Hanes-Woolf Linearization

disp(v0);

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
