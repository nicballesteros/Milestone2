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

v0 = (substrate_data(4) - substrate_data(3)) / (time(4) - time(3));

%implementing Hanes-Woolf Linearization

Y = y / v0;

X = substrate_data;
figure(1);
plot(X,Y, 'ro');
hold on;

Xline = mean(X);
Yline = mean(Y);
XYline = mean(X .* Y);

a = (Xline * Yline - XYline) / (Xline ^ 2 - mean(X .^ 2));
b = Yline - a * Xline;

plot(time, a .* time + b, 'b-');
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(2);
plot(time, substrate_data, 'k.');


%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
