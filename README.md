# FCC Reactor Simulation App

## Overview
This repository contains an interactive MATLAB-based application developed to simulate and compare the numerical solutions of coupled ordinary differential equations governing a Fluidized Catalytic Cracking (FCC) reactor. This tool was developed to help visualize the effect of kinetic and thermodynamic parameters on hydrocarbon conversion, reactor temperature, and catalyst activity. 

This project was created as the term project for ESC113M (2025 Even Semester) by Group 10.

## Features
**Numerical Method Comparison:** Supports and compares Explicit Euler's method (RK1) through 4th-order Runge-Kutta (RK4).
**Interactive UI:** Real-time adjustment of step size ($h$) to observe its impact on numerical stability.
**Parameter Controls:** Adjustable sliders and knobs for pre-exponential factors, activation energies, heat of reaction, heat capacity, and density.
**Dynamic Plotting:** Separate tabs visualizing Conversion ($X$ vs $Z$), Temperature ($T$ vs $Z$), and Catalyst Activity ($A$ vs $Z$) profiles.

## Mathematical Model
The application numerically solves the following simplified basic FCC reactor model equations:
1. **Mass Balance (Hydrocarbon Conversion):** $dX/dZ = k(T)A(1-X)$ 
2. **Energy Balance (Temperature Profile):** $dT/dZ = (\Delta H_r \cdot k(T)A(1-X)) / (\rho C_p)$ 
3. **Catalyst Deactivation:** $dA/dZ = -k_d(T)A$

## System Requirements
* MATLAB R2024b or later (for editing `.mlapp` or installing via `.mlappinstall`) 
* MATLAB Compiler Runtime (if using the standalone `.exe` version)
* OS: Windows / macOS / Linux 
* RAM: 4 GB or higher recommended 

## Installation & Usage
1. **Launch the App:** * Open `FCC_APP.mlapp` in MATLAB App Designer, or install the `.mlappinstall` file.
2. **Configure Parameters:** Adjust the kinetic and physical parameters (e.g., $K_o$, $E_a$, $C_p$) using the left-hand sliders.
3. **Select Methods:** Check the boxes for the numerical methods (RK1, RK2, RK3, RK4) you wish to compare.
4. **Set Step Size:** Define the step size $h$ via the spinner to test computational accuracy.
5. **Run:** Click the **PLOT** button to compute and generate the graphs.
