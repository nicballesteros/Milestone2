function [Km,Vmax, v0] = project_function(time, enzymeData);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
%   This program estimates the Michaelis-Menten parameters, Km and Vmax, for
% a given enzyme's data. It first finds the starting velocity V0 for all the
% tests at different concentrations for a single enzyme. Then these Velocities
% are run through two different linearization methods. One is Hanes-Woolf and
% the other is Eadie-Hofstee. In both instances, the line must meet a minimum
% coefficient of determination in order to pass and find the general model. The
% two linearizations are compared and the curve with less sum of squared error
% value is chosen to display as the final Km and Vmax values.
%
% Function Call
%   [Km, Vmax] = project_function(time, substate_data);
%
% Input Arguments
%   time: the time variable for each given data set.
%   enzymeData: First row is the inital concentrations of the substrates for
% each given test. The rest of the rows are the data points for each test; each
% test in a serparate column.
%
% Output Arguments
%   Km: Outputs the estimated Km value for the enzyme
%   Vmax: Outputs the estimated Vmax value for the enzyme
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

%Gets rid of times where reactions are no longer occuring
sizeOfData = size(enzymeData);

if sizeOfData(2) == 20
  for i = 1:10
    test(i).data = rmmissing(enzymeData(2:end, i)); %get all not NaN values in each col for each test
    test(i).dataSize = size(test(i).data); %Determines the number of seconds that pass before the reaction stops for each initial substrate concentration
    test(i).time = time(1:test(i).dataSize(1)); %Creates a matrix of times where the reaction was occuring for each initial substrate concentration
    %store the duplicate data
    test(i).dupData = rmmissing(enzymeData(2:end, i + 10)); %get all not NaN values in each col for each duplicate test
    test(i).dupDataSize = size(test(i).dupData); %Determines the number of seconds that pass before the duplicate reaction stops for each initial substrate concentration
    test(i).dupTime = time(1:test(i).dupDataSize(1)); %Creates a matrix of times where the duplicate reaction was occuring for each initial substrate concentration
    %store the concentation
    test(i).concentration = enzymeData(1, i); %Creates a matrix of substrate concentrations
  end;
elseif sizeOfData(2) == 10
  for i = 1:10
    test(i).data = rmmissing(enzymeData(2:end, i)); %get all not NaN values in each col for each test
    test(i).dataSize = size(test(i).data); %Determines the number of seconds that pass before the reaction stops for each initial substrate concentration
    test(i).time = time(1:test(i).dataSize(1)); %Creates a matrix of times where the reaction was occuring for each initial substrate concentration
    %store the concentation
    test(i).concentration = enzymeData(1, i); %Creates a matrix of substrate concentrations
  end;
else
  fprintf('error\n');
  return;
end;

mmData = zeros(20, 2); %Michaelis-Menten data that will eventually be plotted

%% ____________________
%% CALCULATIONS

% ----------------
% find the v0 data
% ----------------

for i = 1:10
  if sizeOfData(2) == 20
    test(i).v0 = [0 0];
  else
    test(i).v0 = 0;
  end;

  x = test(i).time;
  y = test(i).data;

  x = x(1:20); %linearize only the first 250 values
  y = y(1:20); %linearize only the first 250 values

  %find line best fit
  xline = mean(x);
  yline = mean(y);
  xyline = mean(x .* y);

  a = (xline * yline - xyline) / (xline ^ 2 - mean(x .^ 2));
  b = yline - a * xline;
  %done with best fit

  %make dataset off of modeled line
  xDataPoints = 1:10;
  yDataPoints = a * xDataPoints + b;

  %use line to find initial velocity
  test(i).v0(1) = (yDataPoints(2) - yDataPoints(1)) / (xDataPoints(2) - xDataPoints(1));

  if sizeOfData(2) == 20
    %add it to the Michaelis-Menten dataset
    mmData(2 * i - 1, 1) = test(i).concentration;
    mmData(2 * i - 1, 2) = test(i).v0(1);

    %do the same thing as above but for the duplicate data
    x = test(i).dupTime;
    y = test(i).dupData;

    % x(1) = []; %had a divide by zero error
    % y(1) = []; %to line up both vectors

    x = x(1:20); %linearize only the first 20 values
    y = y(1:20); %linearize only the first 20 values

    % y = x ./ y; %linearize the product data


    %find the line best fit
    xline = mean(x);
    yline = mean(y);
    xyline = mean(x .* y);

    a = (xline * yline - xyline) / (xline ^ 2 - mean(x .^ 2));
    b = yline - a * xline;

    % a = 1 / a;
    % b = b * a;

    %use the model to make a dataset
    xDataPoints = 1:20;
    yDataPoints = a * xDataPoints + b;

    %use data set to find the inital velocity
    test(i).v0(2) = (yDataPoints(2) - yDataPoints(1)) / (xDataPoints(2) - xDataPoints(1));

    %add the inital velocity to the Michaelis-Menten dataset
    mmData(2 * i, 1) = test(i).concentration;
    mmData(2 * i, 2) = test(i).v0(2);
  else
    mmData(i, 1) = test(i).concentration;
    mmData(i, 2) = test(i).v0;
    mmData(11:end, :) = [];
  end;
end;

v0 = mmData(:, 2);

data = mmData; %keep a copy of the raw data
% mmData is going to be spliced and all the outliers are going to be removed.

%--------------------------------------
%implementing Hanes-Woolf Linearization
%--------------------------------------

