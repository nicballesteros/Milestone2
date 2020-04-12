% function [SSEdata] = M3_MMPGOX50_005_19(Substrate_data,V_initials,Vmax,Km)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132
% Program Description
%This code uses previously calculated approximations of V0, Vmax and Km
%from a given set of data and determines the error presented within these
%calculations.
%
% Function Call
%function [SSEdata] = M3_MMPGOX50_005_19(Substrate_data,V_initials,Vmax,Km)
%
% Input Arguments
%
% Substrate_data: input the enzyme test substrate data
% V_initials: input a vector of V0 values calculated from the orginial
% substrate data
% Vmax: Input the calculated approximation of Vmax
% Km: Input the calculated approximation of Km
%
% Output Arguments
%
% SSEdata: Outputs the error presented within previous calculations
%
% Assignment Information
%   Assignment:     M03, Part 2
%   Team member:    Nic Ballesteros, nballes@purdue.edu
%   Team member:    Alan Camacho , Camachop@purdue.edu
%   Team member:    Annabelle Johnson, john2445@purdue.edu
%   Team ID:        005-19
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION

Substrate_data = readmatrix('Data_PGOX50_enzyme.csv');
time = Substrate_data(:,1);
concentration.data(1) = Substrate_data(:,2); %3.75
concentration.data(2) = Substrate_data(:,3); %7.5
concentration.data(3) = Substrate_data(:,4); %15
concentration.data(4) = Substrate_data(:,5); %30
concentration.data(5) = Substrate_data(:,6); %65
concentration.data(6) = Substrate_data(:,7); %125
concentration.data(7) = Substrate_data(:,8); %250
concentration.data(8) = Substrate_data(:,9); %500
concentration.data(9) = Substrate_data(:,10);%1000
concentration.data(10) = Substrate_data(:,11);%2000

concentration.v0(1) = 0.028;
concentration.v0(2) = 0.055;
concentration.v0(3) = 0.11;
concentration.v0(4) = 0.19;
concentration.v0(5) = 0.338;
concentration.v0(6) = 0.613;
concentration.v0(7) = 0.917;
concentration.v0(8) = 1.201;
concentration.v0(9) = 1.282;
concentration.v0(10) = 1.57;


% V_initials = [0.028, 0.055, 0.11, 0.19,0.338, 0.613, 0.917, 1.201, 1.282, 1.57];
Km = 214.28;
Vmax = 1.61;

%% ____________________
%% CALCULATIONS

%make dataset for line

for i = 1:10
  x = 0;
  y = 0;
  counter = 1;
  while y < concentration.data(i)(end); %for visual
    y = concetration.v0(i) * x + concentration.data(i)(1);
    concetration.v0line(i)(counter, :) = [x y];
    x = x + 50
    counter = counter + 1;
  end;
end;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

figure;
subplot(2,5,1);
plot(time, concentration_3_75, 'b+');
hold on;
plot(concentration.v0line(:, 1), concentration.v0line(:, 2), 'r-');

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
