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
  test(i).data = rmmissing(enzymeData(2:end, i)); %get all not NaN values in each col for each test
  test(i).dataSize = size(test(i).data);
  test(i).time = time(1:test(i).dataSize(1));
  %store the duplicate data
  test(i).dupData = rmmissing(enzymeData(2:end, i + 10)); %get all not NaN values in each col for each duplicate test
  test(i).dupDataSize = size(test(i).dupData);
  test(i).dupTime = time(1:test(i).dupDataSize(1));
  %store the concentation
  test(i).concentation = enzymeData(1, i);
end;

mmData = zeros(20, 2); %Michaelis-Menten data

%% ____________________
%% CALCULATIONS

% model product_data
% for i = 1:10
%   xline = mean(test(i).time);
%   yline = mean(test(i).data);
%   xyline = mean(test(i).data .* test(i).time);
%
%   a = (xline * yline - xyline) / (xline ^ 2 - mean(test(i).time .^ 2));
%   b = yline - a * xline;
%
%   test(i).coeffs(1, 1:2) = [a b];
%
%   xline = mean(test(i).dupTime);
%   yline = mean(test(i).dupData);
%   xyline = mean(test(i).dupData .* test(i).dupTime);
%
%   a = (xline * yline - xyline) / (xline ^ 2 - mean(test(i).dupTime .^ 2));
%   b = yline - a * xline;
%
%   test(i).coeffs(2, 1:2) = [a b];
% end;

for i = 1:10
  test(i).data = smooth(test(i).data);
  test(i).dupData = smooth(test(i).dupData);

  %find the inital slope of each test
  test(i).v0 = (test(i).data(2) - test(i).data(1)) / (test(i).time(2) - test(i).time(1));
  %find the inital slope of each duplicate test
  test(i).dupv0 = (test(i).dupData(2) - test(i).dupData(1)) / (test(i).dupTime(2) - test(i).dupTime(1));
  %store the values to easily plot the Michaelis-Menten data
  mmData(2 * i - 1, 1) = test(i).concentation;
  mmData(2 * i, 1) = test(i).concentation;

  mmData(2 * i - 1, 2) = test(i).v0;
  mmData(2 * i, 2) = test(i).dupv0;
end;

disp(mmData);

%implementing Hanes-Woolf Linearization


Y = mmData(:, 1) ./ mmData(:, 2);

X = mmData(:, 1);



Xline = mean(X)
Yline = mean(Y)
XYline = mean(X .* Y)

a = (Xline * Yline - XYline) / (Xline ^ 2 - mean(X .^ 2))
b = Yline - a * Xline

fx = X * a + b;



Vmax = 1 / a
Km = b / a

numberOfDataPoints = 100;
seperation = (2000 - 3.75) / numberOfDataPoints;
xmodel = 3.75:seperation:2000;
MichaelisModel = Vmax * xmodel ./ (Km + xmodel);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(1);
plot(mmData(:,1), mmData(:, 2), 'ko');
hold on;
plot(xmodel, MichaelisModel, 'r--');

figure(2);
plot(X,Y, 'ro');
hold on;
plot(X, fx, 'b-');

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
