Data = readmatrix('Data_PGOX50_enzyme.csv');
Data(1,:) = [];
Data(2:3,:) = [];
time = Data(:,1);
time(1) = [];
enzymeData = Data(:,2:11);
M3_Algorithm_005_19(time,enzymeData)
