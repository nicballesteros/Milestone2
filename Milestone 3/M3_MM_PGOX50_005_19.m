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

csvData = readmatrix('Data_PGOX50_enzyme.csv');
Substrate_data = csvData(5:end, :);

time = Substrate_data(:,1);

concentration.data(:, 1) = Substrate_data(:, 2); %3.75
concentration.data(:, 2) = Substrate_data(:, 3); %7.5
concentration.data(:, 3) = Substrate_data(:, 4); %15
concentration.data(:, 4) = Substrate_data(:, 5); %30
concentration.data(:, 5) = Substrate_data(:, 6); %65
concentration.data(:, 6) = Substrate_data(:, 7); %125
concentration.data(:, 7) = Substrate_data(:, 8); %250
concentration.data(:, 8) = Substrate_data(:, 9); %500
concentration.data(:, 9) = Substrate_data(:, 10);%1000
concentration.data(:, 10) = Substrate_data(:, 11);%2000

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

concentration.value(1) = 3.75;
concentration.value(2) = 7.5;
concentration.value(3) = 15;
concentration.value(4) = 30;
concentration.value(5) = 65;
concentration.value(6) = 125;
concentration.value(7) = 250;
concentration.value(8) = 500;
concentration.value(9) = 1000;
concentration.value(10) = 2000;


% V_initials = [0.028, 0.055, 0.11, 0.19,0.338, 0.613, 0.917, 1.201, 1.282, 1.57];
Km = 214.28;
Vmax = 1.61;

%% ____________________
%% CALCULATIONS

%part 1
%make dataset for v0 line

for i = 1:10

  data = concentration.data(:, i);
  v0line = [0 0];
  x = 0;
  y = 0;
  counter = 1;

  while y < data(end); %for visual
    y = concentration.v0(i) * x + data(1);
    v0line(counter, :) = [x y];
    x = x + 50;
    counter = counter + 1;
  end; %end while

  concentration.v0line(i).data = v0line;
end; %end for
%end part 1
%part 2

%make a data structure to hold concentration values and v0
michaelisMentenData = zeros(10, 2);

for i = 1:10
  michaelisMentenData(i, :) = [concentration.value(i) concentration.v0(i)];
end; %end for

%end part 2
%part 3

%use the vmax and km value provided to make a Michaelis-Menten model
x = 0:1:concentration.value(10); %make the x vector
michaelisMentenModel(:, 1) = x;
michaelisMentenModel(:, 2) = (x * Vmax) ./ (Km + x); % make the y values

%end part 3
%part 4

%finding the predicted values for each concentration based off of Vmax and Km
x = concentration.value;
predictedValues = (x * Vmax) ./ (Km + x); %predict the values

disp(concentration.v0);
disp(predictedValues);

SSE = sum((concentration.v0 - predictedValues) .^ 2);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%part 1

figure;
subplot(2,5,1);
plot(time, concentration.data(:, 1), 'b.');
hold on;
plot(concentration.v0line(1).data(:, 1), concentration.v0line(1).data(:, 2), 'r-');

title('[3.75]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,2);
plot(time, concentration.data(:, 2), 'b.');
hold on;
plot(concentration.v0line(2).data(:, 1), concentration.v0line(2).data(:, 2), 'r-');

title('[7.5]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,3);
plot(time, concentration.data(:, 3), 'b.');
hold on;
plot(concentration.v0line(3).data(:, 1), concentration.v0line(3).data(:, 2), 'r-');

title('[15.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,4);
plot(time, concentration.data(:, 4), 'b.');
hold on;
plot(concentration.v0line(4).data(:, 1), concentration.v0line(4).data(:, 2), 'r-');

title('[30.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,5);
plot(time, concentration.data(:, 5), 'b.');
hold on;
plot(concentration.v0line(5).data(:, 1), concentration.v0line(5).data(:, 2), 'r-');

title('[65.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,6);
plot(time, concentration.data(:, 6), 'b.');
hold on;
plot(concentration.v0line(6).data(:, 1), concentration.v0line(6).data(:, 2), 'r-');

title('[125.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,7);
plot(time, concentration.data(:, 7), 'b.');
hold on;
plot(concentration.v0line(7).data(:, 1), concentration.v0line(7).data(:, 2), 'r-');

title('[250.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,8);
plot(time, concentration.data(:, 8), 'b.');
hold on;
plot(concentration.v0line(8).data(:, 1), concentration.v0line(8).data(:, 2), 'r-');

title('[500.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,9);
plot(time, concentration.data(:, 9), 'b.');
hold on;
plot(concentration.v0line(9).data(:, 1), concentration.v0line(9).data(:, 2), 'r-');

title('[1000.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

subplot(2,5,10);
plot(time, concentration.data(:, 10), 'b.');
hold on;
plot(concentration.v0line(10).data(:, 1), concentration.v0line(10).data(:, 2), 'r-');

title('[2000.0]');
xlabel('Time (Seconds)');
ylabel('Concentration of Product (umol)');
legend('Product Data', 'Inital Velocity', 'location', 'southeast');

sgtitle('Product Data plotted with V0');

%end part 1
%part 2

figure;
plot(michaelisMentenData(:, 1), michaelisMentenData(:, 2), 'ro');
hold on;
title('Initial Velocity for Different Initial Concentrations');
xlabel('Concentration [S] (umol)');
ylabel('Velocity');

%end part 2
%part 3

plot(michaelisMentenModel(:, 1), michaelisMentenModel(:, 2));

%% ____________________
%% COMMAND WINDOW OUTPUT

fprintf("Inherited Error: %0.2f", SSE);

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
