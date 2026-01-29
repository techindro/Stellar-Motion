% MATLAB Onramp - Project: Stellar Motion (All Tasks Reference)
% Shubham - January 2026
% This script combines typical steps from all tasks (1-7 approx).
% Use step-by-step in Onramp for grading; this is for full view / GitHub.

clear; clc; close all;

% Load data (from Onramp course files)
load('starData.mat');  % Contains: spectra (216x7), starnames (1x7 cell)

% Pre-defined variables (usually already in script)
nObs        = size(spectra, 1);
lambdaStart = 630.02;     % nm
lambdaDelta = 0.14;       % nm step

% Task 1: Create wavelength vector lambda (evenly spaced)
lambda = lambdaStart : lambdaDelta : lambdaStart + (nObs-1)*lambdaDelta;
% Alternative: lambda = linspace(lambdaStart, lambdaStart + (nObs-1)*lambdaDelta, nObs);

% Constants
lambda_rest = 656.28;      % H-alpha rest wavelength (nm)
c           = 299792.458;  % speed of light (km/s)

% ------------------- Single Star Analysis (Tasks 2-4,7 often switch index) -------------------
% Often starts with column 6 (HD94028), then changes to column 2 in later tasks
star_index = 2;  % Change to 6 if your early tasks use it; final usually 2

s = spectra(:, star_index);

% Find observed H-alpha wavelength (minimum intensity = absorption dip)
[sHa, idx] = min(s);
lambdaHa   = lambda(idx);

% Plot single star spectrum
figure(1);
plot(lambda, s, 'b-', 'LineWidth', 1.5);
hold on;
plot(lambdaHa, sHa, 'rs', 'MarkerSize', 10, 'LineWidth', 2);  % red square marker
text(lambdaHa + 0.5, sHa, sprintf('Observed λ = %.2f nm', lambdaHa), 'Color', 'r');

xlabel('Wavelength (nm)');
ylabel('Normalized Intensity');
title(['Spectrum of ' starnames{star_index}]);
grid on;
hold off;

% Calculate redshift and radial velocity
z      = (lambdaHa / lambda_rest) - 1;
speed_single = z * c;

fprintf('Star: %s\n', starnames{star_index});
fprintf('Observed λ: %.2f nm\n', lambdaHa);
fprintf('Redshift z: %.6f\n', z);
fprintf('Radial Velocity: %.2f km/s\n', speed_single);
if speed_single > 0
    fprintf('Moving AWAY (receding).\n');
else
    fprintf('Moving TOWARDS (approaching).\n');
end

% ------------------- All Stars Analysis (Tasks 4-6) -------------------
speed = zeros(1, 7);   % Pre-allocate velocities

figure(2);
hold on;

for v = 1:7
    s = spectra(:, v);
    
    % Find min for each star
    [~, idx] = min(s);
    lambda_obs = lambda(idx);
    
    % Redshift & velocity
    z = (lambda_obs / lambda_rest) - 1;
    speed(v) = z * c;
    
    % Conditional plotting (common in Task 6)
    if speed(v) <= 0
        plot(lambda, s, 'r--', 'LineWidth', 1.5);   % Dashed red for approaching / <=0
    else
        plot(lambda, s, 'b-', 'LineWidth', 3);      % Thick blue solid for receding >0
    end
end

xlabel('Wavelength (nm)');
ylabel('Normalized Intensity');
title('All Stars Spectra (Red dashed = approaching, Blue thick = receding)');
legend(starnames, 'Location', 'bestoutside');
grid on;
hold off;

## Example Plots

![Single Star Spectrum](single_star_HD94028_spectrum.png)
*HD94028 ka spectrum with marked Hα line (~ +82 km/s redshift)*

![All Stars Spectra](all_stars_spectra.png)
*Sab stars ke overlaid spectra (red dashed = receding, blue thick = approaching)*

% Summary (Task 6-7 often)
movaway = starnames(speed > 0);   % Stars moving away (receding)
fprintf('\nStars moving away from Earth: %s\n', strjoin(movaway, ', '));

disp('All tasks reference complete! For grading, do step-by-step in Onramp.');