while 1
  Y = mmData(:, 1) ./ mmData(:, 2);
  X = mmData(:, 1);

  Xline = mean(X);
  Yline = mean(Y);
  XYline = mean(X .* Y);

  a = (Xline * Yline - XYline) / (Xline ^ 2 - mean(X .^ 2));
  b = Yline - a * Xline;

  fx = X * a + b; %Hanes-Woolf Line

  HanesSSE = sum((Y-fx) .^ 2);
  HanesSST = sum((Y-Yline) .^ 2);
  HanesR2 = 1 - HanesSSE/HanesSST;
  % fprintf("HanesR2: %.4f\n", HanesR2);

  if HanesR2 > 0.997
    break; %get out of the infinite while loop
  else
    %get rid of outliers
    maxDiff = max(abs(fx-Y));
    for i = 1:length(mmData)
      if abs(Y(i) - fx(i)) == maxDiff
        mmData(i,:) = [];
      end;
    end;
  end;
end;

hanesVmax = 1 / a; %calculate Vmax from Hanes-Woolf
hanesKm = b * hanesVmax; %calculate Km from Hanes-Woolf

hanesFx = data(:, 1) .* hanesVmax ./ (hanesKm + data(:, 1));

hanesMMSSE = sum((data(:,2) - hanesFx) .^ 2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Eadie-Hofstee Linearization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mmData = data; %reset mmData cause it is currently missing data

while 1
  XE = mmData(:,2) ./ mmData(:, 1);
  YE = mmData(:, 2);

  Xline = mean(XE);
  Yline = mean(YE);
  XYline = mean(XE .* YE);

  a = (Xline * Yline - XYline) / (Xline ^ 2 - mean(XE .^ 2));
  b = Yline - a * Xline;

  fxE = XE * a + b; %lineweaver-Eadie line

  EadieSSE = sum((YE-fxE) .^ 2);
  EadieSST = sum((YE-Yline) .^ 2);
  EadieR2 = 1 - EadieSSE/EadieSST;
  % fprintf("EadieR2: %.4f\n", EadieR2);

  if EadieR2 > 0.990
    break; %get out of the infinite while loop
  else
    %get rid of outliers
    maxDiff = max(abs(fxE-YE));
    for i = 1:length(mmData)
      if abs(YE(i) - fxE(i)) == maxDiff
        mmData(i,:) = [];
      end;
    end;
  end;
end;

EadieVmax = b; %calculate Vmax from Lineweaver-Eadie
EadieKm = -1 * a; %calculate Km from Lineweaver-Eadie

EadieFx = data(:, 1) .* EadieVmax ./ (EadieKm + data(:, 1));

EadieMMSSE = sum((data(:,2) - EadieFx) .^ 2);


hanes = false;
eadie = false;

if hanesMMSSE < EadieMMSSE
  Vmax = hanesVmax;
  Km = hanesKm;
  SSE = HanesSSE;
  hanes = true;
else
  Vmax = EadieVmax;
  Km = EadieKm;
  SSE = EadieSSE;
end;

% make a dataset that follows the model
numberOfDataPoints = 100;
seperation = (2000 - 3.75) / numberOfDataPoints;
xmodel = 3.75:seperation:2000;
MichaelisModel = Vmax * xmodel ./ (Km + xmodel);

mmData = data;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Plots the Calculated Reaction Velocities against the Model Reaction
%Velocities
 figure;
 subplot(2,1,1);
 plot(data(:,1), data(:, 2), 'ko'); %Calculated Reaction Velocities
 title('Reaction Velocity as Initial [S] changes');
 xlabel('Initial Substrate Concentration [S] (uM)');
 ylabel('Reaction Velocity (uM/s)');
 hold on;
 plot(xmodel, MichaelisModel, 'r--'); %Michealis Model curve
 legend('Calculated Reaction Velocities','Michaelis Model','location','best');

if hanes
 subplot(2,1,2);
 plot(X,Y, 'ro');
 hold on;
 plot(X, fx, 'b-');
 xlabel('Initial Substrate Concentration (uM)');
 ylabel('Velocity / [S]');
 title('Hanes-Woolf Linearization');
 legend('Linarized Velocity Data', 'Best Fit Line', 'location', 'best');
else
  subplot(2,1,2);
  plot(XE,YE, 'ro');
  hold on;
  plot(XE, fxE, 'b-');
  xlabel('V/[S] (u(s^-1))');
  ylabel('Velocity (uM(s^-1))');
  title('Eadie-Hofstee Linearization');
  legend('Linarized Velocity Data', 'Best Fit Line', 'location', 'best');
end;

%% ____________________
%% COMMAND WINDOW OUTPUT

fprintf("!!!!!!!!Enzyme Calculations!!!!!!!\n");
fprintf("--------V0 Values--------\n");
disp(v0);

fprintf("--------Hanes-Woolf Parameters--------\n");

fprintf("Hanes Vmax: %.4f\n", hanesVmax);
fprintf("Hanes Km: %.4f\n", hanesKm);

fprintf("--------Eadie-Hofstee Parameters--------\n");

fprintf("Eadie Vmax: %.4f\n", EadieVmax);
fprintf("Eadie Km: %.4f\n", EadieKm);

fprintf("--------Compare SSE Values--------\n")

fprintf("SSE of MM plot from Eadie Linearization: %.4f\n", EadieMMSSE);

fprintf("SSE of MM plot from Hanes Linearization: %.4f\n", hanesMMSSE);

fprintf("--------Final Values--------\n");
fprintf("Vmax: %.3f\n", Vmax);
fprintf("Km: %.3f\n", Km);
fprintf("SSE: %.3f\n", SSE);
fprintf("\n\n\n\n");
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
