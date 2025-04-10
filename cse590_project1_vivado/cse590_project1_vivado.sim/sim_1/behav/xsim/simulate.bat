@echo off
REM ****************************************************************************
REM Vivado (TM) v2024.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Apr 10 02:32:21 -0400 2025
REM SW Build 5239630 on Fri Nov 08 22:35:27 MST 2024
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim r_type_instruction_datapath_behav -key {Behavioral:sim_1:Functional:r_type_instruction_datapath} -tclbatch r_type_instruction_datapath.tcl -log simulate.log"
call xsim  r_type_instruction_datapath_behav -key {Behavioral:sim_1:Functional:r_type_instruction_datapath} -tclbatch r_type_instruction_datapath.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
