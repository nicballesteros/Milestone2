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


%% ____________________
%% CALCULATIONS
%implementing Hanes-Woolf Linearization

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

plot(time, substate_data);


%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
