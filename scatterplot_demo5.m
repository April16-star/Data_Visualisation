% Read the data
T = readtable('Electric_Vehicle_Population_Data1.xlsx');

% Clean the data
valid = ~isnan(T.ElectricRange) & T.ElectricRange > 0 & ~isnan(T.ModelYear);
range = T.ElectricRange(valid);
year = T.ModelYear(valid);

% Create scatter plot
figure;
scatter(year, range, 'o'); % 'o' for circle markers
xlabel('Model Year');
ylabel('Electric Range (miles)');
title('Scatter Plot of Electric Range vs Model Year');
grid on;
