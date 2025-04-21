// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat May 13 11:43:40 2023
// Host        : LAPTOP-JZH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/akyna/Codes/vivado/Decoder3to8/Decoder3to8.sim/sim_1/synth/timing/xsim/Decoder3to8_tb_time_synth.v
// Design      : Decoder3to8
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k160tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module Decoder3to8
   (\input ,
    \output ,
    enable);
  input [2:0]\input ;
  output [7:0]\output ;
  input enable;

  wire enable;
  wire enable_IBUF;
  wire [2:0]\input ;
  wire [7:0]\output ;
  wire \output[7]_INST_0_i_2_n_0 ;
  wire \output[7]_INST_0_i_3_n_0 ;
  wire \output[7]_INST_0_i_4_n_0 ;
  wire [7:0]output_OBUF;

initial begin
 $sdf_annotate("Decoder3to8_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF enable_IBUF_inst
       (.I(enable),
        .O(enable_IBUF));
  OBUF \output[0]_INST_0 
       (.I(output_OBUF[0]),
        .O(\output [0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \output[0]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_2_n_0 ),
        .I2(\output[7]_INST_0_i_3_n_0 ),
        .I3(\output[7]_INST_0_i_4_n_0 ),
        .O(output_OBUF[0]));
  OBUF \output[1]_INST_0 
       (.I(output_OBUF[1]),
        .O(\output [1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \output[1]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_2_n_0 ),
        .I2(\output[7]_INST_0_i_3_n_0 ),
        .I3(\output[7]_INST_0_i_4_n_0 ),
        .O(output_OBUF[1]));
  OBUF \output[2]_INST_0 
       (.I(output_OBUF[2]),
        .O(\output [2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \output[2]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_2_n_0 ),
        .I2(\output[7]_INST_0_i_4_n_0 ),
        .I3(\output[7]_INST_0_i_3_n_0 ),
        .O(output_OBUF[2]));
  OBUF \output[3]_INST_0 
       (.I(output_OBUF[3]),
        .O(\output [3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \output[3]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_2_n_0 ),
        .I2(\output[7]_INST_0_i_3_n_0 ),
        .I3(\output[7]_INST_0_i_4_n_0 ),
        .O(output_OBUF[3]));
  OBUF \output[4]_INST_0 
       (.I(output_OBUF[4]),
        .O(\output [4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \output[4]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_3_n_0 ),
        .I2(\output[7]_INST_0_i_2_n_0 ),
        .I3(\output[7]_INST_0_i_4_n_0 ),
        .O(output_OBUF[4]));
  OBUF \output[5]_INST_0 
       (.I(output_OBUF[5]),
        .O(\output [5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \output[5]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_4_n_0 ),
        .I2(\output[7]_INST_0_i_3_n_0 ),
        .I3(\output[7]_INST_0_i_2_n_0 ),
        .O(output_OBUF[5]));
  OBUF \output[6]_INST_0 
       (.I(output_OBUF[6]),
        .O(\output [6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \output[6]_INST_0_i_1 
       (.I0(enable_IBUF),
        .I1(\output[7]_INST_0_i_3_n_0 ),
        .I2(\output[7]_INST_0_i_4_n_0 ),
        .I3(\output[7]_INST_0_i_2_n_0 ),
        .O(output_OBUF[6]));
  OBUF \output[7]_INST_0 
       (.I(output_OBUF[7]),
        .O(\output [7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \output[7]_INST_0_i_1 
       (.I0(\output[7]_INST_0_i_2_n_0 ),
        .I1(enable_IBUF),
        .I2(\output[7]_INST_0_i_3_n_0 ),
        .I3(\output[7]_INST_0_i_4_n_0 ),
        .O(output_OBUF[7]));
  IBUF \output[7]_INST_0_i_2 
       (.I(\input [2]),
        .O(\output[7]_INST_0_i_2_n_0 ));
  IBUF \output[7]_INST_0_i_3 
       (.I(\input [0]),
        .O(\output[7]_INST_0_i_3_n_0 ));
  IBUF \output[7]_INST_0_i_4 
       (.I(\input [1]),
        .O(\output[7]_INST_0_i_4_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
