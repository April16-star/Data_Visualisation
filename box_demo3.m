% Read the Excel file
T = readtable('Electric_Vehicle_Population_Data1.xlsx');

% Extract the correct columns
years = T.ModelYear;
makes = T.Make;

% Create boxplot grouped by car brand
figure;
boxplot(years, makes, 'LabelOrientation', 'inline');

% Customize appearance
xlabel('Make');
ylabel('Model Year');
title('EV Model Year Distribution by Make');
ylim([2012 2026]);
grid on;
