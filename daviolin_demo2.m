% Read the Excel file
T = readtable('Electric_Vehicle_Population_Data1.xlsx');

% Clean Electric Range and Make
valid = ~isnan(T.ElectricRange) & T.ElectricRange > 0;
range = T.ElectricRange(valid);
makes = T.Make(valid);

% Find top 10 makes
[uniqueMakes, ~, ic] = unique(makes);
counts = accumarray(ic, 1);
[~, idx] = maxk(counts, 10);
topMakes = uniqueMakes(idx);

% Filter data for top 10 makes
isTop = ismember(makes, topMakes);
range = range(isTop);
makes = makes(isTop);

% Convert makes to string array (required by violinplot)
makesStr = string(makes);  % or cellstr(makes) if you're using older MATLAB

% Plot violin
figure;
violinplot(range, makesStr);  % <- THIS is the fix
xlabel('Make');
ylabel('Electric Range (miles)');
title('Electric Range Distribution by Top 10 EV Makes');
grid on;
