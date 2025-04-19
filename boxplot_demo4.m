% Read the Excel file
T = readtable('Electric_Vehicle_Population_Data1.xlsx');

% Filter valid data (non-missing, positive electric range)
valid = ~isnan(T.ElectricRange) & T.ElectricRange > 0;
range = T.ElectricRange(valid);
makes = T.Make(valid);

% Find top 12 most frequent makes
[uniqueMakes, ~, idx] = unique(makes);
makeCounts = accumarray(idx, 1);
[~, topIdx] = maxk(makeCounts, 12);
topMakes = uniqueMakes(topIdx);

% Filter to keep only top 12 makes
isTop = ismember(makes, topMakes);
range = range(isTop);
makes = makes(isTop);

% Convert categorical or string makes (required by boxplot)
makes = categorical(makes);

% Create the boxplot
figure('Position', [100, 100, 1200, 600]); % Wider figure
boxplot(range, makes, 'Colors', 'b');
xlabel('Make', 'FontWeight', 'bold');
ylabel('Electric Range (miles)', 'FontWeight', 'bold');
title('Boxplot of Electric Range by Top 12 EV Makes', 'FontSize', 14);
xtickangle(45); % Tilt x-axis labels
grid on;
