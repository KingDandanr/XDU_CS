// megafunction wizard: %LPM_BUSTRI%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: lpm_bustri 

// ============================================================
// File Name: BUSTRI.v
// Megafunction Name(s):
// 			lpm_bustri
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.0 Build 132 02/25/2009 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module BUSTRI (
	data,
	enabledt,
	tridata);

	input	[7:0]  data;
	input	  enabledt;
	inout	[7:0]  tridata;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: BiDir NUMERIC "0"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: nBit NUMERIC "8"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_BUSTRI"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "8"
// Retrieval info: USED_PORT: data 0 0 8 0 INPUT NODEFVAL data[7..0]
// Retrieval info: USED_PORT: enabledt 0 0 0 0 INPUT NODEFVAL enabledt
// Retrieval info: USED_PORT: tridata 0 0 8 0 BIDIR NODEFVAL tridata[7..0]
// Retrieval info: CONNECT: tridata 0 0 8 0 @tridata 0 0 8 0
// Retrieval info: CONNECT: @data 0 0 8 0 data 0 0 8 0
// Retrieval info: CONNECT: @enabledt 0 0 0 0 enabledt 0 0 0 0
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL BUSTRI.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL BUSTRI.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL BUSTRI.cmp TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL BUSTRI.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL BUSTRI_inst.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL BUSTRI_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
