function [Enzyme_price] = M4_Regression_005_19(Km)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function predicts the price of an enzyme based on its Michealis
% Constant, or the speed of the enzyme.
%
% Function Call
%function [Enzyme_price] = M4_Regression_005_19(Km)
%
% Input Arguments
%
% Km: Input the Michealis constant for the enzymes, (uM)
%
% Output Arguments
%
% Enzyme_price: Outputs the estimated price for the enzyme, ($/lb)
%
% Assignment Information
%   Assignment:     M04, Problem 3
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

%Importing the data
Price_data = readmatrix('Data_NaturalCatalysts_priceCatalog.csv'); %Imports the price data

%Organizing the price data
Michaelis_Constant = Price_data(:,1); %Creates a vector of Michaelis constants from a given data set (uM)
Price = Price_data(:,2); %Creates a vector of prices from a given data set ($/lb)


%% ____________________
%% CALCULATIONS

%Linearizing and finding the model to the price data
LogPrice = log(Price); %Determines the log base 10 of price values (log($/lb))
Coefficients_Data = polyfit(Michaelis_Constant,LogPrice,1); %Determines the coefficients for the linearized data
LinData_slope = Coefficients_Data(1); %Determines the slope of the linearized
LinData_intercept = Coefficients_Data(2); %Determines the intercept of the linearized data
%Price_trans = polyval(Coefficients_Data,Michaelis_Constant); %Determines the transposed price values for the linear equation
Data_slope = LinData_slope; %Determines the slope of the model equation
Data_intercept = exp(LinData_intercept); %Determines the intercept of the model equation

% %Creating the model values to graph against the given data
% Model_Price = Data_intercept.*(exp(Data_slope.*Michaelis_Constant)); % Creates an array of Model Price values

%Determining the price of an enzyme
Enzyme_price = Data_intercept.*exp(Data_slope.*Km); %Determines the price for a specific enzyme


% %Calculation of Least Square Regression Parameters
% SSE = sum((LogPrice-Price_trans).^2); %Determines the Sum of Squared errors for the Linear Model
% SST = sum((LogPrice-mean(LogPrice)).^2); %Determines the Sum of Squared deviations for the Linear model
% r2 = 1-(SSE/SST); % Determines the coefficient of determination for the Linear model
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS

%Determining the type of function
% %Rectilinear model plot
% figure(1)
% subplot(2,2,1)
% plot(Michaelis_Constant,Price,'r*')
% title('Rectilinear Model')
% xlabel('Michaelis Constant (uM)')
% ylabel('Price ($/lb)')
% grid on
% hold on
% 
% %Semilog in x plot
% subplot(2,2,2)
% semilogx(Michaelis_Constant,Price,'r*')
% title('Semilog in X')
% xlabel('log(Michaelis Constant) log(uM)')
% ylabel('Price ($/lb)')
% grid on
% 
% %Semilog in y plot
% subplot(2,2,3)
% semilogy(Michaelis_Constant,Price,'r*')
% title('Semilog in Y')
% xlabel('Michaelis Constant (uM)')
% ylabel('log(Price) log($/lb)')
% grid on
%
% %Log Log plot
% subplot(2,2,4)
% loglog(Michaelis_Constant,Price,'r*')
% title('Log Log Model')
% xlabel('log(Michaelis Constant) log(uM)')
% ylabel('log(Price) log($/lb)')
% grid on
% hold off

% %Plotting the model against the given data
% % figure(2)
% plot(Michaelis_Constant,Price,'ko')
% title('Price vs Michaelis Constant')
% xlabel('Michaelis Constant (uM)')
% ylabel('Price ($/lb)')
% grid on
% hold on
% plot(Michaelis_Constant,Model_Price, 'r-')
% legend('Price Data','Model','Location','best')

%% ____________________
%% COMMAND WINDOW OUTPUT


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



