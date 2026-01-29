# 🔭 Stellar Motion Analysis using MATLAB

This project analyzes the **radial velocity** of stars using Doppler shift (redshift/blueshift) from their spectra. It focuses on the Hydrogen-alpha (Hα) absorption line at rest wavelength 656.28 nm to determine how fast stars are moving toward or away from Earth.

## 🚀Project Overview
- Plot the spectrum of individual stars (e.g., HD94028)
- Find the observed wavelength of the Hα line (minimum intensity point)
- Calculate redshift z = (λ_observed / λ_rest) - 1
- Compute radial velocity v = z × c (where c = 299792 km/s)
- Loop through multiple stars, plot spectra (red dashed for receding, blue solid for approaching)
- Display stars moving away from Earth

# 🧮 Physics Logic & Calculations
To calculate the motion, the script executes the following algorithm:
1. Identify the $H\alpha$ line: Locate the minimum intensity point (absorption dip).
2. Calculate Redshift ($z$): $$z = \frac{\lambda_{observed}}{\lambda_{rest}} - 1$$(where $\lambda_{rest} = 656.28$ nm)
3. Compute Radial Velocity ($v$):$$v = z \times c$$(where $c = 299,792$ km/s)

## 🛠 Files Included
- `stellar_motion_analysis.m` → Main script with calculations and plots
- `starData.mat` → Data file (load starData; contains lambda, spectra, starnames)
- `README.md` → This file
# 📁 Repository Structure
FileDescriptionstellar_motion_analysis.mMain script with Doppler calculations and graphics engine.starData.matDataset containing lambda, spectra, and starnames.plots/Directory for exported PNG visualizations.README.mdProject documentation and technical specs.

## How to Run
1. Open MATLAB
2. Set the current folder to this repository
3. Run the script: `stellar_motion_analysis`

## Example Plots

![Single Star Spectrum](plots/single_star_HD94028_spectrum.png)
*HD94028 ka spectrum with marked Hα line (~ +82 km/s redshift)*

![All Stars Spectra](plots/all_stars_spectra.png)
*Sab stars ke overlaid spectra (red dashed = receding, blue thick = approaching)*

## Example Output
- For HD94028: Radial velocity ≈ **+82 km/s** (positive = receding/redshift)
- Plots show spectra with marked Hα dip and legend for all stars

Data Source: MATLAB Onramp course (Stellar Motion project section)

Created by Shubham | Uttar Pradesh, India | January 2026
 readme file is this 
