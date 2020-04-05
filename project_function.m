function [Km,Vmax] = project_function(time, substrate_data);
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
% time: Input the time column, s
% substrate_data: Input the substrate concentration column for the initial substrate
% concentration of 3.75, uM
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

v0 = 0;
y = substrate_data;
x = time;

%% ____________________
%% CALCULATIONS

v0 = (substrate_data(2) - substrate_data(1)) / (time(2) - time(1))

%implementing Hanes-Woolf Linearization

Y = y / v0;

X = substrate_data
figure(1);
plot(X,Y, 'ro');
hold on;

Xline = mean(X)
Yline = mean(Y)
XYline = mean(X .* Y)

a = (Xline * Yline - XYline) / (Xline ^ 2 - mean(X .^ 2))
b = Yline - a * Xline

fx = X * a + b;

plot(X, fx, 'b-');

Vmax = 1 / a
Km = b / a

mme = (Vmax * substrate_data) / (Km + substrate_data);%Michaelis-Menten Equation


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(2);
plot(time, substrate_data, 'k.');
plot(time, mme, 'r-');

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
