// megafunction wizard: %MAX II/MAX V oscillator%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTUFM_OSC 

// ============================================================
// File Name: OSC_INT.v
// Megafunction Name(s):
// 			ALTUFM_OSC
//
// Simulation Library Files(s):
// 			maxii
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.1 Build 232 06/12/2013 SP 1 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2013 Altera Corporation
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


//altufm_osc CBX_AUTO_BLACKBOX="ALL" OSC_FREQUENCY=180000 osc oscena DEVICE_FAMILY="MAX II"
//VERSION_BEGIN 13.0 cbx_altufm_osc 2013:06:12:18:03:43:SJ cbx_maxii 2013:06:12:18:03:43:SJ cbx_mgl 2013:06:12:18:05:10:SJ cbx_stratixii 2013:06:12:18:03:43:SJ cbx_util_mgl 2013:06:12:18:03:43:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = maxii_ufm 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  OSC_INT_altufm_osc_518
	( 
	osc,
	oscena) ;
	output   osc;
	input   oscena;

	wire  wire_maxii_ufm_block1_osc;

	maxii_ufm   maxii_ufm_block1
	( 
	.arclk(1'b0),
	.ardin(1'b0),
	.arshft(1'b0),
	.bgpbusy(),
	.busy(),
	.drclk(1'b0),
	.drdin(1'b0),
	.drdout(),
	.drshft(1'b1),
	.osc(wire_maxii_ufm_block1_osc),
	.oscena(oscena)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.erase(1'b0),
	.program(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.ctrl_bgpbusy(1'b0),
	.devclrn(1'b1),
	.devpor(1'b1),
	.sbdin(1'b0),
	.sbdout()
	// synopsys translate_on
	);
	defparam
		maxii_ufm_block1.address_width = 9,
		maxii_ufm_block1.osc_sim_setting = 180000,
		maxii_ufm_block1.lpm_type = "maxii_ufm";
	assign
		osc = wire_maxii_ufm_block1_osc;
endmodule //OSC_INT_altufm_osc_518
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module OSC_INT (
	oscena,
	osc);

	input	  oscena;
	output	  osc;

	wire  sub_wire0;
	wire  osc = sub_wire0;

	OSC_INT_altufm_osc_518	OSC_INT_altufm_osc_518_component (
				.oscena (oscena),
				.osc (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "MAX II"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altufm_osc"
// Retrieval info: CONSTANT: OSC_FREQUENCY NUMERIC "180000"
// Retrieval info: USED_PORT: osc 0 0 0 0 OUTPUT NODEFVAL "osc"
// Retrieval info: CONNECT: osc 0 0 0 0 @osc 0 0 0 0
// Retrieval info: USED_PORT: oscena 0 0 0 0 INPUT NODEFVAL "oscena"
// Retrieval info: CONNECT: @oscena 0 0 0 0 oscena 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT.bsf FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT_inst.v FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT_bb.v FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT.inc FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL OSC_INT.cmp FALSE TRUE
// Retrieval info: LIB_FILE: maxii
