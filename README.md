# 📦 SerDes Multiplier

A serial-parallel-serial 4-bit multiplier. 

Taking two 4-bit serial inputs, multiplying them together in parallel, then outputting the answer serially.

> *ECE_499_Project.pdf explains the project & decisions in depth*


## 🌟 Highlights

- 174.5 $MHz$ Max frequency
- 153 $\mu\text{W}$ Total Power
- 6162.68 $\mu\text{m}^2$ Total PnR Area
- Synthesized in 130nm CMOS standard-cell technology in Cadence Genus
- Written & verified in Verilog/SystemVerilog in Cadence Xcelium/SimVision


## ℹ️ Overview

This project was made for a VLSI automation class, utilizing Verilog/SystemVerilog and industry automation tools.
The 4-bit multiplier design was created using Verilog/SystemVerilog while PnR was used utilizing automation in Cadence Genus.
Initially running into post-synthesis setup and hold violation forced us to manipulate and change our control logic.


### ✍️ Authors

I'm Chris Rockett and I am an Electrical and Computer Engineering graduate with a minor in Computer Science.
I love working with hardware, software, and circuit design and am always trying to improve my skills in these areas.


## 🚀 Usage

> *Top-Level Block Diagram*
<img width="1042" height="452" alt="image" src="https://github.com/user-attachments/assets/e8441e9b-99dc-4dc4-b42c-33c1abe3e13b" />

> *FSM State Diagram*
<img width="667" height="641" alt="image" src="https://github.com/user-attachments/assets/478cbacb-f868-45b4-90a9-f8999a7ba488" />

> *Full Design Place and Route*
<img width="821" height="697" alt="image" src="https://github.com/user-attachments/assets/05b39043-0e1e-47e4-8964-5692fb0670fb" />

