% Read the Excel file
T = readtable('Electric_Vehicle_Population_Data1.xlsx');

% Extract the 'Make' column (car brand)
makes = T.Make;

% Count the number of EVs per brand
[uniqueMakes, ~, idx] = unique(makes);
makeCounts = accumarray(idx, 1);

% Sort and get top 10 makes
[sortedCounts, sortIdx] = maxk(makeCounts, 10);
topMakes = uniqueMakes(sortIdx);

% Create bar plot
figure;
bar(sortedCounts);
xticks(1:length(topMakes));
xticklabels(topMakes);
xtickangle(45);

% Add labels
ylabel('Number of EVs');
xlabel('Car Make');
title('Top 10 EV Brands by Number of Vehicles');
grid on;