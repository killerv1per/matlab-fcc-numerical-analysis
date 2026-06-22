# FCC Reactor Simulation App

## Overview
[cite_start]This repository contains an interactive MATLAB-based application developed to simulate and compare the numerical solutions of coupled ordinary differential equations governing a Fluidized Catalytic Cracking (FCC) reactor[cite: 78]. [cite_start]This tool was developed to help visualize the effect of kinetic and thermodynamic parameters on hydrocarbon conversion, reactor temperature, and catalyst activity[cite: 79]. 

[cite_start]This project was created as the term project for ESC113M (2025 Even Semester) by Group 10[cite: 2, 3].

## Features
* [cite_start]**Numerical Method Comparison:** Supports and compares Explicit Euler's method (RK1) through 4th-order Runge-Kutta (RK4)[cite: 14, 80].
* [cite_start]**Interactive UI:** Real-time adjustment of step size ($h$) to observe its impact on numerical stability[cite: 80, 83].
* [cite_start]**Parameter Controls:** Adjustable sliders and knobs for pre-exponential factors, activation energies, heat of reaction, heat capacity, and density[cite: 83, 85].
* [cite_start]**Dynamic Plotting:** Separate tabs visualizing Conversion ($X$ vs $Z$), Temperature ($T$ vs $Z$), and Catalyst Activity ($A$ vs $Z$) profiles[cite: 88].

## Mathematical Model
[cite_start]The application numerically solves the following simplified basic FCC reactor model equations[cite: 18, 21]:
1. [cite_start]**Mass Balance (Hydrocarbon Conversion):** $dX/dZ = k(T)A(1-X)$ [cite: 22]
2. [cite_start]**Energy Balance (Temperature Profile):** $dT/dZ = (\Delta H_r \cdot k(T)A(1-X)) / (\rho C_p)$ [cite: 23]
3. [cite_start]**Catalyst Deactivation:** $dA/dZ = -k_d(T)A$ [cite: 24]

## System Requirements
* [cite_start]MATLAB R2024b or later (for editing `.mlapp` or installing via `.mlappinstall`) [cite: 81]
* [cite_start]MATLAB Compiler Runtime (if using the standalone `.exe` version) [cite: 81]
* [cite_start]OS: Windows / macOS / Linux [cite: 81]
* [cite_start]RAM: 4 GB or higher recommended [cite: 81]

## Installation & Usage
1. [cite_start]**Launch the App:** * Open `FCC_APP.mlapp` in MATLAB App Designer, or install the `.mlappinstall` file[cite: 81].
   * [cite_start]Alternatively, run `FCC_Reactor_Simulator.exe` if you are using the compiled standalone version[cite: 81].
2. [cite_start]**Configure Parameters:** Adjust the kinetic and physical parameters (e.g., $K_o$, $E_a$, $C_p$) using the left-hand sliders[cite: 86].
3. [cite_start]**Select Methods:** Check the boxes for the numerical methods (RK1, RK2, RK3, RK4) you wish to compare[cite: 87].
4. [cite_start]**Set Step Size:** Define the step size $h$ via the spinner to test computational accuracy[cite: 87].
5. [cite_start]**Run:** Click the **PLOT** button to compute and generate the graphs[cite: 87].
