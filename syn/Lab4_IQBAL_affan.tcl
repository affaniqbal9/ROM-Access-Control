# Copyright (C) 2025  Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, the Altera Quartus Prime License Agreement,
# the Altera IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Altera and sold by Altera or its authorized distributors.  Please
# refer to the Altera Software License Subscription Agreements 
# on the Quartus Prime software download page.

# Quartus Prime: Generate Tcl File for Project
# File: Lab4_IQBAL_affan.tcl
# Generated on: Mon Apr 13 00:14:43 2026

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "Lab4_IQBAL_affan"]} {
		puts "Project Lab4_IQBAL_affan is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists Lab4_IQBAL_affan]} {
		project_open -revision Lab4_IQBAL_affan Lab4_IQBAL_affan
	} else {
		project_new -revision Lab4_IQBAL_affan Lab4_IQBAL_affan
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CEBA4F23C7
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 25.1STD.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "19:03:54  APRIL 09, 2026"
	set_global_assignment -name LAST_QUARTUS_VERSION "25.1std.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name EDA_SIMULATION_TOOL "Questa Altera FPGA (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name ENABLE_OCT_DONE OFF
	set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "ACTIVE SERIAL X1"
	set_global_assignment -name USE_CONFIGURATION_DEVICE ON
	set_global_assignment -name STRATIXII_CONFIGURATION_DEVICE EPCS64
	set_global_assignment -name CRC_ERROR_OPEN_DRAIN ON
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
	set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall
	set_global_assignment -name ACTIVE_SERIAL_CLOCK FREQ_100MHZ
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name VERILOG_FILE syn/PSWD_ROM/sim/ROM_PSWD.v
	set_global_assignment -name VERILOG_FILE src/timer_fsm.v
	set_global_assignment -name VERILOG_FILE src/SevenSegmentDecoder.v
	set_global_assignment -name VERILOG_FILE src/one_sec_timer.v
	set_global_assignment -name VERILOG_FILE src/num_gen.v
	set_global_assignment -name VERILOG_FILE src/ms_timer_lfsr.v
	set_global_assignment -name VERILOG_FILE src/ms_timer.v
	set_global_assignment -name VERILOG_FILE src/LoadRegister.v
	set_global_assignment -name VERILOG_FILE src/Lab4_IQBAL_affan.v
	set_global_assignment -name VERILOG_FILE src/digit2_timer.v
	set_global_assignment -name VERILOG_FILE src/digit_timer.v
	set_global_assignment -name VERILOG_FILE src/countTo100.v
	set_global_assignment -name VERILOG_FILE src/countTo10.v
	set_global_assignment -name VERILOG_FILE src/ButtonShaper.v
	set_global_assignment -name VERILOG_FILE src/Adder.v
	set_global_assignment -name VERILOG_FILE src/access_fsm.v
	set_global_assignment -name VERILOG_FILE src/access_controller.v
	set_global_assignment -name MIF_FILE syn/PSWD_ROM/syn/Lab4_IQBAL_affan.mif
	set_global_assignment -name HEX_FILE syn/PSWD_ROM/syn/Lab4_IQBAL_affan.hex
	set_global_assignment -name QIP_FILE syn/PSWD_ROM/syn.qip
	set_location_assignment PIN_U7 -to rst
	set_location_assignment PIN_M6 -to rng_btn
	set_location_assignment PIN_U13 -to player_in1[0]
	set_location_assignment PIN_V13 -to player_in1[1]
	set_location_assignment PIN_T13 -to player_in1[2]
	set_location_assignment PIN_T12 -to player_in1[3]
	set_location_assignment PIN_AA14 -to pass_sw[0]
	set_location_assignment PIN_AA13 -to pass_sw[1]
	set_location_assignment PIN_AB13 -to pass_sw[2]
	set_location_assignment PIN_AB12 -to pass_sw[3]
	set_location_assignment PIN_W9 -to pass_btn
	set_location_assignment PIN_M7 -to load_btn
	set_location_assignment PIN_L1 -to led_nomatch
	set_location_assignment PIN_L2 -to led_match
	set_location_assignment PIN_AA1 -to led_logged_out
	set_location_assignment PIN_AA2 -to led_logged_in
	set_location_assignment PIN_N9 -to disp_time_tens[0]
	set_location_assignment PIN_M8 -to disp_time_tens[1]
	set_location_assignment PIN_T14 -to disp_time_tens[2]
	set_location_assignment PIN_P14 -to disp_time_tens[3]
	set_location_assignment PIN_C1 -to disp_time_tens[4]
	set_location_assignment PIN_C2 -to disp_time_tens[5]
	set_location_assignment PIN_W19 -to disp_time_tens[6]
	set_location_assignment PIN_U20 -to disp_time_ones[0]
	set_location_assignment PIN_Y20 -to disp_time_ones[1]
	set_location_assignment PIN_V20 -to disp_time_ones[2]
	set_location_assignment PIN_U16 -to disp_time_ones[3]
	set_location_assignment PIN_U15 -to disp_time_ones[4]
	set_location_assignment PIN_Y15 -to disp_time_ones[5]
	set_location_assignment PIN_P9 -to disp_time_ones[6]
	set_location_assignment PIN_Y19 -to disp_sum[0]
	set_location_assignment PIN_AB17 -to disp_sum[1]
	set_location_assignment PIN_AA10 -to disp_sum[2]
	set_location_assignment PIN_Y14 -to disp_sum[3]
	set_location_assignment PIN_V14 -to disp_sum[4]
	set_location_assignment PIN_AB22 -to disp_sum[5]
	set_location_assignment PIN_AB21 -to disp_sum[6]
	set_location_assignment PIN_AA20 -to disp_rng[0]
	set_location_assignment PIN_AB20 -to disp_rng[1]
	set_location_assignment PIN_AA19 -to disp_rng[2]
	set_location_assignment PIN_AA18 -to disp_rng[3]
	set_location_assignment PIN_AB18 -to disp_rng[4]
	set_location_assignment PIN_AA17 -to disp_rng[5]
	set_location_assignment PIN_U22 -to disp_rng[6]
	set_location_assignment PIN_U21 -to disp_player1[0]
	set_location_assignment PIN_V21 -to disp_player1[1]
	set_location_assignment PIN_W22 -to disp_player1[2]
	set_location_assignment PIN_W21 -to disp_player1[3]
	set_location_assignment PIN_Y22 -to disp_player1[4]
	set_location_assignment PIN_Y21 -to disp_player1[5]
	set_location_assignment PIN_AA22 -to disp_player1[6]
	set_location_assignment PIN_M9 -to clk
	set_location_assignment PIN_Y16 -to disp_hex3[0]
	set_location_assignment PIN_W16 -to disp_hex3[1]
	set_location_assignment PIN_Y17 -to disp_hex3[2]
	set_location_assignment PIN_V16 -to disp_hex3[3]
	set_location_assignment PIN_U17 -to disp_hex3[4]
	set_location_assignment PIN_V18 -to disp_hex3[5]
	set_location_assignment PIN_V19 -to disp_hex3[6]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
