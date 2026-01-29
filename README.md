# 🔭 Stellar Motion Analysis: Radial Velocity & Doppler Shift
**Developer:** Shubham | 📍 Uttar Pradesh, India | 📅 January 2026

## 🚀 Project Overview
This project automates the calculation of **radial velocity** ($v_r$) for a set of stars using the Doppler Effect. By analyzing the shift in the **Hydrogen-alpha ($H\alpha$)** absorption line, we determine whether a star is receding (redshift) or approaching (blueshift).

### 🧮 Physics Architecture
The system uses the following shift logic:
1. **Redshift ($z$):** $$z = \frac{\lambda_{observed} - \lambda_{rest}}{\lambda_{rest}}$$
2. **Radial Velocity ($v$):**
   $$v = z \times c$$
   *(where $c \approx 299,792$ km/s)*

## 🛠 Features
- **Automated Peak Detection:** Locates the minimum intensity point in the spectrum flux.
- **Batch Processing:** Iterates through `starData.mat` to analyze 7 different stars in one execution.
- **Dynamic Visualization:** - **Blue Solid Lines:** Approaching stars ($\lambda_{obs} < \lambda_{rest}$).
  - **Red Dashed Lines:** Receding stars ($\lambda_{obs} > \lambda_{rest}$).



## 📁 Repository Structure
| File | Description |
| :--- | :--- |
| `stellar_motion_analysis.m` | Core MATLAB algorithm and visualization engine. |
| `starData.mat` | Source dataset containing `lambda`, `spectra`, and `starnames`. |
| `plots/` | Directory containing exported high-res PNGs of results. |
| `.gitignore` | Excludes MATLAB environment junk (`.asv`, `.mat` temp files). |

## 📊 Sample Output: HD94028
- **Rest Wavelength:** 656.28 nm
- **Observed Wavelength:** ~656.46 nm
- **Calculated Velocity:** **+82 km/s** (Receding)

---

## 🔧 Installation & Deployment
1. **Clone the Repo:** `git clone https://github.com/yourusername/stellar-motion.git`
2. **Launch MATLAB:** Navigate to the project directory.
3. **Execute:** Type `stellar_motion_analysis` in the Command Window.
