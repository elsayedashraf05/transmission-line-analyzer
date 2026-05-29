# ⚡ Transmission Line Analyzer — MATLAB GUI

A MATLAB App Designer tool for analyzing three-phase AC transmission lines. Automatically selects the correct line model (Short, Medium π, Medium T, or Long/EHV) based on line length, computes ABCD parameters, and plots efficiency and voltage regulation curves.

---

## 📁 Repository Structure

```
transmission-line-analyzer/
├── Matlab_code/
│   ├── Run_Here.mlapp          ← Launch this in MATLAB
│   ├── Task_1.m                ← Line parameter calculator (R, L, C)
│   ├── Task2.m                 ← ABCD parameter calculator
│   ├── task3_case1.m           ← Efficiency & VR vs. load power (0.8 pf lag)
│   ├── task3_case2_lag.m       ← Efficiency & VR vs. power factor (lagging)
│   └── task3_case2_lead.m      ← Efficiency & VR vs. power factor (leading)
└── output/
    ├── Short Line - CASE I.jpg
    ├── Medium Line Pi - CASE II.jpg
    ├── Medium Line T - CASE I.jpg
    ├── Long Line - CASE II.jpg
    └── Extreme Long Line - EHV.jpg
```

---

## 🚀 How to Run

1. Open **MATLAB** (R2021a or later).
2. Navigate to the `Matlab_code/` folder.
3. Open **`Run_Here.mlapp`** in App Designer and click **Run**, or double-click it in the MATLAB file browser.
4. Fill in the system inputs and click **RUN FULL ANALYSIS**.

---

## 🔧 System Inputs

| Input | Description |
|---|---|
| Conductor Resistivity ρ (Ω·m) | Material resistivity (e.g. `2.82e-8` for Al) |
| Conductor Length L (m) | Total line length |
| Conductor Diameter d (cm) | Physical conductor diameter |
| Spacing Type | Symmetrical or Unsymmetrical tower geometry |
| Distance(s) D (m) | Phase spacing — one value (sym.) or three D_ab, D_bc, D_ca (unsym.) |
| Medium Line Model | Nominal Pi or Nominal T (used when 80 km ≤ L < 250 km) |
| Receiving End Voltage (V) | Line-to-line voltage at the load end |
| Performance Case | CASE I (efficiency vs. load) or CASE II (efficiency vs. power factor) |

---

## ⚙️ How It Works

### Task 1 — Line Parameters (`Task_1.m`)
Computes per-unit-length electrical parameters:
- **R** — DC resistance from conductor geometry and resistivity
- **L** — Inductance using GMR and phase spacing (D or D_eq for transposed lines)
- **C** — Capacitance using the line-to-neutral formula

### Task 2 — ABCD Parameters (`Task2.m`)
Selects transmission model based on line length:

| Line Length | Model | Parameters |
|---|---|---|
| L < 80 km | Short Line | A=D=1, B=Z, C=0 |
| 80 km ≤ L < 250 km | Medium π or T | Lumped shunt admittance |
| L ≥ 250 km | Long Line / EHV | Hyperbolic (cosh/sinh) using propagation constant γ |

### Task 3 — Performance Curves

| Function | X-axis | What it shows |
|---|---|---|
| `task3_case1.m` | Load power (0–100 kW) | η and V_R at fixed 0.8 pf lagging |
| `task3_case2_lag.m` | Power factor (0.3–1.0) | η and V_R at fixed 100 kW, lagging |
| `task3_case2_lead.m` | Power factor (0.3–1.0) | η and V_R at fixed 100 kW, leading |

---

## 📊 Sample Outputs

| Scenario | Preview |
|---|---|
| Short Line – CASE I | ![Short](output/Short%20Line%20-%20CASE%20I.jpg) |
| Medium Line Pi – CASE II | ![MedPi](output/Medium%20Line%20Pi%20-%20CASE%20II.jpg) |
| Medium Line T – CASE I | ![MedT](output/Medium%20Line%20T%20-%20CASE%20I.jpg) |
| Long Line – CASE II | ![Long](output/Long%20Line%20-%20CASE%20II.jpg) |
| EHV Line | ![EHV](output/Extreme%20Long%20Line%20-%20EHV.jpg) |

---

## 📋 Requirements

- MATLAB R2021a or later
- No additional toolboxes required

---

## 👤 Author

Power Systems Engineering — University Assignment, 2026
