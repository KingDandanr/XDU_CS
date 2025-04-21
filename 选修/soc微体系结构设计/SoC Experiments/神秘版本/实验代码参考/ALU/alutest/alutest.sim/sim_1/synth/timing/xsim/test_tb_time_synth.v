// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Jun  5 15:49:27 2023
// Host        : LAPTOP-JZH running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/akyna/Codes/vivado/ALU/alutest/alutest/alutest.sim/sim_1/synth/timing/xsim/test_tb_time_synth.v
// Design      : test
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k160tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module alu
   (D,
    zn_OBUF,
    cy_OBUF,
    O,
    \input1[7] ,
    CO,
    c0,
    cy_OBUF_inst_i_42,
    cy_OBUF_inst_i_20,
    minusOp_carry__0,
    \input1[3] ,
    \input1[7]_0 ,
    cy_OBUF_inst_i_27,
    \input2[0] ,
    \input1[7]_1 ,
    cy_OBUF_inst_i_26,
    \input1[0] ,
    \input1[7]_2 ,
    cy_OBUF_inst_i_25,
    input1_IBUF,
    S,
    c0_IBUF,
    zn_OBUF_inst_i_41,
    f_in_IBUF,
    s_IBUF,
    \showw_reg[7] ,
    zn_OBUF_inst_i_6,
    input2_IBUF,
    cy,
    cy_0,
    \showw_reg[2] ,
    \showw_reg[3] ,
    \showw_reg[4] ,
    \showw_reg[5] ,
    \showw_reg[6] ,
    \showw_reg[6]_0 ,
    \showw_reg[6]_1 ,
    zn_OBUF_inst_i_6_0,
    zn_OBUF_inst_i_5,
    \showw[3]_i_2 ,
    \showw[4]_i_2 ,
    zn_OBUF_inst_i_3,
    zn_OBUF_inst_i_2,
    \showw[7]_i_2 ,
    \showw[7]_i_3 ,
    zn_OBUF_inst_i_6_1,
    zn_OBUF_inst_i_5_0,
    \showw[3]_i_2_0 ,
    \showw[4]_i_2_0 ,
    zn_OBUF_inst_i_3_0,
    zn_OBUF_inst_i_2_0,
    \showw[7]_i_3_0 ,
    \showw[7]_i_2_0 ,
    zn_OBUF_inst_i_5_1,
    \showw[3]_i_2_1 ,
    \showw[4]_i_2_1 ,
    zn_OBUF_inst_i_3_1,
    zn_OBUF_inst_i_2_1,
    \showw[7]_i_3_1 ,
    \showw[7]_i_2_1 ,
    zn_OBUF_inst_i_22,
    \showw_reg[3]_i_5 ,
    \showw_reg[4]_i_5 ,
    zn_OBUF_inst_i_14,
    zn_OBUF_inst_i_10,
    \showw_reg[7]_i_10 ,
    \showw_reg[7]_i_6 ,
    cy_OBUF_inst_i_1,
    cy_OBUF_inst_i_1_0,
    zn_OBUF_inst_i_60,
    zn_OBUF_inst_i_60_0,
    DI,
    zn_OBUF_inst_i_60_1,
    zn_OBUF_inst_i_44,
    zn_OBUF_inst_i_58,
    zn_OBUF_inst_i_58_0,
    zn_OBUF_inst_i_56);
  output [7:0]D;
  output zn_OBUF;
  output cy_OBUF;
  output [3:0]O;
  output [3:0]\input1[7] ;
  output [0:0]CO;
  output [3:0]c0;
  output [3:0]cy_OBUF_inst_i_42;
  output [0:0]cy_OBUF_inst_i_20;
  output [0:0]minusOp_carry__0;
  output [3:0]\input1[3] ;
  output [3:0]\input1[7]_0 ;
  output [0:0]cy_OBUF_inst_i_27;
  output [3:0]\input2[0] ;
  output [3:0]\input1[7]_1 ;
  output [0:0]cy_OBUF_inst_i_26;
  output [3:0]\input1[0] ;
  output [3:0]\input1[7]_2 ;
  output [0:0]cy_OBUF_inst_i_25;
  input [7:0]input1_IBUF;
  input [3:0]S;
  input c0_IBUF;
  input [3:0]zn_OBUF_inst_i_41;
  input [1:0]f_in_IBUF;
  input [4:0]s_IBUF;
  input \showw_reg[7] ;
  input zn_OBUF_inst_i_6;
  input [7:0]input2_IBUF;
  input cy;
  input cy_0;
  input \showw_reg[2] ;
  input \showw_reg[3] ;
  input \showw_reg[4] ;
  input \showw_reg[5] ;
  input \showw_reg[6] ;
  input \showw_reg[6]_0 ;
  input \showw_reg[6]_1 ;
  input zn_OBUF_inst_i_6_0;
  input zn_OBUF_inst_i_5;
  input \showw[3]_i_2 ;
  input \showw[4]_i_2 ;
  input zn_OBUF_inst_i_3;
  input zn_OBUF_inst_i_2;
  input \showw[7]_i_2 ;
  input \showw[7]_i_3 ;
  input zn_OBUF_inst_i_6_1;
  input zn_OBUF_inst_i_5_0;
  input \showw[3]_i_2_0 ;
  input \showw[4]_i_2_0 ;
  input zn_OBUF_inst_i_3_0;
  input zn_OBUF_inst_i_2_0;
  input \showw[7]_i_3_0 ;
  input \showw[7]_i_2_0 ;
  input zn_OBUF_inst_i_5_1;
  input \showw[3]_i_2_1 ;
  input \showw[4]_i_2_1 ;
  input zn_OBUF_inst_i_3_1;
  input zn_OBUF_inst_i_2_1;
  input \showw[7]_i_3_1 ;
  input \showw[7]_i_2_1 ;
  input zn_OBUF_inst_i_22;
  input \showw_reg[3]_i_5 ;
  input \showw_reg[4]_i_5 ;
  input zn_OBUF_inst_i_14;
  input zn_OBUF_inst_i_10;
  input \showw_reg[7]_i_10 ;
  input \showw_reg[7]_i_6 ;
  input cy_OBUF_inst_i_1;
  input cy_OBUF_inst_i_1_0;
  input zn_OBUF_inst_i_60;
  input [0:0]zn_OBUF_inst_i_60_0;
  input [2:0]DI;
  input [0:0]zn_OBUF_inst_i_60_1;
  input [3:0]zn_OBUF_inst_i_44;
  input [0:0]zn_OBUF_inst_i_58;
  input [0:0]zn_OBUF_inst_i_58_0;
  input [0:0]zn_OBUF_inst_i_56;

  wire [0:0]CO;
  wire [7:0]D;
  wire [2:0]DI;
  wire [3:0]O;
  wire [3:0]S;
  wire [3:0]c0;
  wire c0_IBUF;
  wire cy;
  wire cy_0;
  wire cy_OBUF;
  wire cy_OBUF_inst_i_1;
  wire cy_OBUF_inst_i_1_0;
  wire [0:0]cy_OBUF_inst_i_20;
  wire [0:0]cy_OBUF_inst_i_25;
  wire [0:0]cy_OBUF_inst_i_26;
  wire [0:0]cy_OBUF_inst_i_27;
  wire [3:0]cy_OBUF_inst_i_42;
  wire [1:0]f_in_IBUF;
  wire [3:0]\input1[0] ;
  wire [3:0]\input1[3] ;
  wire [3:0]\input1[7] ;
  wire [3:0]\input1[7]_0 ;
  wire [3:0]\input1[7]_1 ;
  wire [3:0]\input1[7]_2 ;
  wire [7:0]input1_IBUF;
  wire [3:0]\input2[0] ;
  wire [7:0]input2_IBUF;
  wire [0:0]minusOp_carry__0;
  wire [4:0]s_IBUF;
  wire \showw[3]_i_2 ;
  wire \showw[3]_i_2_0 ;
  wire \showw[3]_i_2_1 ;
  wire \showw[4]_i_2 ;
  wire \showw[4]_i_2_0 ;
  wire \showw[4]_i_2_1 ;
  wire \showw[7]_i_2 ;
  wire \showw[7]_i_2_0 ;
  wire \showw[7]_i_2_1 ;
  wire \showw[7]_i_3 ;
  wire \showw[7]_i_3_0 ;
  wire \showw[7]_i_3_1 ;
  wire \showw_reg[2] ;
  wire \showw_reg[3] ;
  wire \showw_reg[3]_i_5 ;
  wire \showw_reg[4] ;
  wire \showw_reg[4]_i_5 ;
  wire \showw_reg[5] ;
  wire \showw_reg[6] ;
  wire \showw_reg[6]_0 ;
  wire \showw_reg[6]_1 ;
  wire \showw_reg[7] ;
  wire \showw_reg[7]_i_10 ;
  wire \showw_reg[7]_i_6 ;
  wire zn_OBUF;
  wire zn_OBUF_inst_i_10;
  wire zn_OBUF_inst_i_14;
  wire zn_OBUF_inst_i_2;
  wire zn_OBUF_inst_i_22;
  wire zn_OBUF_inst_i_2_0;
  wire zn_OBUF_inst_i_2_1;
  wire zn_OBUF_inst_i_3;
  wire zn_OBUF_inst_i_3_0;
  wire zn_OBUF_inst_i_3_1;
  wire [3:0]zn_OBUF_inst_i_41;
  wire [3:0]zn_OBUF_inst_i_44;
  wire zn_OBUF_inst_i_5;
  wire [0:0]zn_OBUF_inst_i_56;
  wire [0:0]zn_OBUF_inst_i_58;
  wire [0:0]zn_OBUF_inst_i_58_0;
  wire zn_OBUF_inst_i_5_0;
  wire zn_OBUF_inst_i_5_1;
  wire zn_OBUF_inst_i_6;
  wire zn_OBUF_inst_i_60;
  wire [0:0]zn_OBUF_inst_i_60_0;
  wire [0:0]zn_OBUF_inst_i_60_1;
  wire zn_OBUF_inst_i_6_0;
  wire zn_OBUF_inst_i_6_1;

  cal ls181
       (.CO(CO),
        .D(D),
        .DI({DI,c0_IBUF}),
        .O(O),
        .S(S),
        .c0(c0),
        .cy(cy),
        .cy_0(cy_0),
        .cy_OBUF(cy_OBUF),
        .cy_OBUF_inst_i_1_0(cy_OBUF_inst_i_1),
        .cy_OBUF_inst_i_1_1(cy_OBUF_inst_i_1_0),
        .cy_OBUF_inst_i_20_0(cy_OBUF_inst_i_20),
        .cy_OBUF_inst_i_25_0(cy_OBUF_inst_i_25),
        .cy_OBUF_inst_i_26_0(cy_OBUF_inst_i_26),
        .cy_OBUF_inst_i_27_0(cy_OBUF_inst_i_27),
        .cy_OBUF_inst_i_42_0(cy_OBUF_inst_i_42),
        .f_in_IBUF(f_in_IBUF),
        .\input1[0] (\input1[0] ),
        .\input1[3] (\input1[3] ),
        .\input1[7] (\input1[7] ),
        .\input1[7]_0 (\input1[7]_0 ),
        .\input1[7]_1 (\input1[7]_1 ),
        .\input1[7]_2 (\input1[7]_2 ),
        .input1_IBUF(input1_IBUF),
        .\input2[0] (\input2[0] ),
        .input2_IBUF(input2_IBUF),
        .minusOp_carry__0_0(minusOp_carry__0),
        .s_IBUF(s_IBUF),
        .\showw[3]_i_2_0 (\showw[3]_i_2 ),
        .\showw[3]_i_2_1 (\showw[3]_i_2_0 ),
        .\showw[3]_i_2_2 (\showw[3]_i_2_1 ),
        .\showw[4]_i_2_0 (\showw[4]_i_2 ),
        .\showw[4]_i_2_1 (\showw[4]_i_2_0 ),
        .\showw[4]_i_2_2 (\showw[4]_i_2_1 ),
        .\showw[7]_i_2_0 (\showw[7]_i_2 ),
        .\showw[7]_i_2_1 (\showw[7]_i_2_0 ),
        .\showw[7]_i_2_2 (\showw[7]_i_2_1 ),
        .\showw[7]_i_3_0 (\showw[7]_i_3 ),
        .\showw[7]_i_3_1 (\showw[7]_i_3_0 ),
        .\showw[7]_i_3_2 (\showw[7]_i_3_1 ),
        .\showw_reg[2] (\showw_reg[2] ),
        .\showw_reg[3] (\showw_reg[3] ),
        .\showw_reg[3]_i_5_0 (\showw_reg[3]_i_5 ),
        .\showw_reg[4] (\showw_reg[4] ),
        .\showw_reg[4]_i_5_0 (\showw_reg[4]_i_5 ),
        .\showw_reg[5] (\showw_reg[5] ),
        .\showw_reg[6] (\showw_reg[6] ),
        .\showw_reg[6]_0 (\showw_reg[6]_0 ),
        .\showw_reg[6]_1 (\showw_reg[6]_1 ),
        .\showw_reg[7] (\showw_reg[7] ),
        .\showw_reg[7]_i_10_0 (\showw_reg[7]_i_10 ),
        .\showw_reg[7]_i_6_0 (\showw_reg[7]_i_6 ),
        .zn_OBUF(zn_OBUF),
        .zn_OBUF_inst_i_10_0(zn_OBUF_inst_i_10),
        .zn_OBUF_inst_i_14_0(zn_OBUF_inst_i_14),
        .zn_OBUF_inst_i_22_0(zn_OBUF_inst_i_22),
        .zn_OBUF_inst_i_2_0(zn_OBUF_inst_i_2),
        .zn_OBUF_inst_i_2_1(zn_OBUF_inst_i_2_0),
        .zn_OBUF_inst_i_2_2(zn_OBUF_inst_i_2_1),
        .zn_OBUF_inst_i_3_0(zn_OBUF_inst_i_3),
        .zn_OBUF_inst_i_3_1(zn_OBUF_inst_i_3_0),
        .zn_OBUF_inst_i_3_2(zn_OBUF_inst_i_3_1),
        .zn_OBUF_inst_i_41_0(zn_OBUF_inst_i_41),
        .zn_OBUF_inst_i_44(zn_OBUF_inst_i_44),
        .zn_OBUF_inst_i_56(zn_OBUF_inst_i_56),
        .zn_OBUF_inst_i_58(zn_OBUF_inst_i_58),
        .zn_OBUF_inst_i_58_0(zn_OBUF_inst_i_58_0),
        .zn_OBUF_inst_i_5_0(zn_OBUF_inst_i_5),
        .zn_OBUF_inst_i_5_1(zn_OBUF_inst_i_5_0),
        .zn_OBUF_inst_i_5_2(zn_OBUF_inst_i_5_1),
        .zn_OBUF_inst_i_60(zn_OBUF_inst_i_60),
        .zn_OBUF_inst_i_60_0(zn_OBUF_inst_i_60_0),
        .zn_OBUF_inst_i_60_1(zn_OBUF_inst_i_60_1),
        .zn_OBUF_inst_i_6_0(zn_OBUF_inst_i_6),
        .zn_OBUF_inst_i_6_1(zn_OBUF_inst_i_6_0),
        .zn_OBUF_inst_i_6_2(zn_OBUF_inst_i_6_1));
endmodule

module cal
   (D,
    zn_OBUF,
    cy_OBUF,
    O,
    \input1[7] ,
    CO,
    c0,
    cy_OBUF_inst_i_42_0,
    cy_OBUF_inst_i_20_0,
    minusOp_carry__0_0,
    \input1[3] ,
    \input1[7]_0 ,
    cy_OBUF_inst_i_27_0,
    \input2[0] ,
    \input1[7]_1 ,
    cy_OBUF_inst_i_26_0,
    \input1[0] ,
    \input1[7]_2 ,
    cy_OBUF_inst_i_25_0,
    input1_IBUF,
    S,
    DI,
    zn_OBUF_inst_i_41_0,
    f_in_IBUF,
    s_IBUF,
    \showw_reg[7] ,
    zn_OBUF_inst_i_6_0,
    input2_IBUF,
    cy,
    cy_0,
    \showw_reg[2] ,
    \showw_reg[3] ,
    \showw_reg[4] ,
    \showw_reg[5] ,
    \showw_reg[6] ,
    \showw_reg[6]_0 ,
    \showw_reg[6]_1 ,
    zn_OBUF_inst_i_6_1,
    zn_OBUF_inst_i_5_0,
    \showw[3]_i_2_0 ,
    \showw[4]_i_2_0 ,
    zn_OBUF_inst_i_3_0,
    zn_OBUF_inst_i_2_0,
    \showw[7]_i_2_0 ,
    \showw[7]_i_3_0 ,
    zn_OBUF_inst_i_6_2,
    zn_OBUF_inst_i_5_1,
    \showw[3]_i_2_1 ,
    \showw[4]_i_2_1 ,
    zn_OBUF_inst_i_3_1,
    zn_OBUF_inst_i_2_1,
    \showw[7]_i_3_1 ,
    \showw[7]_i_2_1 ,
    zn_OBUF_inst_i_5_2,
    \showw[3]_i_2_2 ,
    \showw[4]_i_2_2 ,
    zn_OBUF_inst_i_3_2,
    zn_OBUF_inst_i_2_2,
    \showw[7]_i_3_2 ,
    \showw[7]_i_2_2 ,
    zn_OBUF_inst_i_22_0,
    \showw_reg[3]_i_5_0 ,
    \showw_reg[4]_i_5_0 ,
    zn_OBUF_inst_i_14_0,
    zn_OBUF_inst_i_10_0,
    \showw_reg[7]_i_10_0 ,
    \showw_reg[7]_i_6_0 ,
    cy_OBUF_inst_i_1_0,
    cy_OBUF_inst_i_1_1,
    zn_OBUF_inst_i_60,
    zn_OBUF_inst_i_60_0,
    zn_OBUF_inst_i_60_1,
    zn_OBUF_inst_i_44,
    zn_OBUF_inst_i_58,
    zn_OBUF_inst_i_58_0,
    zn_OBUF_inst_i_56);
  output [7:0]D;
  output zn_OBUF;
  output cy_OBUF;
  output [3:0]O;
  output [3:0]\input1[7] ;
  output [0:0]CO;
  output [3:0]c0;
  output [3:0]cy_OBUF_inst_i_42_0;
  output [0:0]cy_OBUF_inst_i_20_0;
  output [0:0]minusOp_carry__0_0;
  output [3:0]\input1[3] ;
  output [3:0]\input1[7]_0 ;
  output [0:0]cy_OBUF_inst_i_27_0;
  output [3:0]\input2[0] ;
  output [3:0]\input1[7]_1 ;
  output [0:0]cy_OBUF_inst_i_26_0;
  output [3:0]\input1[0] ;
  output [3:0]\input1[7]_2 ;
  output [0:0]cy_OBUF_inst_i_25_0;
  input [7:0]input1_IBUF;
  input [3:0]S;
  input [3:0]DI;
  input [3:0]zn_OBUF_inst_i_41_0;
  input [1:0]f_in_IBUF;
  input [4:0]s_IBUF;
  input \showw_reg[7] ;
  input zn_OBUF_inst_i_6_0;
  input [7:0]input2_IBUF;
  input cy;
  input cy_0;
  input \showw_reg[2] ;
  input \showw_reg[3] ;
  input \showw_reg[4] ;
  input \showw_reg[5] ;
  input \showw_reg[6] ;
  input \showw_reg[6]_0 ;
  input \showw_reg[6]_1 ;
  input zn_OBUF_inst_i_6_1;
  input zn_OBUF_inst_i_5_0;
  input \showw[3]_i_2_0 ;
  input \showw[4]_i_2_0 ;
  input zn_OBUF_inst_i_3_0;
  input zn_OBUF_inst_i_2_0;
  input \showw[7]_i_2_0 ;
  input \showw[7]_i_3_0 ;
  input zn_OBUF_inst_i_6_2;
  input zn_OBUF_inst_i_5_1;
  input \showw[3]_i_2_1 ;
  input \showw[4]_i_2_1 ;
  input zn_OBUF_inst_i_3_1;
  input zn_OBUF_inst_i_2_1;
  input \showw[7]_i_3_1 ;
  input \showw[7]_i_2_1 ;
  input zn_OBUF_inst_i_5_2;
  input \showw[3]_i_2_2 ;
  input \showw[4]_i_2_2 ;
  input zn_OBUF_inst_i_3_2;
  input zn_OBUF_inst_i_2_2;
  input \showw[7]_i_3_2 ;
  input \showw[7]_i_2_2 ;
  input zn_OBUF_inst_i_22_0;
  input \showw_reg[3]_i_5_0 ;
  input \showw_reg[4]_i_5_0 ;
  input zn_OBUF_inst_i_14_0;
  input zn_OBUF_inst_i_10_0;
  input \showw_reg[7]_i_10_0 ;
  input \showw_reg[7]_i_6_0 ;
  input cy_OBUF_inst_i_1_0;
  input cy_OBUF_inst_i_1_1;
  input zn_OBUF_inst_i_60;
  input [0:0]zn_OBUF_inst_i_60_0;
  input [0:0]zn_OBUF_inst_i_60_1;
  input [3:0]zn_OBUF_inst_i_44;
  input [0:0]zn_OBUF_inst_i_58;
  input [0:0]zn_OBUF_inst_i_58_0;
  input [0:0]zn_OBUF_inst_i_56;

  wire [0:0]CO;
  wire [7:0]D;
  wire [3:0]DI;
  wire [7:0]F9__8;
  wire [0:0]L0;
  wire [3:0]O;
  wire [3:9]R;
  wire [3:0]S;
  wire [3:0]c0;
  wire cy;
  wire cy_0;
  wire cy_OBUF;
  wire cy_OBUF_inst_i_1_0;
  wire cy_OBUF_inst_i_1_1;
  wire [0:0]cy_OBUF_inst_i_20_0;
  wire cy_OBUF_inst_i_20_n_0;
  wire cy_OBUF_inst_i_20_n_1;
  wire cy_OBUF_inst_i_20_n_2;
  wire cy_OBUF_inst_i_20_n_3;
  wire cy_OBUF_inst_i_21_n_0;
  wire cy_OBUF_inst_i_21_n_1;
  wire cy_OBUF_inst_i_21_n_2;
  wire cy_OBUF_inst_i_21_n_3;
  wire [0:0]cy_OBUF_inst_i_25_0;
  wire cy_OBUF_inst_i_25_n_0;
  wire cy_OBUF_inst_i_25_n_1;
  wire cy_OBUF_inst_i_25_n_2;
  wire cy_OBUF_inst_i_25_n_3;
  wire [0:0]cy_OBUF_inst_i_26_0;
  wire cy_OBUF_inst_i_26_n_0;
  wire cy_OBUF_inst_i_26_n_1;
  wire cy_OBUF_inst_i_26_n_2;
  wire cy_OBUF_inst_i_26_n_3;
  wire [0:0]cy_OBUF_inst_i_27_0;
  wire cy_OBUF_inst_i_27_n_0;
  wire cy_OBUF_inst_i_27_n_1;
  wire cy_OBUF_inst_i_27_n_2;
  wire cy_OBUF_inst_i_27_n_3;
  wire cy_OBUF_inst_i_2_n_0;
  wire cy_OBUF_inst_i_34_n_0;
  wire cy_OBUF_inst_i_34_n_1;
  wire cy_OBUF_inst_i_34_n_2;
  wire cy_OBUF_inst_i_34_n_3;
  wire cy_OBUF_inst_i_39_n_0;
  wire cy_OBUF_inst_i_3_n_0;
  wire cy_OBUF_inst_i_40_n_0;
  wire cy_OBUF_inst_i_41_n_0;
  wire [3:0]cy_OBUF_inst_i_42_0;
  wire cy_OBUF_inst_i_42_n_0;
  wire cy_OBUF_inst_i_43_n_0;
  wire cy_OBUF_inst_i_43_n_1;
  wire cy_OBUF_inst_i_43_n_2;
  wire cy_OBUF_inst_i_43_n_3;
  wire cy_OBUF_inst_i_44_n_0;
  wire cy_OBUF_inst_i_45_n_0;
  wire cy_OBUF_inst_i_46_n_0;
  wire cy_OBUF_inst_i_47_n_0;
  wire cy_OBUF_inst_i_56_n_0;
  wire cy_OBUF_inst_i_57_n_0;
  wire cy_OBUF_inst_i_58_n_0;
  wire cy_OBUF_inst_i_59_n_0;
  wire cy_OBUF_inst_i_60_n_0;
  wire cy_OBUF_inst_i_61_n_0;
  wire cy_OBUF_inst_i_62_n_0;
  wire cy_OBUF_inst_i_63_n_0;
  wire cy_OBUF_inst_i_64_n_0;
  wire cy_OBUF_inst_i_65_n_0;
  wire cy_OBUF_inst_i_66_n_0;
  wire cy_OBUF_inst_i_67_n_0;
  wire cy_OBUF_inst_i_6_n_3;
  wire cy_OBUF_inst_i_72_n_0;
  wire cy_OBUF_inst_i_73_n_0;
  wire cy_OBUF_inst_i_74_n_0;
  wire cy_OBUF_inst_i_76_n_0;
  wire cy_OBUF_inst_i_77_n_0;
  wire cy_OBUF_inst_i_78_n_0;
  wire cy_OBUF_inst_i_8_n_3;
  wire [8:0]data11;
  wire [8:0]data15;
  wire [1:0]f_in_IBUF;
  wire i___0_carry__0_i_1__0_n_0;
  wire i___0_carry__0_i_2__0_n_0;
  wire i___0_carry__0_i_3__0_n_0;
  wire i___0_carry__0_i_4__0_n_0;
  wire i___0_carry__0_i_5_n_0;
  wire i___0_carry__0_i_6_n_0;
  wire i___0_carry__0_i_7_n_0;
  wire i___0_carry__0_i_8_n_0;
  wire i___0_carry__1_i_1__0_n_0;
  wire i___0_carry__1_i_1_n_0;
  wire i___0_carry_i_1__0_n_0;
  wire i___0_carry_i_2__0_n_0;
  wire i___0_carry_i_2_n_0;
  wire i___0_carry_i_3__0_n_0;
  wire i___0_carry_i_3_n_0;
  wire i___0_carry_i_4__0_n_0;
  wire i___0_carry_i_4_n_0;
  wire i___0_carry_i_5__0_n_0;
  wire i___0_carry_i_5_n_0;
  wire i___0_carry_i_6__0_n_0;
  wire i___0_carry_i_6_n_0;
  wire i___0_carry_i_7_n_0;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire [3:0]\input1[0] ;
  wire [3:0]\input1[3] ;
  wire [3:0]\input1[7] ;
  wire [3:0]\input1[7]_0 ;
  wire [3:0]\input1[7]_1 ;
  wire [3:0]\input1[7]_2 ;
  wire [7:0]input1_IBUF;
  wire [3:0]\input2[0] ;
  wire [7:0]input2_IBUF;
  wire [0:0]minusOp_carry__0_0;
  wire minusOp_carry__0_n_0;
  wire minusOp_carry__0_n_1;
  wire minusOp_carry__0_n_2;
  wire minusOp_carry__0_n_3;
  wire minusOp_carry__0_n_4;
  wire minusOp_carry__0_n_5;
  wire minusOp_carry__0_n_6;
  wire minusOp_carry__0_n_7;
  wire minusOp_carry_i_2_n_0;
  wire minusOp_carry_i_3_n_0;
  wire minusOp_carry_i_4_n_0;
  wire minusOp_carry_i_5_n_0;
  wire minusOp_carry_n_0;
  wire minusOp_carry_n_1;
  wire minusOp_carry_n_2;
  wire minusOp_carry_n_3;
  wire minusOp_carry_n_4;
  wire minusOp_carry_n_5;
  wire minusOp_carry_n_6;
  wire minusOp_carry_n_7;
  wire \minusOp_inferred__1/i___0_carry__0_n_0 ;
  wire \minusOp_inferred__1/i___0_carry__0_n_1 ;
  wire \minusOp_inferred__1/i___0_carry__0_n_2 ;
  wire \minusOp_inferred__1/i___0_carry__0_n_3 ;
  wire \minusOp_inferred__1/i___0_carry_n_0 ;
  wire \minusOp_inferred__1/i___0_carry_n_1 ;
  wire \minusOp_inferred__1/i___0_carry_n_2 ;
  wire \minusOp_inferred__1/i___0_carry_n_3 ;
  wire \minusOp_inferred__2/i___0_carry__0_n_0 ;
  wire \minusOp_inferred__2/i___0_carry__0_n_1 ;
  wire \minusOp_inferred__2/i___0_carry__0_n_2 ;
  wire \minusOp_inferred__2/i___0_carry__0_n_3 ;
  wire \minusOp_inferred__2/i___0_carry_n_0 ;
  wire \minusOp_inferred__2/i___0_carry_n_1 ;
  wire \minusOp_inferred__2/i___0_carry_n_2 ;
  wire \minusOp_inferred__2/i___0_carry_n_3 ;
  wire \plusOp_inferred__6/i__carry__0_n_0 ;
  wire \plusOp_inferred__6/i__carry__0_n_1 ;
  wire \plusOp_inferred__6/i__carry__0_n_2 ;
  wire \plusOp_inferred__6/i__carry__0_n_3 ;
  wire \plusOp_inferred__6/i__carry__0_n_4 ;
  wire \plusOp_inferred__6/i__carry__0_n_5 ;
  wire \plusOp_inferred__6/i__carry__0_n_6 ;
  wire \plusOp_inferred__6/i__carry__0_n_7 ;
  wire \plusOp_inferred__6/i__carry_n_0 ;
  wire \plusOp_inferred__6/i__carry_n_1 ;
  wire \plusOp_inferred__6/i__carry_n_2 ;
  wire \plusOp_inferred__6/i__carry_n_3 ;
  wire \plusOp_inferred__6/i__carry_n_4 ;
  wire \plusOp_inferred__6/i__carry_n_5 ;
  wire \plusOp_inferred__6/i__carry_n_6 ;
  wire \plusOp_inferred__6/i__carry_n_7 ;
  wire \plusOp_inferred__8/i__carry__0_n_0 ;
  wire \plusOp_inferred__8/i__carry__0_n_1 ;
  wire \plusOp_inferred__8/i__carry__0_n_2 ;
  wire \plusOp_inferred__8/i__carry__0_n_3 ;
  wire \plusOp_inferred__8/i__carry__0_n_4 ;
  wire \plusOp_inferred__8/i__carry__0_n_5 ;
  wire \plusOp_inferred__8/i__carry__0_n_6 ;
  wire \plusOp_inferred__8/i__carry__0_n_7 ;
  wire \plusOp_inferred__8/i__carry_n_0 ;
  wire \plusOp_inferred__8/i__carry_n_1 ;
  wire \plusOp_inferred__8/i__carry_n_2 ;
  wire \plusOp_inferred__8/i__carry_n_3 ;
  wire \plusOp_inferred__8/i__carry_n_4 ;
  wire \plusOp_inferred__8/i__carry_n_5 ;
  wire \plusOp_inferred__8/i__carry_n_6 ;
  wire \plusOp_inferred__8/i__carry_n_7 ;
  wire [4:0]s_IBUF;
  wire \showw[3]_i_10_n_0 ;
  wire \showw[3]_i_12_n_0 ;
  wire \showw[3]_i_2_0 ;
  wire \showw[3]_i_2_1 ;
  wire \showw[3]_i_2_2 ;
  wire \showw[3]_i_8_n_0 ;
  wire \showw[4]_i_10_n_0 ;
  wire \showw[4]_i_12_n_0 ;
  wire \showw[4]_i_2_0 ;
  wire \showw[4]_i_2_1 ;
  wire \showw[4]_i_2_2 ;
  wire \showw[4]_i_8_n_0 ;
  wire \showw[7]_i_13_n_0 ;
  wire \showw[7]_i_15_n_0 ;
  wire \showw[7]_i_17_n_0 ;
  wire \showw[7]_i_21_n_0 ;
  wire \showw[7]_i_23_n_0 ;
  wire \showw[7]_i_25_n_0 ;
  wire \showw[7]_i_2_0 ;
  wire \showw[7]_i_2_1 ;
  wire \showw[7]_i_2_2 ;
  wire \showw[7]_i_3_0 ;
  wire \showw[7]_i_3_1 ;
  wire \showw[7]_i_3_2 ;
  wire \showw_reg[2] ;
  wire \showw_reg[3] ;
  wire \showw_reg[3]_i_3_n_0 ;
  wire \showw_reg[3]_i_4_n_0 ;
  wire \showw_reg[3]_i_5_0 ;
  wire \showw_reg[3]_i_5_n_0 ;
  wire \showw_reg[4] ;
  wire \showw_reg[4]_i_3_n_0 ;
  wire \showw_reg[4]_i_4_n_0 ;
  wire \showw_reg[4]_i_5_0 ;
  wire \showw_reg[4]_i_5_n_0 ;
  wire \showw_reg[5] ;
  wire \showw_reg[6] ;
  wire \showw_reg[6]_0 ;
  wire \showw_reg[6]_1 ;
  wire \showw_reg[7] ;
  wire \showw_reg[7]_i_10_0 ;
  wire \showw_reg[7]_i_10_n_0 ;
  wire \showw_reg[7]_i_4_n_0 ;
  wire \showw_reg[7]_i_5_n_0 ;
  wire \showw_reg[7]_i_6_0 ;
  wire \showw_reg[7]_i_6_n_0 ;
  wire \showw_reg[7]_i_8_n_0 ;
  wire \showw_reg[7]_i_9_n_0 ;
  wire zn_OBUF;
  wire zn_OBUF_inst_i_10_0;
  wire zn_OBUF_inst_i_10_n_0;
  wire zn_OBUF_inst_i_12_n_0;
  wire zn_OBUF_inst_i_13_n_0;
  wire zn_OBUF_inst_i_14_0;
  wire zn_OBUF_inst_i_14_n_0;
  wire zn_OBUF_inst_i_16_n_0;
  wire zn_OBUF_inst_i_17_n_0;
  wire zn_OBUF_inst_i_18_n_0;
  wire zn_OBUF_inst_i_19_n_0;
  wire zn_OBUF_inst_i_20_n_0;
  wire zn_OBUF_inst_i_21_n_0;
  wire zn_OBUF_inst_i_22_0;
  wire zn_OBUF_inst_i_22_n_0;
  wire zn_OBUF_inst_i_24_n_0;
  wire zn_OBUF_inst_i_25_n_0;
  wire zn_OBUF_inst_i_26_n_0;
  wire zn_OBUF_inst_i_28_n_0;
  wire zn_OBUF_inst_i_29_n_0;
  wire zn_OBUF_inst_i_2_0;
  wire zn_OBUF_inst_i_2_1;
  wire zn_OBUF_inst_i_2_2;
  wire zn_OBUF_inst_i_30_n_0;
  wire zn_OBUF_inst_i_31_n_0;
  wire zn_OBUF_inst_i_33_n_0;
  wire zn_OBUF_inst_i_35_n_0;
  wire zn_OBUF_inst_i_37_n_0;
  wire zn_OBUF_inst_i_3_0;
  wire zn_OBUF_inst_i_3_1;
  wire zn_OBUF_inst_i_3_2;
  wire [3:0]zn_OBUF_inst_i_41_0;
  wire zn_OBUF_inst_i_41_n_0;
  wire zn_OBUF_inst_i_43_n_0;
  wire [3:0]zn_OBUF_inst_i_44;
  wire zn_OBUF_inst_i_45_n_0;
  wire zn_OBUF_inst_i_49_n_0;
  wire zn_OBUF_inst_i_4_n_0;
  wire zn_OBUF_inst_i_51_n_0;
  wire zn_OBUF_inst_i_53_n_0;
  wire [0:0]zn_OBUF_inst_i_56;
  wire zn_OBUF_inst_i_57_n_0;
  wire [0:0]zn_OBUF_inst_i_58;
  wire [0:0]zn_OBUF_inst_i_58_0;
  wire zn_OBUF_inst_i_59_n_0;
  wire zn_OBUF_inst_i_5_0;
  wire zn_OBUF_inst_i_5_1;
  wire zn_OBUF_inst_i_5_2;
  wire zn_OBUF_inst_i_60;
  wire [0:0]zn_OBUF_inst_i_60_0;
  wire [0:0]zn_OBUF_inst_i_60_1;
  wire zn_OBUF_inst_i_61_n_0;
  wire zn_OBUF_inst_i_69_n_0;
  wire zn_OBUF_inst_i_69_n_1;
  wire zn_OBUF_inst_i_69_n_2;
  wire zn_OBUF_inst_i_69_n_3;
  wire zn_OBUF_inst_i_6_0;
  wire zn_OBUF_inst_i_6_1;
  wire zn_OBUF_inst_i_6_2;
  wire zn_OBUF_inst_i_70_n_0;
  wire zn_OBUF_inst_i_70_n_1;
  wire zn_OBUF_inst_i_70_n_2;
  wire zn_OBUF_inst_i_70_n_3;
  wire zn_OBUF_inst_i_71_n_0;
  wire zn_OBUF_inst_i_71_n_1;
  wire zn_OBUF_inst_i_71_n_2;
  wire zn_OBUF_inst_i_71_n_3;
  wire zn_OBUF_inst_i_77_n_0;
  wire zn_OBUF_inst_i_78_n_0;
  wire zn_OBUF_inst_i_79_n_0;
  wire zn_OBUF_inst_i_7_n_0;
  wire zn_OBUF_inst_i_81_n_0;
  wire zn_OBUF_inst_i_82_n_0;
  wire zn_OBUF_inst_i_83_n_0;
  wire zn_OBUF_inst_i_85_n_0;
  wire zn_OBUF_inst_i_86_n_0;
  wire zn_OBUF_inst_i_87_n_0;
  wire zn_OBUF_inst_i_8_n_0;
  wire zn_OBUF_inst_i_9_n_0;
  wire [3:1]NLW_cy_OBUF_inst_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_11_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_12_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_12_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_15_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_15_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_16_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_16_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_17_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_17_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_19_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_19_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_6_O_UNCONNECTED;
  wire [3:1]NLW_cy_OBUF_inst_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_cy_OBUF_inst_i_8_O_UNCONNECTED;
  wire [3:0]\NLW_minusOp_inferred__1/i___0_carry__1_CO_UNCONNECTED ;
  wire [3:1]\NLW_minusOp_inferred__1/i___0_carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_minusOp_inferred__2/i___0_carry__1_CO_UNCONNECTED ;
  wire [3:1]\NLW_minusOp_inferred__2/i___0_carry__1_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    cy_OBUF_inst_i_1
       (.I0(cy_OBUF_inst_i_2_n_0),
        .I1(cy_OBUF_inst_i_3_n_0),
        .I2(s_IBUF[3]),
        .I3(cy),
        .I4(s_IBUF[2]),
        .I5(cy_0),
        .O(cy_OBUF));
  CARRY4 cy_OBUF_inst_i_11
       (.CI(cy_OBUF_inst_i_20_n_0),
        .CO({NLW_cy_OBUF_inst_i_11_CO_UNCONNECTED[3:1],cy_OBUF_inst_i_20_0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_11_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 cy_OBUF_inst_i_12
       (.CI(cy_OBUF_inst_i_21_n_0),
        .CO({NLW_cy_OBUF_inst_i_12_CO_UNCONNECTED[3:1],CO}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_12_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 cy_OBUF_inst_i_15
       (.CI(cy_OBUF_inst_i_25_n_0),
        .CO({NLW_cy_OBUF_inst_i_15_CO_UNCONNECTED[3:1],cy_OBUF_inst_i_25_0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_15_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 cy_OBUF_inst_i_16
       (.CI(cy_OBUF_inst_i_26_n_0),
        .CO({NLW_cy_OBUF_inst_i_16_CO_UNCONNECTED[3:1],cy_OBUF_inst_i_26_0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_16_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 cy_OBUF_inst_i_17
       (.CI(cy_OBUF_inst_i_27_n_0),
        .CO({NLW_cy_OBUF_inst_i_17_CO_UNCONNECTED[3:1],cy_OBUF_inst_i_27_0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_17_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 cy_OBUF_inst_i_19
       (.CI(minusOp_carry__0_n_0),
        .CO({NLW_cy_OBUF_inst_i_19_CO_UNCONNECTED[3:1],minusOp_carry__0_0}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_19_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT6 #(
    .INIT(64'h888BFFFF888B0000)) 
    cy_OBUF_inst_i_2
       (.I0(data15[8]),
        .I1(s_IBUF[0]),
        .I2(cy_OBUF_inst_i_6_n_3),
        .I3(s_IBUF[4]),
        .I4(s_IBUF[1]),
        .I5(cy_OBUF_inst_i_1_1),
        .O(cy_OBUF_inst_i_2_n_0));
  CARRY4 cy_OBUF_inst_i_20
       (.CI(cy_OBUF_inst_i_34_n_0),
        .CO({cy_OBUF_inst_i_20_n_0,cy_OBUF_inst_i_20_n_1,cy_OBUF_inst_i_20_n_2,cy_OBUF_inst_i_20_n_3}),
        .CYINIT(1'b0),
        .DI(zn_OBUF_inst_i_44),
        .O(cy_OBUF_inst_i_42_0),
        .S({cy_OBUF_inst_i_39_n_0,cy_OBUF_inst_i_40_n_0,cy_OBUF_inst_i_41_n_0,cy_OBUF_inst_i_42_n_0}));
  CARRY4 cy_OBUF_inst_i_21
       (.CI(cy_OBUF_inst_i_43_n_0),
        .CO({cy_OBUF_inst_i_21_n_0,cy_OBUF_inst_i_21_n_1,cy_OBUF_inst_i_21_n_2,cy_OBUF_inst_i_21_n_3}),
        .CYINIT(1'b0),
        .DI(input1_IBUF[7:4]),
        .O(\input1[7] ),
        .S({cy_OBUF_inst_i_44_n_0,cy_OBUF_inst_i_45_n_0,cy_OBUF_inst_i_46_n_0,cy_OBUF_inst_i_47_n_0}));
  CARRY4 cy_OBUF_inst_i_25
       (.CI(zn_OBUF_inst_i_69_n_0),
        .CO({cy_OBUF_inst_i_25_n_0,cy_OBUF_inst_i_25_n_1,cy_OBUF_inst_i_25_n_2,cy_OBUF_inst_i_25_n_3}),
        .CYINIT(1'b0),
        .DI(input1_IBUF[7:4]),
        .O(\input1[7]_2 ),
        .S({cy_OBUF_inst_i_56_n_0,cy_OBUF_inst_i_57_n_0,cy_OBUF_inst_i_58_n_0,cy_OBUF_inst_i_59_n_0}));
  CARRY4 cy_OBUF_inst_i_26
       (.CI(zn_OBUF_inst_i_70_n_0),
        .CO({cy_OBUF_inst_i_26_n_0,cy_OBUF_inst_i_26_n_1,cy_OBUF_inst_i_26_n_2,cy_OBUF_inst_i_26_n_3}),
        .CYINIT(1'b0),
        .DI(input1_IBUF[7:4]),
        .O(\input1[7]_1 ),
        .S({cy_OBUF_inst_i_60_n_0,cy_OBUF_inst_i_61_n_0,cy_OBUF_inst_i_62_n_0,cy_OBUF_inst_i_63_n_0}));
  CARRY4 cy_OBUF_inst_i_27
       (.CI(zn_OBUF_inst_i_71_n_0),
        .CO({cy_OBUF_inst_i_27_n_0,cy_OBUF_inst_i_27_n_1,cy_OBUF_inst_i_27_n_2,cy_OBUF_inst_i_27_n_3}),
        .CYINIT(1'b0),
        .DI(input1_IBUF[7:4]),
        .O(\input1[7]_0 ),
        .S({cy_OBUF_inst_i_64_n_0,cy_OBUF_inst_i_65_n_0,cy_OBUF_inst_i_66_n_0,cy_OBUF_inst_i_67_n_0}));
  LUT6 #(
    .INIT(64'h888BFFFF888B0000)) 
    cy_OBUF_inst_i_3
       (.I0(data11[8]),
        .I1(s_IBUF[0]),
        .I2(cy_OBUF_inst_i_8_n_3),
        .I3(s_IBUF[4]),
        .I4(s_IBUF[1]),
        .I5(cy_OBUF_inst_i_1_0),
        .O(cy_OBUF_inst_i_3_n_0));
  CARRY4 cy_OBUF_inst_i_34
       (.CI(1'b0),
        .CO({cy_OBUF_inst_i_34_n_0,cy_OBUF_inst_i_34_n_1,cy_OBUF_inst_i_34_n_2,cy_OBUF_inst_i_34_n_3}),
        .CYINIT(zn_OBUF_inst_i_60),
        .DI(DI),
        .O(c0),
        .S({cy_OBUF_inst_i_72_n_0,cy_OBUF_inst_i_73_n_0,cy_OBUF_inst_i_74_n_0,zn_OBUF_inst_i_60_1}));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_39
       (.I0(input2_IBUF[7]),
        .O(cy_OBUF_inst_i_39_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_40
       (.I0(input2_IBUF[6]),
        .O(cy_OBUF_inst_i_40_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_41
       (.I0(input2_IBUF[5]),
        .O(cy_OBUF_inst_i_41_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_42
       (.I0(input2_IBUF[4]),
        .O(cy_OBUF_inst_i_42_n_0));
  CARRY4 cy_OBUF_inst_i_43
       (.CI(1'b0),
        .CO({cy_OBUF_inst_i_43_n_0,cy_OBUF_inst_i_43_n_1,cy_OBUF_inst_i_43_n_2,cy_OBUF_inst_i_43_n_3}),
        .CYINIT(zn_OBUF_inst_i_60),
        .DI(input1_IBUF[3:0]),
        .O(O),
        .S({cy_OBUF_inst_i_76_n_0,cy_OBUF_inst_i_77_n_0,cy_OBUF_inst_i_78_n_0,zn_OBUF_inst_i_60_0}));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_44
       (.I0(input2_IBUF[7]),
        .I1(input1_IBUF[7]),
        .O(cy_OBUF_inst_i_44_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_45
       (.I0(input2_IBUF[6]),
        .I1(input1_IBUF[6]),
        .O(cy_OBUF_inst_i_45_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_46
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .O(cy_OBUF_inst_i_46_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_47
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .O(cy_OBUF_inst_i_47_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    cy_OBUF_inst_i_56
       (.I0(input2_IBUF[7]),
        .I1(input1_IBUF[7]),
        .O(cy_OBUF_inst_i_56_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    cy_OBUF_inst_i_57
       (.I0(input2_IBUF[6]),
        .I1(input1_IBUF[6]),
        .O(cy_OBUF_inst_i_57_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    cy_OBUF_inst_i_58
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .O(cy_OBUF_inst_i_58_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    cy_OBUF_inst_i_59
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .O(cy_OBUF_inst_i_59_n_0));
  CARRY4 cy_OBUF_inst_i_6
       (.CI(\plusOp_inferred__8/i__carry__0_n_0 ),
        .CO({NLW_cy_OBUF_inst_i_6_CO_UNCONNECTED[3:1],cy_OBUF_inst_i_6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_6_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h6)) 
    cy_OBUF_inst_i_60
       (.I0(input1_IBUF[7]),
        .I1(input2_IBUF[7]),
        .O(cy_OBUF_inst_i_60_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    cy_OBUF_inst_i_61
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(cy_OBUF_inst_i_61_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    cy_OBUF_inst_i_62
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(cy_OBUF_inst_i_62_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    cy_OBUF_inst_i_63
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(cy_OBUF_inst_i_63_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    cy_OBUF_inst_i_64
       (.I0(input2_IBUF[7]),
        .I1(input1_IBUF[7]),
        .O(cy_OBUF_inst_i_64_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    cy_OBUF_inst_i_65
       (.I0(input2_IBUF[6]),
        .I1(input1_IBUF[6]),
        .O(cy_OBUF_inst_i_65_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    cy_OBUF_inst_i_66
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .O(cy_OBUF_inst_i_66_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    cy_OBUF_inst_i_67
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .O(cy_OBUF_inst_i_67_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_72
       (.I0(input2_IBUF[3]),
        .O(cy_OBUF_inst_i_72_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_73
       (.I0(input2_IBUF[2]),
        .O(cy_OBUF_inst_i_73_n_0));
  LUT1 #(
    .INIT(2'h2)) 
    cy_OBUF_inst_i_74
       (.I0(input2_IBUF[1]),
        .O(cy_OBUF_inst_i_74_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_76
       (.I0(input2_IBUF[3]),
        .I1(input1_IBUF[3]),
        .O(cy_OBUF_inst_i_76_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_77
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .O(cy_OBUF_inst_i_77_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    cy_OBUF_inst_i_78
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .O(cy_OBUF_inst_i_78_n_0));
  CARRY4 cy_OBUF_inst_i_8
       (.CI(\plusOp_inferred__6/i__carry__0_n_0 ),
        .CO({NLW_cy_OBUF_inst_i_8_CO_UNCONNECTED[3:1],cy_OBUF_inst_i_8_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cy_OBUF_inst_i_8_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h8)) 
    i___0_carry__0_i_1
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(R[3]));
  LUT2 #(
    .INIT(4'h9)) 
    i___0_carry__0_i_1__0
       (.I0(input1_IBUF[6]),
        .I1(input1_IBUF[7]),
        .O(i___0_carry__0_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___0_carry__0_i_2
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(R[4]));
  LUT2 #(
    .INIT(4'h9)) 
    i___0_carry__0_i_2__0
       (.I0(input1_IBUF[5]),
        .I1(input1_IBUF[6]),
        .O(i___0_carry__0_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___0_carry__0_i_3
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(R[5]));
  LUT2 #(
    .INIT(4'h9)) 
    i___0_carry__0_i_3__0
       (.I0(input1_IBUF[4]),
        .I1(input1_IBUF[5]),
        .O(i___0_carry__0_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___0_carry__0_i_4
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(R[6]));
  LUT2 #(
    .INIT(4'h9)) 
    i___0_carry__0_i_4__0
       (.I0(input1_IBUF[3]),
        .I1(input1_IBUF[4]),
        .O(i___0_carry__0_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    i___0_carry__0_i_5
       (.I0(input2_IBUF[6]),
        .I1(input1_IBUF[6]),
        .I2(input2_IBUF[7]),
        .I3(input1_IBUF[7]),
        .O(i___0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    i___0_carry__0_i_6
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .I2(input2_IBUF[6]),
        .I3(input1_IBUF[6]),
        .O(i___0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    i___0_carry__0_i_7
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .I2(input2_IBUF[5]),
        .I3(input1_IBUF[5]),
        .O(i___0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    i___0_carry__0_i_8
       (.I0(input2_IBUF[3]),
        .I1(input1_IBUF[3]),
        .I2(input2_IBUF[4]),
        .I3(input1_IBUF[4]),
        .O(i___0_carry__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    i___0_carry__1_i_1
       (.I0(input2_IBUF[7]),
        .I1(input1_IBUF[7]),
        .O(i___0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___0_carry__1_i_1__0
       (.I0(input1_IBUF[7]),
        .O(i___0_carry__1_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___0_carry_i_1
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(R[7]));
  LUT2 #(
    .INIT(4'h8)) 
    i___0_carry_i_1__0
       (.I0(input1_IBUF[1]),
        .I1(s_IBUF[4]),
        .O(i___0_carry_i_1__0_n_0));
  LUT3 #(
    .INIT(8'h31)) 
    i___0_carry_i_2
       (.I0(DI[0]),
        .I1(s_IBUF[4]),
        .I2(input1_IBUF[0]),
        .O(i___0_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    i___0_carry_i_2__0
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .I2(s_IBUF[4]),
        .O(i___0_carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h3111)) 
    i___0_carry_i_3
       (.I0(DI[0]),
        .I1(s_IBUF[4]),
        .I2(input2_IBUF[0]),
        .I3(input1_IBUF[0]),
        .O(i___0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___0_carry_i_3__0
       (.I0(input1_IBUF[2]),
        .I1(input1_IBUF[3]),
        .O(i___0_carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    i___0_carry_i_4
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .I2(input2_IBUF[3]),
        .I3(input1_IBUF[3]),
        .O(i___0_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h87)) 
    i___0_carry_i_4__0
       (.I0(s_IBUF[4]),
        .I1(input1_IBUF[1]),
        .I2(input1_IBUF[2]),
        .O(i___0_carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h04FB)) 
    i___0_carry_i_5
       (.I0(input1_IBUF[0]),
        .I1(DI[0]),
        .I2(s_IBUF[4]),
        .I3(input1_IBUF[1]),
        .O(i___0_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h807F7F7F)) 
    i___0_carry_i_5__0
       (.I0(s_IBUF[4]),
        .I1(input1_IBUF[1]),
        .I2(input2_IBUF[1]),
        .I3(input2_IBUF[2]),
        .I4(input1_IBUF[2]),
        .O(i___0_carry_i_5__0_n_0));
  LUT6 #(
    .INIT(64'h0070FF8FFF8FFF8F)) 
    i___0_carry_i_6
       (.I0(input1_IBUF[0]),
        .I1(input2_IBUF[0]),
        .I2(DI[0]),
        .I3(s_IBUF[4]),
        .I4(input1_IBUF[1]),
        .I5(input2_IBUF[1]),
        .O(i___0_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    i___0_carry_i_6__0
       (.I0(input1_IBUF[0]),
        .I1(s_IBUF[4]),
        .I2(DI[0]),
        .O(i___0_carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h7877)) 
    i___0_carry_i_7
       (.I0(input2_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(s_IBUF[4]),
        .I3(DI[0]),
        .O(i___0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry__0_i_1__0
       (.I0(input1_IBUF[7]),
        .I1(input2_IBUF[7]),
        .O(i__carry__0_i_1__0_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry__0_i_2__0
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(i__carry__0_i_2__0_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry__0_i_3__0
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(i__carry__0_i_3__0_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry__0_i_4__0
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(i__carry__0_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_5
       (.I0(input2_IBUF[7]),
        .O(i__carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_6
       (.I0(input2_IBUF[6]),
        .O(i__carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_7
       (.I0(input2_IBUF[5]),
        .O(i__carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_8
       (.I0(input2_IBUF[4]),
        .O(i__carry__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_1
       (.I0(input1_IBUF[0]),
        .I1(input2_IBUF[0]),
        .O(R[9]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_1__0
       (.I0(input2_IBUF[3]),
        .I1(input1_IBUF[3]),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_2
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry_i_2__0
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(i__carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry_i_3
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry_i_3__0
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(i__carry_i_3__0_n_0));
  LUT3 #(
    .INIT(8'h2D)) 
    i__carry_i_4
       (.I0(input2_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(DI[0]),
        .O(i__carry_i_4_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    i__carry_i_4__0
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .O(i__carry_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_5
       (.I0(input2_IBUF[3]),
        .O(i__carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_6
       (.I0(input2_IBUF[2]),
        .O(i__carry_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_7
       (.I0(input2_IBUF[1]),
        .O(i__carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h2D)) 
    i__carry_i_8
       (.I0(input2_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(DI[0]),
        .O(i__carry_i_8_n_0));
  CARRY4 minusOp_carry
       (.CI(1'b0),
        .CO({minusOp_carry_n_0,minusOp_carry_n_1,minusOp_carry_n_2,minusOp_carry_n_3}),
        .CYINIT(L0),
        .DI(input1_IBUF[3:0]),
        .O({minusOp_carry_n_4,minusOp_carry_n_5,minusOp_carry_n_6,minusOp_carry_n_7}),
        .S({minusOp_carry_i_2_n_0,minusOp_carry_i_3_n_0,minusOp_carry_i_4_n_0,minusOp_carry_i_5_n_0}));
  CARRY4 minusOp_carry__0
       (.CI(minusOp_carry_n_0),
        .CO({minusOp_carry__0_n_0,minusOp_carry__0_n_1,minusOp_carry__0_n_2,minusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(input1_IBUF[7:4]),
        .O({minusOp_carry__0_n_4,minusOp_carry__0_n_5,minusOp_carry__0_n_6,minusOp_carry__0_n_7}),
        .S(S));
  LUT1 #(
    .INIT(2'h1)) 
    minusOp_carry_i_1
       (.I0(input2_IBUF[0]),
        .O(L0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_2
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(minusOp_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_3
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(minusOp_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_4
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .O(minusOp_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry_i_5
       (.I0(DI[0]),
        .I1(input1_IBUF[0]),
        .O(minusOp_carry_i_5_n_0));
  CARRY4 \minusOp_inferred__1/i___0_carry 
       (.CI(1'b0),
        .CO({\minusOp_inferred__1/i___0_carry_n_0 ,\minusOp_inferred__1/i___0_carry_n_1 ,\minusOp_inferred__1/i___0_carry_n_2 ,\minusOp_inferred__1/i___0_carry_n_3 }),
        .CYINIT(1'b1),
        .DI({R[7],i___0_carry_i_2__0_n_0,i___0_carry_i_3_n_0,1'b1}),
        .O(data11[3:0]),
        .S({i___0_carry_i_4_n_0,i___0_carry_i_5__0_n_0,i___0_carry_i_6_n_0,i___0_carry_i_7_n_0}));
  CARRY4 \minusOp_inferred__1/i___0_carry__0 
       (.CI(\minusOp_inferred__1/i___0_carry_n_0 ),
        .CO({\minusOp_inferred__1/i___0_carry__0_n_0 ,\minusOp_inferred__1/i___0_carry__0_n_1 ,\minusOp_inferred__1/i___0_carry__0_n_2 ,\minusOp_inferred__1/i___0_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({R[3],R[4],R[5],R[6]}),
        .O(data11[7:4]),
        .S({i___0_carry__0_i_5_n_0,i___0_carry__0_i_6_n_0,i___0_carry__0_i_7_n_0,i___0_carry__0_i_8_n_0}));
  CARRY4 \minusOp_inferred__1/i___0_carry__1 
       (.CI(\minusOp_inferred__1/i___0_carry__0_n_0 ),
        .CO(\NLW_minusOp_inferred__1/i___0_carry__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_minusOp_inferred__1/i___0_carry__1_O_UNCONNECTED [3:1],data11[8]}),
        .S({1'b0,1'b0,1'b0,i___0_carry__1_i_1_n_0}));
  CARRY4 \minusOp_inferred__2/i___0_carry 
       (.CI(1'b0),
        .CO({\minusOp_inferred__2/i___0_carry_n_0 ,\minusOp_inferred__2/i___0_carry_n_1 ,\minusOp_inferred__2/i___0_carry_n_2 ,\minusOp_inferred__2/i___0_carry_n_3 }),
        .CYINIT(1'b1),
        .DI({input1_IBUF[2],i___0_carry_i_1__0_n_0,i___0_carry_i_2_n_0,1'b1}),
        .O(data15[3:0]),
        .S({i___0_carry_i_3__0_n_0,i___0_carry_i_4__0_n_0,i___0_carry_i_5_n_0,i___0_carry_i_6__0_n_0}));
  CARRY4 \minusOp_inferred__2/i___0_carry__0 
       (.CI(\minusOp_inferred__2/i___0_carry_n_0 ),
        .CO({\minusOp_inferred__2/i___0_carry__0_n_0 ,\minusOp_inferred__2/i___0_carry__0_n_1 ,\minusOp_inferred__2/i___0_carry__0_n_2 ,\minusOp_inferred__2/i___0_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(input1_IBUF[6:3]),
        .O(data15[7:4]),
        .S({i___0_carry__0_i_1__0_n_0,i___0_carry__0_i_2__0_n_0,i___0_carry__0_i_3__0_n_0,i___0_carry__0_i_4__0_n_0}));
  CARRY4 \minusOp_inferred__2/i___0_carry__1 
       (.CI(\minusOp_inferred__2/i___0_carry__0_n_0 ),
        .CO(\NLW_minusOp_inferred__2/i___0_carry__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_minusOp_inferred__2/i___0_carry__1_O_UNCONNECTED [3:1],data15[8]}),
        .S({1'b0,1'b0,1'b0,i___0_carry__1_i_1__0_n_0}));
  CARRY4 \plusOp_inferred__6/i__carry 
       (.CI(1'b0),
        .CO({\plusOp_inferred__6/i__carry_n_0 ,\plusOp_inferred__6/i__carry_n_1 ,\plusOp_inferred__6/i__carry_n_2 ,\plusOp_inferred__6/i__carry_n_3 }),
        .CYINIT(R[9]),
        .DI({i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0,DI[0]}),
        .O({\plusOp_inferred__6/i__carry_n_4 ,\plusOp_inferred__6/i__carry_n_5 ,\plusOp_inferred__6/i__carry_n_6 ,\plusOp_inferred__6/i__carry_n_7 }),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  CARRY4 \plusOp_inferred__6/i__carry__0 
       (.CI(\plusOp_inferred__6/i__carry_n_0 ),
        .CO({\plusOp_inferred__6/i__carry__0_n_0 ,\plusOp_inferred__6/i__carry__0_n_1 ,\plusOp_inferred__6/i__carry__0_n_2 ,\plusOp_inferred__6/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}),
        .O({\plusOp_inferred__6/i__carry__0_n_4 ,\plusOp_inferred__6/i__carry__0_n_5 ,\plusOp_inferred__6/i__carry__0_n_6 ,\plusOp_inferred__6/i__carry__0_n_7 }),
        .S({i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0,i__carry__0_i_8_n_0}));
  CARRY4 \plusOp_inferred__8/i__carry 
       (.CI(1'b0),
        .CO({\plusOp_inferred__8/i__carry_n_0 ,\plusOp_inferred__8/i__carry_n_1 ,\plusOp_inferred__8/i__carry_n_2 ,\plusOp_inferred__8/i__carry_n_3 }),
        .CYINIT(input1_IBUF[0]),
        .DI({input1_IBUF[3:1],DI[0]}),
        .O({\plusOp_inferred__8/i__carry_n_4 ,\plusOp_inferred__8/i__carry_n_5 ,\plusOp_inferred__8/i__carry_n_6 ,\plusOp_inferred__8/i__carry_n_7 }),
        .S({i__carry_i_1__0_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  CARRY4 \plusOp_inferred__8/i__carry__0 
       (.CI(\plusOp_inferred__8/i__carry_n_0 ),
        .CO({\plusOp_inferred__8/i__carry__0_n_0 ,\plusOp_inferred__8/i__carry__0_n_1 ,\plusOp_inferred__8/i__carry__0_n_2 ,\plusOp_inferred__8/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(input1_IBUF[7:4]),
        .O({\plusOp_inferred__8/i__carry__0_n_4 ,\plusOp_inferred__8/i__carry__0_n_5 ,\plusOp_inferred__8/i__carry__0_n_6 ,\plusOp_inferred__8/i__carry__0_n_7 }),
        .S(zn_OBUF_inst_i_41_0));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \showw[0]_i_1 
       (.I0(F9__8[1]),
        .I1(F9__8[0]),
        .I2(f_in_IBUF[1]),
        .I3(f_in_IBUF[0]),
        .I4(F9__8[7]),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[1]_i_1 
       (.I0(F9__8[2]),
        .I1(F9__8[1]),
        .I2(F9__8[0]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[2]_i_1 
       (.I0(F9__8[3]),
        .I1(F9__8[2]),
        .I2(F9__8[1]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[3]_i_1 
       (.I0(F9__8[4]),
        .I1(F9__8[3]),
        .I2(F9__8[2]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[3]));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    \showw[3]_i_10 
       (.I0(data11[2]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[2]),
        .I3(\plusOp_inferred__6/i__carry_n_5 ),
        .I4(s_IBUF[4]),
        .O(\showw[3]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    \showw[3]_i_12 
       (.I0(\showw_reg[3]_i_5_0 ),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[2]),
        .I3(input1_IBUF[2]),
        .I4(minusOp_carry_n_5),
        .I5(s_IBUF[4]),
        .O(\showw[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \showw[3]_i_2 
       (.I0(\showw_reg[3]_i_3_n_0 ),
        .I1(\showw_reg[3]_i_4_n_0 ),
        .I2(s_IBUF[3]),
        .I3(\showw_reg[3]_i_5_n_0 ),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[3] ),
        .O(F9__8[2]));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    \showw[3]_i_8 
       (.I0(data15[2]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[2]),
        .I3(input2_IBUF[2]),
        .I4(\plusOp_inferred__8/i__carry_n_5 ),
        .I5(s_IBUF[4]),
        .O(\showw[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[4]_i_1 
       (.I0(F9__8[5]),
        .I1(F9__8[4]),
        .I2(F9__8[3]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[4]));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    \showw[4]_i_10 
       (.I0(data11[3]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[3]),
        .I3(\plusOp_inferred__6/i__carry_n_4 ),
        .I4(s_IBUF[4]),
        .O(\showw[4]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    \showw[4]_i_12 
       (.I0(\showw_reg[4]_i_5_0 ),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[3]),
        .I3(input1_IBUF[3]),
        .I4(minusOp_carry_n_4),
        .I5(s_IBUF[4]),
        .O(\showw[4]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \showw[4]_i_2 
       (.I0(\showw_reg[4]_i_3_n_0 ),
        .I1(\showw_reg[4]_i_4_n_0 ),
        .I2(s_IBUF[3]),
        .I3(\showw_reg[4]_i_5_n_0 ),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[4] ),
        .O(F9__8[3]));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    \showw[4]_i_8 
       (.I0(data15[3]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[3]),
        .I3(input2_IBUF[3]),
        .I4(\plusOp_inferred__8/i__carry_n_4 ),
        .I5(s_IBUF[4]),
        .O(\showw[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[5]_i_1 
       (.I0(F9__8[6]),
        .I1(F9__8[5]),
        .I2(F9__8[4]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[5]));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[6]_i_1 
       (.I0(F9__8[7]),
        .I1(F9__8[6]),
        .I2(F9__8[5]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[6]));
  LUT5 #(
    .INIT(32'hF0AAF0CC)) 
    \showw[7]_i_1 
       (.I0(F9__8[0]),
        .I1(F9__8[7]),
        .I2(F9__8[6]),
        .I3(f_in_IBUF[1]),
        .I4(f_in_IBUF[0]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    \showw[7]_i_13 
       (.I0(data15[7]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[7]),
        .I3(input2_IBUF[7]),
        .I4(\plusOp_inferred__8/i__carry__0_n_4 ),
        .I5(s_IBUF[4]),
        .O(\showw[7]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    \showw[7]_i_15 
       (.I0(data11[7]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[7]),
        .I3(\plusOp_inferred__6/i__carry__0_n_4 ),
        .I4(s_IBUF[4]),
        .O(\showw[7]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    \showw[7]_i_17 
       (.I0(\showw_reg[7]_i_6_0 ),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[7]),
        .I3(input1_IBUF[7]),
        .I4(minusOp_carry__0_n_4),
        .I5(s_IBUF[4]),
        .O(\showw[7]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \showw[7]_i_2 
       (.I0(\showw_reg[7]_i_4_n_0 ),
        .I1(\showw_reg[7]_i_5_n_0 ),
        .I2(s_IBUF[3]),
        .I3(\showw_reg[7]_i_6_n_0 ),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[6]_0 ),
        .O(F9__8[7]));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    \showw[7]_i_21 
       (.I0(data15[6]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[6]),
        .I3(input2_IBUF[6]),
        .I4(\plusOp_inferred__8/i__carry__0_n_5 ),
        .I5(s_IBUF[4]),
        .O(\showw[7]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    \showw[7]_i_23 
       (.I0(data11[6]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[6]),
        .I3(\plusOp_inferred__6/i__carry__0_n_5 ),
        .I4(s_IBUF[4]),
        .O(\showw[7]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    \showw[7]_i_25 
       (.I0(\showw_reg[7]_i_10_0 ),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[6]),
        .I3(input1_IBUF[6]),
        .I4(minusOp_carry__0_n_5),
        .I5(s_IBUF[4]),
        .O(\showw[7]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \showw[7]_i_3 
       (.I0(\showw_reg[7]_i_8_n_0 ),
        .I1(\showw_reg[7]_i_9_n_0 ),
        .I2(s_IBUF[3]),
        .I3(\showw_reg[7]_i_10_n_0 ),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[6]_1 ),
        .O(F9__8[6]));
  MUXF7 \showw_reg[3]_i_3 
       (.I0(\showw[3]_i_2_1 ),
        .I1(\showw[3]_i_8_n_0 ),
        .O(\showw_reg[3]_i_3_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[3]_i_4 
       (.I0(\showw[3]_i_2_0 ),
        .I1(\showw[3]_i_10_n_0 ),
        .O(\showw_reg[3]_i_4_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[3]_i_5 
       (.I0(\showw[3]_i_2_2 ),
        .I1(\showw[3]_i_12_n_0 ),
        .O(\showw_reg[3]_i_5_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[4]_i_3 
       (.I0(\showw[4]_i_2_1 ),
        .I1(\showw[4]_i_8_n_0 ),
        .O(\showw_reg[4]_i_3_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[4]_i_4 
       (.I0(\showw[4]_i_2_0 ),
        .I1(\showw[4]_i_10_n_0 ),
        .O(\showw_reg[4]_i_4_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[4]_i_5 
       (.I0(\showw[4]_i_2_2 ),
        .I1(\showw[4]_i_12_n_0 ),
        .O(\showw_reg[4]_i_5_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_10 
       (.I0(\showw[7]_i_3_2 ),
        .I1(\showw[7]_i_25_n_0 ),
        .O(\showw_reg[7]_i_10_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_4 
       (.I0(\showw[7]_i_2_1 ),
        .I1(\showw[7]_i_13_n_0 ),
        .O(\showw_reg[7]_i_4_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_5 
       (.I0(\showw[7]_i_2_0 ),
        .I1(\showw[7]_i_15_n_0 ),
        .O(\showw_reg[7]_i_5_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_6 
       (.I0(\showw[7]_i_2_2 ),
        .I1(\showw[7]_i_17_n_0 ),
        .O(\showw_reg[7]_i_6_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_8 
       (.I0(\showw[7]_i_3_1 ),
        .I1(\showw[7]_i_21_n_0 ),
        .O(\showw_reg[7]_i_8_n_0 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_9 
       (.I0(\showw[7]_i_3_0 ),
        .I1(\showw[7]_i_23_n_0 ),
        .O(\showw_reg[7]_i_9_n_0 ),
        .S(s_IBUF[1]));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    zn_OBUF_inst_i_1
       (.I0(F9__8[5]),
        .I1(F9__8[4]),
        .I2(zn_OBUF_inst_i_4_n_0),
        .I3(F9__8[1]),
        .I4(F9__8[0]),
        .I5(zn_OBUF_inst_i_7_n_0),
        .O(zn_OBUF));
  MUXF7 zn_OBUF_inst_i_10
       (.I0(zn_OBUF_inst_i_2_2),
        .I1(zn_OBUF_inst_i_37_n_0),
        .O(zn_OBUF_inst_i_10_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_12
       (.I0(zn_OBUF_inst_i_3_1),
        .I1(zn_OBUF_inst_i_41_n_0),
        .O(zn_OBUF_inst_i_12_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_13
       (.I0(zn_OBUF_inst_i_3_0),
        .I1(zn_OBUF_inst_i_43_n_0),
        .O(zn_OBUF_inst_i_13_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_14
       (.I0(zn_OBUF_inst_i_3_2),
        .I1(zn_OBUF_inst_i_45_n_0),
        .O(zn_OBUF_inst_i_14_n_0),
        .S(s_IBUF[1]));
  MUXF8 zn_OBUF_inst_i_16
       (.I0(\showw_reg[6]_1 ),
        .I1(\showw_reg[7]_i_10_n_0 ),
        .O(zn_OBUF_inst_i_16_n_0),
        .S(s_IBUF[2]));
  MUXF8 zn_OBUF_inst_i_17
       (.I0(\showw_reg[7]_i_9_n_0 ),
        .I1(\showw_reg[7]_i_8_n_0 ),
        .O(zn_OBUF_inst_i_17_n_0),
        .S(s_IBUF[2]));
  MUXF8 zn_OBUF_inst_i_18
       (.I0(\showw_reg[6]_0 ),
        .I1(\showw_reg[7]_i_6_n_0 ),
        .O(zn_OBUF_inst_i_18_n_0),
        .S(s_IBUF[2]));
  MUXF8 zn_OBUF_inst_i_19
       (.I0(\showw_reg[7]_i_5_n_0 ),
        .I1(\showw_reg[7]_i_4_n_0 ),
        .O(zn_OBUF_inst_i_19_n_0),
        .S(s_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    zn_OBUF_inst_i_2
       (.I0(zn_OBUF_inst_i_8_n_0),
        .I1(zn_OBUF_inst_i_9_n_0),
        .I2(s_IBUF[3]),
        .I3(zn_OBUF_inst_i_10_n_0),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[6] ),
        .O(F9__8[5]));
  MUXF7 zn_OBUF_inst_i_20
       (.I0(zn_OBUF_inst_i_5_1),
        .I1(zn_OBUF_inst_i_49_n_0),
        .O(zn_OBUF_inst_i_20_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_21
       (.I0(zn_OBUF_inst_i_5_0),
        .I1(zn_OBUF_inst_i_51_n_0),
        .O(zn_OBUF_inst_i_21_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_22
       (.I0(zn_OBUF_inst_i_5_2),
        .I1(zn_OBUF_inst_i_53_n_0),
        .O(zn_OBUF_inst_i_22_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_24
       (.I0(zn_OBUF_inst_i_6_2),
        .I1(zn_OBUF_inst_i_57_n_0),
        .O(zn_OBUF_inst_i_24_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_25
       (.I0(zn_OBUF_inst_i_6_1),
        .I1(zn_OBUF_inst_i_59_n_0),
        .O(zn_OBUF_inst_i_25_n_0),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_26
       (.I0(zn_OBUF_inst_i_6_0),
        .I1(zn_OBUF_inst_i_61_n_0),
        .O(zn_OBUF_inst_i_26_n_0),
        .S(s_IBUF[1]));
  MUXF8 zn_OBUF_inst_i_28
       (.I0(\showw_reg[4] ),
        .I1(\showw_reg[4]_i_5_n_0 ),
        .O(zn_OBUF_inst_i_28_n_0),
        .S(s_IBUF[2]));
  MUXF8 zn_OBUF_inst_i_29
       (.I0(\showw_reg[4]_i_4_n_0 ),
        .I1(\showw_reg[4]_i_3_n_0 ),
        .O(zn_OBUF_inst_i_29_n_0),
        .S(s_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    zn_OBUF_inst_i_3
       (.I0(zn_OBUF_inst_i_12_n_0),
        .I1(zn_OBUF_inst_i_13_n_0),
        .I2(s_IBUF[3]),
        .I3(zn_OBUF_inst_i_14_n_0),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[5] ),
        .O(F9__8[4]));
  MUXF8 zn_OBUF_inst_i_30
       (.I0(\showw_reg[3] ),
        .I1(\showw_reg[3]_i_5_n_0 ),
        .O(zn_OBUF_inst_i_30_n_0),
        .S(s_IBUF[2]));
  MUXF8 zn_OBUF_inst_i_31
       (.I0(\showw_reg[3]_i_4_n_0 ),
        .I1(\showw_reg[3]_i_3_n_0 ),
        .O(zn_OBUF_inst_i_31_n_0),
        .S(s_IBUF[2]));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    zn_OBUF_inst_i_33
       (.I0(data15[5]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[5]),
        .I3(input2_IBUF[5]),
        .I4(\plusOp_inferred__8/i__carry__0_n_6 ),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_33_n_0));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    zn_OBUF_inst_i_35
       (.I0(data11[5]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[5]),
        .I3(\plusOp_inferred__6/i__carry__0_n_6 ),
        .I4(s_IBUF[4]),
        .O(zn_OBUF_inst_i_35_n_0));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    zn_OBUF_inst_i_37
       (.I0(zn_OBUF_inst_i_10_0),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[5]),
        .I3(input1_IBUF[5]),
        .I4(minusOp_carry__0_n_6),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_37_n_0));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    zn_OBUF_inst_i_4
       (.I0(zn_OBUF_inst_i_16_n_0),
        .I1(zn_OBUF_inst_i_17_n_0),
        .I2(zn_OBUF_inst_i_18_n_0),
        .I3(s_IBUF[3]),
        .I4(zn_OBUF_inst_i_19_n_0),
        .O(zn_OBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    zn_OBUF_inst_i_41
       (.I0(data15[4]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[4]),
        .I3(input2_IBUF[4]),
        .I4(\plusOp_inferred__8/i__carry__0_n_7 ),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_41_n_0));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    zn_OBUF_inst_i_43
       (.I0(data11[4]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[4]),
        .I3(\plusOp_inferred__6/i__carry__0_n_7 ),
        .I4(s_IBUF[4]),
        .O(zn_OBUF_inst_i_43_n_0));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    zn_OBUF_inst_i_45
       (.I0(zn_OBUF_inst_i_14_0),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[4]),
        .I3(input1_IBUF[4]),
        .I4(minusOp_carry__0_n_7),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_45_n_0));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    zn_OBUF_inst_i_49
       (.I0(data15[1]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[1]),
        .I3(input2_IBUF[1]),
        .I4(\plusOp_inferred__8/i__carry_n_6 ),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_49_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    zn_OBUF_inst_i_5
       (.I0(zn_OBUF_inst_i_20_n_0),
        .I1(zn_OBUF_inst_i_21_n_0),
        .I2(s_IBUF[3]),
        .I3(zn_OBUF_inst_i_22_n_0),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[2] ),
        .O(F9__8[1]));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    zn_OBUF_inst_i_51
       (.I0(data11[1]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[1]),
        .I3(\plusOp_inferred__6/i__carry_n_6 ),
        .I4(s_IBUF[4]),
        .O(zn_OBUF_inst_i_51_n_0));
  LUT6 #(
    .INIT(64'h0F300F30BB7B8848)) 
    zn_OBUF_inst_i_53
       (.I0(zn_OBUF_inst_i_22_0),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[1]),
        .I3(input1_IBUF[1]),
        .I4(minusOp_carry_n_6),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_53_n_0));
  LUT6 #(
    .INIT(64'hBBB8BBB8BBBB8888)) 
    zn_OBUF_inst_i_57
       (.I0(data15[0]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(\plusOp_inferred__8/i__carry_n_7 ),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_57_n_0));
  LUT5 #(
    .INIT(32'hB8B8BB88)) 
    zn_OBUF_inst_i_59
       (.I0(data11[0]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[0]),
        .I3(\plusOp_inferred__6/i__carry_n_7 ),
        .I4(s_IBUF[4]),
        .O(zn_OBUF_inst_i_59_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    zn_OBUF_inst_i_6
       (.I0(zn_OBUF_inst_i_24_n_0),
        .I1(zn_OBUF_inst_i_25_n_0),
        .I2(s_IBUF[3]),
        .I3(zn_OBUF_inst_i_26_n_0),
        .I4(s_IBUF[2]),
        .I5(\showw_reg[7] ),
        .O(F9__8[0]));
  LUT6 #(
    .INIT(64'h0F300F3077B74484)) 
    zn_OBUF_inst_i_61
       (.I0(DI[0]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[0]),
        .I3(input1_IBUF[0]),
        .I4(minusOp_carry_n_7),
        .I5(s_IBUF[4]),
        .O(zn_OBUF_inst_i_61_n_0));
  CARRY4 zn_OBUF_inst_i_69
       (.CI(1'b0),
        .CO({zn_OBUF_inst_i_69_n_0,zn_OBUF_inst_i_69_n_1,zn_OBUF_inst_i_69_n_2,zn_OBUF_inst_i_69_n_3}),
        .CYINIT(input1_IBUF[0]),
        .DI({input1_IBUF[3:1],DI[0]}),
        .O(\input1[0] ),
        .S({zn_OBUF_inst_i_77_n_0,zn_OBUF_inst_i_78_n_0,zn_OBUF_inst_i_79_n_0,zn_OBUF_inst_i_56}));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    zn_OBUF_inst_i_7
       (.I0(zn_OBUF_inst_i_28_n_0),
        .I1(zn_OBUF_inst_i_29_n_0),
        .I2(zn_OBUF_inst_i_30_n_0),
        .I3(s_IBUF[3]),
        .I4(zn_OBUF_inst_i_31_n_0),
        .O(zn_OBUF_inst_i_7_n_0));
  CARRY4 zn_OBUF_inst_i_70
       (.CI(1'b0),
        .CO({zn_OBUF_inst_i_70_n_0,zn_OBUF_inst_i_70_n_1,zn_OBUF_inst_i_70_n_2,zn_OBUF_inst_i_70_n_3}),
        .CYINIT(input2_IBUF[0]),
        .DI(input1_IBUF[3:0]),
        .O(\input2[0] ),
        .S({zn_OBUF_inst_i_81_n_0,zn_OBUF_inst_i_82_n_0,zn_OBUF_inst_i_83_n_0,zn_OBUF_inst_i_58_0}));
  CARRY4 zn_OBUF_inst_i_71
       (.CI(1'b0),
        .CO({zn_OBUF_inst_i_71_n_0,zn_OBUF_inst_i_71_n_1,zn_OBUF_inst_i_71_n_2,zn_OBUF_inst_i_71_n_3}),
        .CYINIT(R[9]),
        .DI(input1_IBUF[3:0]),
        .O(\input1[3] ),
        .S({zn_OBUF_inst_i_85_n_0,zn_OBUF_inst_i_86_n_0,zn_OBUF_inst_i_87_n_0,zn_OBUF_inst_i_58}));
  LUT2 #(
    .INIT(4'h2)) 
    zn_OBUF_inst_i_77
       (.I0(input2_IBUF[3]),
        .I1(input1_IBUF[3]),
        .O(zn_OBUF_inst_i_77_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    zn_OBUF_inst_i_78
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .O(zn_OBUF_inst_i_78_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    zn_OBUF_inst_i_79
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .O(zn_OBUF_inst_i_79_n_0));
  MUXF7 zn_OBUF_inst_i_8
       (.I0(zn_OBUF_inst_i_2_1),
        .I1(zn_OBUF_inst_i_33_n_0),
        .O(zn_OBUF_inst_i_8_n_0),
        .S(s_IBUF[1]));
  LUT2 #(
    .INIT(4'h6)) 
    zn_OBUF_inst_i_81
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(zn_OBUF_inst_i_81_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    zn_OBUF_inst_i_82
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(zn_OBUF_inst_i_82_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    zn_OBUF_inst_i_83
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .O(zn_OBUF_inst_i_83_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    zn_OBUF_inst_i_85
       (.I0(input2_IBUF[3]),
        .I1(input1_IBUF[3]),
        .O(zn_OBUF_inst_i_85_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    zn_OBUF_inst_i_86
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .O(zn_OBUF_inst_i_86_n_0));
  LUT2 #(
    .INIT(4'h4)) 
    zn_OBUF_inst_i_87
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .O(zn_OBUF_inst_i_87_n_0));
  MUXF7 zn_OBUF_inst_i_9
       (.I0(zn_OBUF_inst_i_2_0),
        .I1(zn_OBUF_inst_i_35_n_0),
        .O(zn_OBUF_inst_i_9_n_0),
        .S(s_IBUF[1]));
endmodule

module state
   (\s[1] ,
    \s[1]_0 ,
    \s[1]_1 ,
    \s[1]_2 ,
    \s[1]_3 ,
    \s[1]_4 ,
    \s[1]_5 ,
    cy_OBUF_inst_i_28_0,
    \s[1]_6 ,
    cy_OBUF_inst_i_53_0,
    \input1[6] ,
    \s[0] ,
    \s[0]_0 ,
    \s[0]_1 ,
    \s[0]_2 ,
    \s[0]_3 ,
    \s[0]_4 ,
    \s[0]_5 ,
    \s[0]_6 ,
    \s[0]_7 ,
    \s[0]_8 ,
    \s[0]_9 ,
    \s[0]_10 ,
    \s[0]_11 ,
    \s[0]_12 ,
    \s[0]_13 ,
    \s[0]_14 ,
    cy_OBUF_inst_i_33_0,
    c0,
    \input1[2] ,
    \input1[3] ,
    c0_0,
    \input1[1] ,
    \input1[0] ,
    \input1[1]_0 ,
    \input1[2]_0 ,
    \input1[3]_0 ,
    \input1[4] ,
    \input1[5] ,
    \input1[6]_0 ,
    \input1[7] ,
    \input2[7] ,
    S,
    seg_sel_OBUF,
    \input2[0] ,
    seg_data_OBUF,
    clk,
    s_IBUF,
    input2_IBUF,
    input1_IBUF,
    c0_IBUF,
    \showw_reg[4]_i_4 ,
    \showw_reg[4]_i_4_0 ,
    \showw_reg[7]_i_5 ,
    \showw_reg[7]_i_5_0 ,
    \showw_reg[4]_i_5 ,
    O,
    \showw_reg[7]_i_6 ,
    \showw_reg[7]_i_6_0 ,
    \showw_reg[4]_i_3 ,
    \showw_reg[7]_i_4 ,
    AR,
    D);
  output \s[1] ;
  output \s[1]_0 ;
  output \s[1]_1 ;
  output \s[1]_2 ;
  output \s[1]_3 ;
  output \s[1]_4 ;
  output \s[1]_5 ;
  output cy_OBUF_inst_i_28_0;
  output \s[1]_6 ;
  output cy_OBUF_inst_i_53_0;
  output \input1[6] ;
  output \s[0] ;
  output \s[0]_0 ;
  output \s[0]_1 ;
  output \s[0]_2 ;
  output \s[0]_3 ;
  output \s[0]_4 ;
  output \s[0]_5 ;
  output \s[0]_6 ;
  output \s[0]_7 ;
  output \s[0]_8 ;
  output \s[0]_9 ;
  output \s[0]_10 ;
  output \s[0]_11 ;
  output \s[0]_12 ;
  output \s[0]_13 ;
  output \s[0]_14 ;
  output cy_OBUF_inst_i_33_0;
  output c0;
  output \input1[2] ;
  output \input1[3] ;
  output c0_0;
  output \input1[1] ;
  output \input1[0] ;
  output \input1[1]_0 ;
  output \input1[2]_0 ;
  output \input1[3]_0 ;
  output \input1[4] ;
  output \input1[5] ;
  output \input1[6]_0 ;
  output \input1[7] ;
  output [3:0]\input2[7] ;
  output [3:0]S;
  output [15:0]seg_sel_OBUF;
  output \input2[0] ;
  output [6:0]seg_data_OBUF;
  input clk;
  input [2:0]s_IBUF;
  input [7:0]input2_IBUF;
  input [7:0]input1_IBUF;
  input c0_IBUF;
  input [3:0]\showw_reg[4]_i_4 ;
  input [3:0]\showw_reg[4]_i_4_0 ;
  input [3:0]\showw_reg[7]_i_5 ;
  input [3:0]\showw_reg[7]_i_5_0 ;
  input [3:0]\showw_reg[4]_i_5 ;
  input [3:0]O;
  input [3:0]\showw_reg[7]_i_6 ;
  input [3:0]\showw_reg[7]_i_6_0 ;
  input [3:0]\showw_reg[4]_i_3 ;
  input [3:0]\showw_reg[7]_i_4 ;
  input [0:0]AR;
  input [7:0]D;

  wire [0:0]AR;
  wire [7:0]D;
  wire [3:0]O;
  wire [3:0]S;
  wire c0;
  wire c0_0;
  wire c0_IBUF;
  wire clear;
  wire clk;
  wire clks;
  wire clks_i_1_n_0;
  wire \count[0]_i_3_n_0 ;
  wire \count[0]_i_5_n_0 ;
  wire \count[0]_i_6_n_0 ;
  wire [14:0]count_reg;
  wire \count_reg[0]_i_2_n_0 ;
  wire \count_reg[0]_i_2_n_1 ;
  wire \count_reg[0]_i_2_n_2 ;
  wire \count_reg[0]_i_2_n_3 ;
  wire \count_reg[0]_i_2_n_4 ;
  wire \count_reg[0]_i_2_n_5 ;
  wire \count_reg[0]_i_2_n_6 ;
  wire \count_reg[0]_i_2_n_7 ;
  wire \count_reg[0]_i_4_n_0 ;
  wire \count_reg[0]_i_4_n_1 ;
  wire \count_reg[0]_i_4_n_2 ;
  wire \count_reg[0]_i_4_n_3 ;
  wire \count_reg[0]_i_4_n_4 ;
  wire \count_reg[0]_i_4_n_5 ;
  wire \count_reg[0]_i_4_n_6 ;
  wire \count_reg[0]_i_4_n_7 ;
  wire \count_reg[0]_i_7_n_3 ;
  wire \count_reg[0]_i_7_n_6 ;
  wire \count_reg[0]_i_7_n_7 ;
  wire \count_reg[0]_i_8_n_0 ;
  wire \count_reg[0]_i_8_n_1 ;
  wire \count_reg[0]_i_8_n_2 ;
  wire \count_reg[0]_i_8_n_3 ;
  wire \count_reg[0]_i_8_n_4 ;
  wire \count_reg[0]_i_8_n_5 ;
  wire \count_reg[0]_i_8_n_6 ;
  wire \count_reg[0]_i_8_n_7 ;
  wire \count_reg[0]_i_9_n_0 ;
  wire \count_reg[0]_i_9_n_1 ;
  wire \count_reg[0]_i_9_n_2 ;
  wire \count_reg[0]_i_9_n_3 ;
  wire \count_reg[0]_i_9_n_4 ;
  wire \count_reg[0]_i_9_n_5 ;
  wire \count_reg[0]_i_9_n_6 ;
  wire \count_reg[0]_i_9_n_7 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire cy_OBUF_inst_i_28_0;
  wire cy_OBUF_inst_i_28_n_0;
  wire cy_OBUF_inst_i_29_n_0;
  wire cy_OBUF_inst_i_31_n_0;
  wire cy_OBUF_inst_i_32_n_0;
  wire cy_OBUF_inst_i_33_0;
  wire cy_OBUF_inst_i_33_n_0;
  wire cy_OBUF_inst_i_51_n_0;
  wire cy_OBUF_inst_i_53_0;
  wire cy_OBUF_inst_i_54_n_0;
  wire cy_OBUF_inst_i_55_n_0;
  wire \input1[0] ;
  wire \input1[1] ;
  wire \input1[1]_0 ;
  wire \input1[2] ;
  wire \input1[2]_0 ;
  wire \input1[3] ;
  wire \input1[3]_0 ;
  wire \input1[4] ;
  wire \input1[5] ;
  wire \input1[6] ;
  wire \input1[6]_0 ;
  wire \input1[7] ;
  wire [7:0]input1_IBUF;
  wire \input2[0] ;
  wire [3:0]\input2[7] ;
  wire [7:0]input2_IBUF;
  wire [3:0]next_state;
  wire [3:0]p_10_in;
  wire [3:0]p_11_in;
  wire [3:0]p_12_in;
  wire [3:0]p_13_in;
  wire [3:0]p_14_in;
  wire [3:3]p_9_in;
  wire \s[0] ;
  wire \s[0]_0 ;
  wire \s[0]_1 ;
  wire \s[0]_10 ;
  wire \s[0]_11 ;
  wire \s[0]_12 ;
  wire \s[0]_13 ;
  wire \s[0]_14 ;
  wire \s[0]_2 ;
  wire \s[0]_3 ;
  wire \s[0]_4 ;
  wire \s[0]_5 ;
  wire \s[0]_6 ;
  wire \s[0]_7 ;
  wire \s[0]_8 ;
  wire \s[0]_9 ;
  wire \s[1] ;
  wire \s[1]_0 ;
  wire \s[1]_1 ;
  wire \s[1]_2 ;
  wire \s[1]_3 ;
  wire \s[1]_4 ;
  wire \s[1]_5 ;
  wire \s[1]_6 ;
  wire [2:0]s_IBUF;
  wire [6:0]seg_data_OBUF;
  wire \seg_data_OBUF[6]_inst_i_10_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_11_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_12_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_13_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_2_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_6_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_7_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_8_n_0 ;
  wire \seg_data_OBUF[6]_inst_i_9_n_0 ;
  wire [15:0]seg_sel_OBUF;
  wire [2:0]show1__30;
  wire \showw[3]_i_13_n_0 ;
  wire \showw[3]_i_14_n_0 ;
  wire \showw[3]_i_15_n_0 ;
  wire \showw[3]_i_16_n_0 ;
  wire \showw[4]_i_13_n_0 ;
  wire \showw[4]_i_14_n_0 ;
  wire \showw[4]_i_16_n_0 ;
  wire \showw[4]_i_17_n_0 ;
  wire \showw[4]_i_18_n_0 ;
  wire \showw[7]_i_18_n_0 ;
  wire \showw[7]_i_19_n_0 ;
  wire \showw[7]_i_26_n_0 ;
  wire \showw[7]_i_27_n_0 ;
  wire \showw[7]_i_29_n_0 ;
  wire \showw[7]_i_30_n_0 ;
  wire \showw[7]_i_31_n_0 ;
  wire [3:0]\showw_reg[4]_i_3 ;
  wire [3:0]\showw_reg[4]_i_4 ;
  wire [3:0]\showw_reg[4]_i_4_0 ;
  wire [3:0]\showw_reg[4]_i_5 ;
  wire [3:0]\showw_reg[7]_i_4 ;
  wire [3:0]\showw_reg[7]_i_5 ;
  wire [3:0]\showw_reg[7]_i_5_0 ;
  wire [3:0]\showw_reg[7]_i_6 ;
  wire [3:0]\showw_reg[7]_i_6_0 ;
  wire \showw_reg_n_0_[0] ;
  wire \showw_reg_n_0_[1] ;
  wire \showw_reg_n_0_[2] ;
  wire \showw_reg_n_0_[3] ;
  wire [3:0]state;
  wire [3:8]\u1/ls181/L0_out ;
  wire zn_OBUF_inst_i_38_n_0;
  wire zn_OBUF_inst_i_39_n_0;
  wire zn_OBUF_inst_i_46_n_0;
  wire zn_OBUF_inst_i_47_n_0;
  wire zn_OBUF_inst_i_54_n_0;
  wire zn_OBUF_inst_i_55_n_0;
  wire zn_OBUF_inst_i_63_n_0;
  wire zn_OBUF_inst_i_64_n_0;
  wire zn_OBUF_inst_i_66_n_0;
  wire zn_OBUF_inst_i_67_n_0;
  wire zn_OBUF_inst_i_68_n_0;
  wire zn_OBUF_inst_i_73_n_0;
  wire zn_OBUF_inst_i_74_n_0;
  wire zn_OBUF_inst_i_75_n_0;
  wire [3:1]\NLW_count_reg[0]_i_7_CO_UNCONNECTED ;
  wire [3:2]\NLW_count_reg[0]_i_7_O_UNCONNECTED ;
  wire [3:2]\NLW_count_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_count_reg[12]_i_1_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[0]),
        .O(next_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .O(next_state[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .O(next_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \FSM_sequential_state[3]_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(next_state[3]));
  (* FSM_ENCODED_STATES = "s4:0100,s3:0011,s13:1101,s2:0010,s11:1011,s12:1100,s10:1010,s1:0001,s0:0000,s9:1001,s7:0111,s8:1000,s6:0110,s15:1111,s14:1110,s5:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[0]),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "s4:0100,s3:0011,s13:1101,s2:0010,s11:1011,s12:1100,s10:1010,s1:0001,s0:0000,s9:1001,s7:0111,s8:1000,s6:0110,s15:1111,s14:1110,s5:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[1]),
        .Q(state[1]));
  (* FSM_ENCODED_STATES = "s4:0100,s3:0011,s13:1101,s2:0010,s11:1011,s12:1100,s10:1010,s1:0001,s0:0000,s9:1001,s7:0111,s8:1000,s6:0110,s15:1111,s14:1110,s5:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[2]),
        .Q(state[2]));
  (* FSM_ENCODED_STATES = "s4:0100,s3:0011,s13:1101,s2:0010,s11:1011,s12:1100,s10:1010,s1:0001,s0:0000,s9:1001,s7:0111,s8:1000,s6:0110,s15:1111,s14:1110,s5:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[3] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(next_state[3]),
        .Q(state[3]));
  LUT6 #(
    .INIT(64'hFFFDFFFF00020000)) 
    clks_i_1
       (.I0(\count[0]_i_3_n_0 ),
        .I1(\count_reg[0]_i_4_n_5 ),
        .I2(\count_reg[0]_i_4_n_6 ),
        .I3(\count_reg[0]_i_4_n_7 ),
        .I4(\count[0]_i_5_n_0 ),
        .I5(clks),
        .O(clks_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clks_reg
       (.C(clk),
        .CE(1'b1),
        .D(clks_i_1_n_0),
        .Q(clks),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00020000)) 
    \count[0]_i_1 
       (.I0(\count[0]_i_3_n_0 ),
        .I1(\count_reg[0]_i_4_n_5 ),
        .I2(\count_reg[0]_i_4_n_6 ),
        .I3(\count_reg[0]_i_4_n_7 ),
        .I4(\count[0]_i_5_n_0 ),
        .O(clear));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    \count[0]_i_3 
       (.I0(\count_reg[0]_i_7_n_7 ),
        .I1(\count_reg[0]_i_8_n_4 ),
        .I2(\count_reg[0]_i_8_n_6 ),
        .I3(\count_reg[0]_i_8_n_5 ),
        .I4(\count_reg[0]_i_7_n_6 ),
        .I5(count_reg[0]),
        .O(\count[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \count[0]_i_5 
       (.I0(\count_reg[0]_i_9_n_6 ),
        .I1(\count_reg[0]_i_9_n_5 ),
        .I2(\count_reg[0]_i_4_n_4 ),
        .I3(\count_reg[0]_i_9_n_7 ),
        .I4(\count_reg[0]_i_8_n_7 ),
        .I5(\count_reg[0]_i_9_n_4 ),
        .O(\count[0]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_6 
       (.I0(count_reg[0]),
        .O(\count[0]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_2_n_7 ),
        .Q(count_reg[0]),
        .R(clear));
  CARRY4 \count_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\count_reg[0]_i_2_n_0 ,\count_reg[0]_i_2_n_1 ,\count_reg[0]_i_2_n_2 ,\count_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\count_reg[0]_i_2_n_4 ,\count_reg[0]_i_2_n_5 ,\count_reg[0]_i_2_n_6 ,\count_reg[0]_i_2_n_7 }),
        .S({count_reg[3:1],\count[0]_i_6_n_0 }));
  CARRY4 \count_reg[0]_i_4 
       (.CI(1'b0),
        .CO({\count_reg[0]_i_4_n_0 ,\count_reg[0]_i_4_n_1 ,\count_reg[0]_i_4_n_2 ,\count_reg[0]_i_4_n_3 }),
        .CYINIT(count_reg[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[0]_i_4_n_4 ,\count_reg[0]_i_4_n_5 ,\count_reg[0]_i_4_n_6 ,\count_reg[0]_i_4_n_7 }),
        .S(count_reg[4:1]));
  CARRY4 \count_reg[0]_i_7 
       (.CI(\count_reg[0]_i_8_n_0 ),
        .CO({\NLW_count_reg[0]_i_7_CO_UNCONNECTED [3:1],\count_reg[0]_i_7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[0]_i_7_O_UNCONNECTED [3:2],\count_reg[0]_i_7_n_6 ,\count_reg[0]_i_7_n_7 }),
        .S({1'b0,1'b0,count_reg[14:13]}));
  CARRY4 \count_reg[0]_i_8 
       (.CI(\count_reg[0]_i_9_n_0 ),
        .CO({\count_reg[0]_i_8_n_0 ,\count_reg[0]_i_8_n_1 ,\count_reg[0]_i_8_n_2 ,\count_reg[0]_i_8_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[0]_i_8_n_4 ,\count_reg[0]_i_8_n_5 ,\count_reg[0]_i_8_n_6 ,\count_reg[0]_i_8_n_7 }),
        .S(count_reg[12:9]));
  CARRY4 \count_reg[0]_i_9 
       (.CI(\count_reg[0]_i_4_n_0 ),
        .CO({\count_reg[0]_i_9_n_0 ,\count_reg[0]_i_9_n_1 ,\count_reg[0]_i_9_n_2 ,\count_reg[0]_i_9_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[0]_i_9_n_4 ,\count_reg[0]_i_9_n_5 ,\count_reg[0]_i_9_n_6 ,\count_reg[0]_i_9_n_7 }),
        .S(count_reg[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(count_reg[10]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(count_reg[12]),
        .R(clear));
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\NLW_count_reg[12]_i_1_CO_UNCONNECTED [3:2],\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_count_reg[12]_i_1_O_UNCONNECTED [3],\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S({1'b0,count_reg[14:12]}));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(count_reg[13]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(count_reg[14]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_2_n_6 ),
        .Q(count_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_2_n_5 ),
        .Q(count_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[0]_i_2_n_4 ),
        .Q(count_reg[3]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(count_reg[4]),
        .R(clear));
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_2_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S(count_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(count_reg[5]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(count_reg[6]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(count_reg[7]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(count_reg[8]),
        .R(clear));
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S(count_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(count_reg[9]),
        .R(clear));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    cy_OBUF_inst_i_18
       (.I0(cy_OBUF_inst_i_28_n_0),
        .I1(cy_OBUF_inst_i_29_n_0),
        .I2(c0),
        .I3(cy_OBUF_inst_i_31_n_0),
        .I4(cy_OBUF_inst_i_32_n_0),
        .I5(cy_OBUF_inst_i_33_n_0),
        .O(cy_OBUF_inst_i_33_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    cy_OBUF_inst_i_22
       (.I0(\u1/ls181/L0_out [3]),
        .I1(\u1/ls181/L0_out [5]),
        .I2(\u1/ls181/L0_out [7]),
        .I3(cy_OBUF_inst_i_51_n_0),
        .I4(\u1/ls181/L0_out [6]),
        .I5(\u1/ls181/L0_out [4]),
        .O(cy_OBUF_inst_i_53_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    cy_OBUF_inst_i_23
       (.I0(input1_IBUF[6]),
        .I1(cy_OBUF_inst_i_54_n_0),
        .I2(input1_IBUF[5]),
        .O(\input1[6] ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    cy_OBUF_inst_i_24
       (.I0(cy_OBUF_inst_i_33_n_0),
        .I1(cy_OBUF_inst_i_32_n_0),
        .I2(cy_OBUF_inst_i_31_n_0),
        .I3(cy_OBUF_inst_i_55_n_0),
        .I4(cy_OBUF_inst_i_29_n_0),
        .I5(cy_OBUF_inst_i_28_n_0),
        .O(cy_OBUF_inst_i_28_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hB)) 
    cy_OBUF_inst_i_28
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(cy_OBUF_inst_i_28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hB)) 
    cy_OBUF_inst_i_29
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(cy_OBUF_inst_i_29_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFDFFF)) 
    cy_OBUF_inst_i_30
       (.I0(c0_IBUF),
        .I1(input1_IBUF[0]),
        .I2(input2_IBUF[0]),
        .I3(input2_IBUF[1]),
        .I4(input1_IBUF[1]),
        .O(c0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'hB)) 
    cy_OBUF_inst_i_31
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(cy_OBUF_inst_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'hB)) 
    cy_OBUF_inst_i_32
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(cy_OBUF_inst_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hB)) 
    cy_OBUF_inst_i_33
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(cy_OBUF_inst_i_33_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_48
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(\u1/ls181/L0_out [3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_49
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(\u1/ls181/L0_out [5]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_50
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(\u1/ls181/L0_out [7]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hEEE00000)) 
    cy_OBUF_inst_i_51
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(c0_IBUF),
        .O(cy_OBUF_inst_i_51_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_52
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(\u1/ls181/L0_out [6]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_53
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(\u1/ls181/L0_out [4]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    cy_OBUF_inst_i_54
       (.I0(input1_IBUF[4]),
        .I1(input1_IBUF[2]),
        .I2(c0_IBUF),
        .I3(input1_IBUF[0]),
        .I4(input1_IBUF[1]),
        .I5(input1_IBUF[3]),
        .O(cy_OBUF_inst_i_54_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hD0DD0000)) 
    cy_OBUF_inst_i_55
       (.I0(input2_IBUF[1]),
        .I1(input1_IBUF[1]),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(c0_IBUF),
        .O(cy_OBUF_inst_i_55_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_1
       (.I0(input2_IBUF[7]),
        .I1(input1_IBUF[7]),
        .O(\input2[7] [3]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_2
       (.I0(input2_IBUF[6]),
        .I1(input1_IBUF[6]),
        .O(\input2[7] [2]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_3
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .O(\input2[7] [1]));
  LUT2 #(
    .INIT(4'h1)) 
    i__carry__0_i_4
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .O(\input2[7] [0]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_1
       (.I0(input1_IBUF[7]),
        .I1(input2_IBUF[7]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_2
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_3
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    minusOp_carry__0_i_4
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h2094)) 
    \seg_data_OBUF[0]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[2]),
        .I2(show1__30[0]),
        .I3(show1__30[1]),
        .O(seg_data_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA4C8)) 
    \seg_data_OBUF[1]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[2]),
        .I2(show1__30[1]),
        .I3(show1__30[0]),
        .O(seg_data_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hA210)) 
    \seg_data_OBUF[2]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[0]),
        .I2(show1__30[1]),
        .I3(show1__30[2]),
        .O(seg_data_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hC214)) 
    \seg_data_OBUF[3]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[2]),
        .I2(show1__30[0]),
        .I3(show1__30[1]),
        .O(seg_data_OBUF[3]));
  LUT4 #(
    .INIT(16'h5710)) 
    \seg_data_OBUF[4]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[1]),
        .I2(show1__30[2]),
        .I3(show1__30[0]),
        .O(seg_data_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h5190)) 
    \seg_data_OBUF[5]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[2]),
        .I2(show1__30[0]),
        .I3(show1__30[1]),
        .O(seg_data_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h4025)) 
    \seg_data_OBUF[6]_inst_i_1 
       (.I0(\seg_data_OBUF[6]_inst_i_2_n_0 ),
        .I1(show1__30[0]),
        .I2(show1__30[2]),
        .I3(show1__30[1]),
        .O(seg_data_OBUF[6]));
  LUT4 #(
    .INIT(16'h00E2)) 
    \seg_data_OBUF[6]_inst_i_10 
       (.I0(p_11_in[2]),
        .I1(state[0]),
        .I2(p_10_in[2]),
        .I3(state[1]),
        .O(\seg_data_OBUF[6]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \seg_data_OBUF[6]_inst_i_11 
       (.I0(p_12_in[2]),
        .I1(p_13_in[2]),
        .I2(state[1]),
        .I3(p_14_in[2]),
        .I4(state[0]),
        .I5(\showw_reg_n_0_[2] ),
        .O(\seg_data_OBUF[6]_inst_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    \seg_data_OBUF[6]_inst_i_12 
       (.I0(p_11_in[1]),
        .I1(state[0]),
        .I2(p_10_in[1]),
        .I3(state[1]),
        .O(\seg_data_OBUF[6]_inst_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \seg_data_OBUF[6]_inst_i_13 
       (.I0(p_12_in[1]),
        .I1(p_13_in[1]),
        .I2(state[1]),
        .I3(p_14_in[1]),
        .I4(state[0]),
        .I5(\showw_reg_n_0_[1] ),
        .O(\seg_data_OBUF[6]_inst_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \seg_data_OBUF[6]_inst_i_2 
       (.I0(\seg_data_OBUF[6]_inst_i_6_n_0 ),
        .I1(state[2]),
        .I2(\seg_data_OBUF[6]_inst_i_7_n_0 ),
        .I3(state[3]),
        .O(\seg_data_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \seg_data_OBUF[6]_inst_i_3 
       (.I0(p_9_in),
        .I1(state[0]),
        .I2(state[3]),
        .I3(\seg_data_OBUF[6]_inst_i_8_n_0 ),
        .I4(state[2]),
        .I5(\seg_data_OBUF[6]_inst_i_9_n_0 ),
        .O(show1__30[0]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \seg_data_OBUF[6]_inst_i_4 
       (.I0(p_9_in),
        .I1(state[3]),
        .I2(\seg_data_OBUF[6]_inst_i_10_n_0 ),
        .I3(state[2]),
        .I4(\seg_data_OBUF[6]_inst_i_11_n_0 ),
        .O(show1__30[2]));
  LUT6 #(
    .INIT(64'h2F202F2F2F202020)) 
    \seg_data_OBUF[6]_inst_i_5 
       (.I0(p_9_in),
        .I1(state[1]),
        .I2(state[3]),
        .I3(\seg_data_OBUF[6]_inst_i_12_n_0 ),
        .I4(state[2]),
        .I5(\seg_data_OBUF[6]_inst_i_13_n_0 ),
        .O(show1__30[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \seg_data_OBUF[6]_inst_i_6 
       (.I0(p_12_in[3]),
        .I1(p_13_in[3]),
        .I2(state[1]),
        .I3(p_14_in[3]),
        .I4(state[0]),
        .I5(\showw_reg_n_0_[3] ),
        .O(\seg_data_OBUF[6]_inst_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \seg_data_OBUF[6]_inst_i_7 
       (.I0(p_9_in),
        .I1(state[1]),
        .I2(p_10_in[3]),
        .I3(state[0]),
        .I4(p_11_in[3]),
        .O(\seg_data_OBUF[6]_inst_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \seg_data_OBUF[6]_inst_i_8 
       (.I0(p_9_in),
        .I1(state[1]),
        .I2(p_10_in[0]),
        .I3(state[0]),
        .I4(p_11_in[0]),
        .O(\seg_data_OBUF[6]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \seg_data_OBUF[6]_inst_i_9 
       (.I0(p_12_in[0]),
        .I1(p_13_in[0]),
        .I2(state[1]),
        .I3(p_14_in[0]),
        .I4(state[0]),
        .I5(\showw_reg_n_0_[0] ),
        .O(\seg_data_OBUF[6]_inst_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \seg_sel_OBUF[0]_inst_i_1 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[2]),
        .O(seg_sel_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \seg_sel_OBUF[10]_inst_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[3]),
        .O(seg_sel_OBUF[10]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF7FF)) 
    \seg_sel_OBUF[11]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[3]),
        .O(seg_sel_OBUF[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \seg_sel_OBUF[12]_inst_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[3]),
        .O(seg_sel_OBUF[12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \seg_sel_OBUF[13]_inst_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[3]),
        .O(seg_sel_OBUF[13]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \seg_sel_OBUF[14]_inst_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[3]),
        .O(seg_sel_OBUF[14]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \seg_sel_OBUF[15]_inst_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[3]),
        .O(seg_sel_OBUF[15]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \seg_sel_OBUF[1]_inst_i_1 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[2]),
        .O(seg_sel_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    \seg_sel_OBUF[2]_inst_i_1 
       (.I0(state[3]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .O(seg_sel_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hFFBF)) 
    \seg_sel_OBUF[3]_inst_i_1 
       (.I0(state[3]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(state[2]),
        .O(seg_sel_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hFFFB)) 
    \seg_sel_OBUF[4]_inst_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(seg_sel_OBUF[4]));
  LUT4 #(
    .INIT(16'hFBFF)) 
    \seg_sel_OBUF[5]_inst_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(seg_sel_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \seg_sel_OBUF[6]_inst_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(state[1]),
        .O(seg_sel_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \seg_sel_OBUF[7]_inst_i_1 
       (.I0(state[3]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(seg_sel_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \seg_sel_OBUF[8]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[3]),
        .O(seg_sel_OBUF[8]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hFBFF)) 
    \seg_sel_OBUF[9]_inst_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[3]),
        .O(seg_sel_OBUF[9]));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    \showw[3]_i_11 
       (.I0(\showw_reg[4]_i_5 [2]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[2]),
        .I3(input2_IBUF[2]),
        .I4(O[2]),
        .I5(s_IBUF[2]),
        .O(\s[0]_9 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    \showw[3]_i_13 
       (.I0(cy_OBUF_inst_i_51_n_0),
        .I1(input2_IBUF[2]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(\showw[3]_i_15_n_0 ),
        .I5(input1_IBUF[2]),
        .O(\showw[3]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h000055559DDDC888)) 
    \showw[3]_i_14 
       (.I0(s_IBUF[0]),
        .I1(c0_IBUF),
        .I2(\showw[3]_i_16_n_0 ),
        .I3(zn_OBUF_inst_i_75_n_0),
        .I4(cy_OBUF_inst_i_31_n_0),
        .I5(s_IBUF[2]),
        .O(\showw[3]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \showw[3]_i_15 
       (.I0(input1_IBUF[1]),
        .I1(input1_IBUF[0]),
        .I2(c0_IBUF),
        .O(\showw[3]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \showw[3]_i_16 
       (.I0(input1_IBUF[0]),
        .I1(input2_IBUF[0]),
        .O(\showw[3]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    \showw[3]_i_7 
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .I2(\showw_reg[4]_i_3 [2]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[1]),
        .I5(s_IBUF[2]),
        .O(\input1[2]_0 ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    \showw[3]_i_9 
       (.I0(\showw_reg[4]_i_4 [2]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[2]),
        .I3(input1_IBUF[2]),
        .I4(\showw_reg[4]_i_4_0 [2]),
        .I5(s_IBUF[2]),
        .O(\s[0]_1 ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    \showw[4]_i_11 
       (.I0(\showw_reg[4]_i_5 [3]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[3]),
        .I3(input2_IBUF[3]),
        .I4(O[3]),
        .I5(s_IBUF[2]),
        .O(\s[0]_10 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    \showw[4]_i_13 
       (.I0(\showw[4]_i_16_n_0 ),
        .I1(input2_IBUF[3]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(\showw[4]_i_17_n_0 ),
        .I5(input1_IBUF[3]),
        .O(\showw[4]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h000033008B8BB88B)) 
    \showw[4]_i_14 
       (.I0(c0_IBUF),
        .I1(s_IBUF[0]),
        .I2(\showw[4]_i_18_n_0 ),
        .I3(input2_IBUF[3]),
        .I4(input1_IBUF[3]),
        .I5(s_IBUF[2]),
        .O(\showw[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFBFFFFF)) 
    \showw[4]_i_15 
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .I2(input2_IBUF[0]),
        .I3(input1_IBUF[0]),
        .I4(c0_IBUF),
        .I5(cy_OBUF_inst_i_31_n_0),
        .O(\input1[1] ));
  LUT6 #(
    .INIT(64'hE0E0E00000000000)) 
    \showw[4]_i_16 
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .I2(c0_IBUF),
        .I3(input2_IBUF[0]),
        .I4(input1_IBUF[0]),
        .I5(\u1/ls181/L0_out [8]),
        .O(\showw[4]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \showw[4]_i_17 
       (.I0(input1_IBUF[2]),
        .I1(c0_IBUF),
        .I2(input1_IBUF[0]),
        .I3(input1_IBUF[1]),
        .O(\showw[4]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hD0D000D000000000)) 
    \showw[4]_i_18 
       (.I0(input2_IBUF[2]),
        .I1(input1_IBUF[2]),
        .I2(c0_IBUF),
        .I3(input2_IBUF[0]),
        .I4(input1_IBUF[0]),
        .I5(zn_OBUF_inst_i_75_n_0),
        .O(\showw[4]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    \showw[4]_i_7 
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .I2(\showw_reg[4]_i_3 [3]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[2]),
        .I5(s_IBUF[2]),
        .O(\input1[3]_0 ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    \showw[4]_i_9 
       (.I0(\showw_reg[4]_i_4 [3]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[3]),
        .I3(input1_IBUF[3]),
        .I4(\showw_reg[4]_i_4_0 [3]),
        .I5(s_IBUF[2]),
        .O(\s[0]_2 ));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    \showw[7]_i_12 
       (.I0(input1_IBUF[7]),
        .I1(input2_IBUF[7]),
        .I2(\showw_reg[7]_i_4 [3]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[6]),
        .I5(s_IBUF[2]),
        .O(\input1[7] ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    \showw[7]_i_14 
       (.I0(\showw_reg[7]_i_5 [3]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[7]),
        .I3(input1_IBUF[7]),
        .I4(\showw_reg[7]_i_5_0 [3]),
        .I5(s_IBUF[2]),
        .O(\s[0]_5 ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    \showw[7]_i_16 
       (.I0(\showw_reg[7]_i_6 [3]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[7]),
        .I3(input2_IBUF[7]),
        .I4(\showw_reg[7]_i_6_0 [3]),
        .I5(s_IBUF[2]),
        .O(\s[0]_14 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    \showw[7]_i_18 
       (.I0(cy_OBUF_inst_i_53_0),
        .I1(input2_IBUF[7]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(\input1[6] ),
        .I5(input1_IBUF[7]),
        .O(\showw[7]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h000033008B8BB88B)) 
    \showw[7]_i_19 
       (.I0(c0_IBUF),
        .I1(s_IBUF[0]),
        .I2(cy_OBUF_inst_i_28_0),
        .I3(input2_IBUF[7]),
        .I4(input1_IBUF[7]),
        .I5(s_IBUF[2]),
        .O(\showw[7]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    \showw[7]_i_20 
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .I2(\showw_reg[7]_i_4 [2]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[5]),
        .I5(s_IBUF[2]),
        .O(\input1[6]_0 ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    \showw[7]_i_22 
       (.I0(\showw_reg[7]_i_5 [2]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[6]),
        .I3(input1_IBUF[6]),
        .I4(\showw_reg[7]_i_5_0 [2]),
        .I5(s_IBUF[2]),
        .O(\s[0]_6 ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    \showw[7]_i_24 
       (.I0(\showw_reg[7]_i_6 [2]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[6]),
        .I3(input2_IBUF[6]),
        .I4(\showw_reg[7]_i_6_0 [2]),
        .I5(s_IBUF[2]),
        .O(\s[0]_13 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    \showw[7]_i_26 
       (.I0(\showw[7]_i_29_n_0 ),
        .I1(input2_IBUF[6]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(\showw[7]_i_30_n_0 ),
        .I5(input1_IBUF[6]),
        .O(\showw[7]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'h000033008B8BB88B)) 
    \showw[7]_i_27 
       (.I0(c0_IBUF),
        .I1(s_IBUF[0]),
        .I2(\showw[7]_i_31_n_0 ),
        .I3(input2_IBUF[6]),
        .I4(input1_IBUF[6]),
        .I5(s_IBUF[2]),
        .O(\showw[7]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEF)) 
    \showw[7]_i_28 
       (.I0(cy_OBUF_inst_i_32_n_0),
        .I1(input1_IBUF[2]),
        .I2(input2_IBUF[2]),
        .I3(c0),
        .I4(cy_OBUF_inst_i_29_n_0),
        .I5(cy_OBUF_inst_i_28_n_0),
        .O(\input1[2] ));
  LUT6 #(
    .INIT(64'hE000000000000000)) 
    \showw[7]_i_29 
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .I2(\u1/ls181/L0_out [6]),
        .I3(cy_OBUF_inst_i_51_n_0),
        .I4(\u1/ls181/L0_out [7]),
        .I5(\u1/ls181/L0_out [5]),
        .O(\showw[7]_i_29_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \showw[7]_i_30 
       (.I0(input1_IBUF[5]),
        .I1(cy_OBUF_inst_i_54_n_0),
        .O(\showw[7]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hD000000000000000)) 
    \showw[7]_i_31 
       (.I0(input2_IBUF[5]),
        .I1(input1_IBUF[5]),
        .I2(cy_OBUF_inst_i_29_n_0),
        .I3(cy_OBUF_inst_i_55_n_0),
        .I4(cy_OBUF_inst_i_31_n_0),
        .I5(cy_OBUF_inst_i_32_n_0),
        .O(\showw[7]_i_31_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[0] 
       (.C(clks),
        .CE(1'b1),
        .D(D[0]),
        .PRE(AR),
        .Q(\showw_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[10] 
       (.C(clks),
        .CE(1'b1),
        .D(input2_IBUF[2]),
        .PRE(AR),
        .Q(p_13_in[2]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[11] 
       (.C(clks),
        .CE(1'b1),
        .D(input2_IBUF[3]),
        .PRE(AR),
        .Q(p_13_in[3]));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[12] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(input2_IBUF[4]),
        .Q(p_12_in[0]));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[13] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(input2_IBUF[5]),
        .Q(p_12_in[1]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[14] 
       (.C(clks),
        .CE(1'b1),
        .D(input2_IBUF[6]),
        .PRE(AR),
        .Q(p_12_in[2]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[15] 
       (.C(clks),
        .CE(1'b1),
        .D(input2_IBUF[7]),
        .PRE(AR),
        .Q(p_12_in[3]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[16] 
       (.C(clks),
        .CE(1'b1),
        .D(input1_IBUF[0]),
        .PRE(AR),
        .Q(p_11_in[0]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[17] 
       (.C(clks),
        .CE(1'b1),
        .D(input1_IBUF[1]),
        .PRE(AR),
        .Q(p_11_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[18] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(input1_IBUF[2]),
        .Q(p_11_in[2]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[19] 
       (.C(clks),
        .CE(1'b1),
        .D(input1_IBUF[3]),
        .PRE(AR),
        .Q(p_11_in[3]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[1] 
       (.C(clks),
        .CE(1'b1),
        .D(D[1]),
        .PRE(AR),
        .Q(\showw_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[20] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(input1_IBUF[4]),
        .Q(p_10_in[0]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[21] 
       (.C(clks),
        .CE(1'b1),
        .D(input1_IBUF[5]),
        .PRE(AR),
        .Q(p_10_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[22] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(input1_IBUF[6]),
        .Q(p_10_in[2]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[23] 
       (.C(clks),
        .CE(1'b1),
        .D(input1_IBUF[7]),
        .PRE(AR),
        .Q(p_10_in[3]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[27] 
       (.C(clks),
        .CE(1'b1),
        .D(1'b0),
        .PRE(AR),
        .Q(p_9_in));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[2] 
       (.C(clks),
        .CE(1'b1),
        .D(D[2]),
        .PRE(AR),
        .Q(\showw_reg_n_0_[2] ));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[3] 
       (.C(clks),
        .CE(1'b1),
        .D(D[3]),
        .PRE(AR),
        .Q(\showw_reg_n_0_[3] ));
  MUXF7 \showw_reg[3]_i_6 
       (.I0(\showw[3]_i_13_n_0 ),
        .I1(\showw[3]_i_14_n_0 ),
        .O(\s[1]_1 ),
        .S(s_IBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[4] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(D[4]),
        .Q(p_14_in[0]));
  MUXF7 \showw_reg[4]_i_6 
       (.I0(\showw[4]_i_13_n_0 ),
        .I1(\showw[4]_i_14_n_0 ),
        .O(\s[1]_2 ),
        .S(s_IBUF[1]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[5] 
       (.C(clks),
        .CE(1'b1),
        .D(D[5]),
        .PRE(AR),
        .Q(p_14_in[1]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[6] 
       (.C(clks),
        .CE(1'b1),
        .D(D[6]),
        .PRE(AR),
        .Q(p_14_in[2]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[7] 
       (.C(clks),
        .CE(1'b1),
        .D(D[7]),
        .PRE(AR),
        .Q(p_14_in[3]));
  MUXF7 \showw_reg[7]_i_11 
       (.I0(\showw[7]_i_26_n_0 ),
        .I1(\showw[7]_i_27_n_0 ),
        .O(\s[1]_6 ),
        .S(s_IBUF[1]));
  MUXF7 \showw_reg[7]_i_7 
       (.I0(\showw[7]_i_18_n_0 ),
        .I1(\showw[7]_i_19_n_0 ),
        .O(\s[1]_5 ),
        .S(s_IBUF[1]));
  FDPE #(
    .INIT(1'b1)) 
    \showw_reg[8] 
       (.C(clks),
        .CE(1'b1),
        .D(input2_IBUF[0]),
        .PRE(AR),
        .Q(p_13_in[0]));
  FDCE #(
    .INIT(1'b0)) 
    \showw_reg[9] 
       (.C(clks),
        .CE(1'b1),
        .CLR(AR),
        .D(input2_IBUF[1]),
        .Q(p_13_in[1]));
  MUXF7 zn_OBUF_inst_i_11
       (.I0(zn_OBUF_inst_i_38_n_0),
        .I1(zn_OBUF_inst_i_39_n_0),
        .O(\s[1]_4 ),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_15
       (.I0(zn_OBUF_inst_i_46_n_0),
        .I1(zn_OBUF_inst_i_47_n_0),
        .O(\s[1]_3 ),
        .S(s_IBUF[1]));
  MUXF7 zn_OBUF_inst_i_23
       (.I0(zn_OBUF_inst_i_54_n_0),
        .I1(zn_OBUF_inst_i_55_n_0),
        .O(\s[1]_0 ),
        .S(s_IBUF[1]));
  LUT6 #(
    .INIT(64'h00A01DBD005F1D42)) 
    zn_OBUF_inst_i_27
       (.I0(s_IBUF[1]),
        .I1(input2_IBUF[0]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(input1_IBUF[0]),
        .I5(c0_IBUF),
        .O(\s[1] ));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    zn_OBUF_inst_i_32
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .I2(\showw_reg[7]_i_4 [1]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[4]),
        .I5(s_IBUF[2]),
        .O(\input1[5] ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    zn_OBUF_inst_i_34
       (.I0(\showw_reg[7]_i_5 [1]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[5]),
        .I3(input1_IBUF[5]),
        .I4(\showw_reg[7]_i_5_0 [1]),
        .I5(s_IBUF[2]),
        .O(\s[0]_4 ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    zn_OBUF_inst_i_36
       (.I0(\showw_reg[7]_i_6 [1]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[5]),
        .I3(input2_IBUF[5]),
        .I4(\showw_reg[7]_i_6_0 [1]),
        .I5(s_IBUF[2]),
        .O(\s[0]_12 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    zn_OBUF_inst_i_38
       (.I0(zn_OBUF_inst_i_63_n_0),
        .I1(input2_IBUF[5]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(cy_OBUF_inst_i_54_n_0),
        .I5(input1_IBUF[5]),
        .O(zn_OBUF_inst_i_38_n_0));
  LUT6 #(
    .INIT(64'h000033008B8BB88B)) 
    zn_OBUF_inst_i_39
       (.I0(c0_IBUF),
        .I1(s_IBUF[0]),
        .I2(zn_OBUF_inst_i_64_n_0),
        .I3(input2_IBUF[5]),
        .I4(input1_IBUF[5]),
        .I5(s_IBUF[2]),
        .O(zn_OBUF_inst_i_39_n_0));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    zn_OBUF_inst_i_40
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .I2(\showw_reg[7]_i_4 [0]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[3]),
        .I5(s_IBUF[2]),
        .O(\input1[4] ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    zn_OBUF_inst_i_42
       (.I0(\showw_reg[7]_i_5 [0]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[4]),
        .I3(input1_IBUF[4]),
        .I4(\showw_reg[7]_i_5_0 [0]),
        .I5(s_IBUF[2]),
        .O(\s[0]_3 ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    zn_OBUF_inst_i_44
       (.I0(\showw_reg[7]_i_6 [0]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[4]),
        .I3(input2_IBUF[4]),
        .I4(\showw_reg[7]_i_6_0 [0]),
        .I5(s_IBUF[2]),
        .O(\s[0]_11 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    zn_OBUF_inst_i_46
       (.I0(zn_OBUF_inst_i_66_n_0),
        .I1(input2_IBUF[4]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(zn_OBUF_inst_i_67_n_0),
        .I5(input1_IBUF[4]),
        .O(zn_OBUF_inst_i_46_n_0));
  LUT6 #(
    .INIT(64'h000033008B8BB88B)) 
    zn_OBUF_inst_i_47
       (.I0(c0_IBUF),
        .I1(s_IBUF[0]),
        .I2(zn_OBUF_inst_i_68_n_0),
        .I3(input2_IBUF[4]),
        .I4(input1_IBUF[4]),
        .I5(s_IBUF[2]),
        .O(zn_OBUF_inst_i_47_n_0));
  LUT6 #(
    .INIT(64'hBB00BB00F0FFF000)) 
    zn_OBUF_inst_i_48
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .I2(\showw_reg[4]_i_3 [1]),
        .I3(s_IBUF[0]),
        .I4(input1_IBUF[0]),
        .I5(s_IBUF[2]),
        .O(\input1[1]_0 ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    zn_OBUF_inst_i_50
       (.I0(\showw_reg[4]_i_4 [1]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[1]),
        .I3(input1_IBUF[1]),
        .I4(\showw_reg[4]_i_4_0 [1]),
        .I5(s_IBUF[2]),
        .O(\s[0]_0 ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    zn_OBUF_inst_i_52
       (.I0(\showw_reg[4]_i_5 [1]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[1]),
        .I3(input2_IBUF[1]),
        .I4(O[1]),
        .I5(s_IBUF[2]),
        .O(\s[0]_8 ));
  LUT6 #(
    .INIT(64'h0050005F3F6F3F60)) 
    zn_OBUF_inst_i_54
       (.I0(zn_OBUF_inst_i_73_n_0),
        .I1(input2_IBUF[1]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[2]),
        .I4(zn_OBUF_inst_i_74_n_0),
        .I5(input1_IBUF[1]),
        .O(zn_OBUF_inst_i_54_n_0));
  LUT6 #(
    .INIT(64'h00005555BA55EF00)) 
    zn_OBUF_inst_i_55
       (.I0(s_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(input2_IBUF[0]),
        .I3(c0_IBUF),
        .I4(zn_OBUF_inst_i_75_n_0),
        .I5(s_IBUF[2]),
        .O(zn_OBUF_inst_i_55_n_0));
  LUT6 #(
    .INIT(64'hBBFFBBFFF0FFF000)) 
    zn_OBUF_inst_i_56
       (.I0(input1_IBUF[0]),
        .I1(input2_IBUF[0]),
        .I2(\showw_reg[4]_i_3 [0]),
        .I3(s_IBUF[0]),
        .I4(c0_IBUF),
        .I5(s_IBUF[2]),
        .O(\input1[0] ));
  LUT6 #(
    .INIT(64'hC03CC03CBBBB8888)) 
    zn_OBUF_inst_i_58
       (.I0(\showw_reg[4]_i_4 [0]),
        .I1(s_IBUF[0]),
        .I2(input2_IBUF[0]),
        .I3(input1_IBUF[0]),
        .I4(\showw_reg[4]_i_4_0 [0]),
        .I5(s_IBUF[2]),
        .O(\s[0] ));
  LUT6 #(
    .INIT(64'h03FF03FFBBBB8888)) 
    zn_OBUF_inst_i_60
       (.I0(\showw_reg[4]_i_5 [0]),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(O[0]),
        .I5(s_IBUF[2]),
        .O(\s[0]_7 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFBFF)) 
    zn_OBUF_inst_i_62
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .I2(c0),
        .I3(input2_IBUF[2]),
        .I4(input1_IBUF[2]),
        .I5(cy_OBUF_inst_i_32_n_0),
        .O(\input1[3] ));
  LUT6 #(
    .INIT(64'hE000E000E0000000)) 
    zn_OBUF_inst_i_63
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .I2(\u1/ls181/L0_out [7]),
        .I3(cy_OBUF_inst_i_51_n_0),
        .I4(input1_IBUF[3]),
        .I5(input2_IBUF[3]),
        .O(zn_OBUF_inst_i_63_n_0));
  LUT6 #(
    .INIT(64'hD0000000D000D000)) 
    zn_OBUF_inst_i_64
       (.I0(input2_IBUF[4]),
        .I1(input1_IBUF[4]),
        .I2(cy_OBUF_inst_i_31_n_0),
        .I3(cy_OBUF_inst_i_55_n_0),
        .I4(input1_IBUF[3]),
        .I5(input2_IBUF[3]),
        .O(zn_OBUF_inst_i_64_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFBFF)) 
    zn_OBUF_inst_i_65
       (.I0(cy_OBUF_inst_i_31_n_0),
        .I1(c0_IBUF),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(zn_OBUF_inst_i_75_n_0),
        .I5(cy_OBUF_inst_i_29_n_0),
        .O(c0_0));
  LUT6 #(
    .INIT(64'h8880000000000000)) 
    zn_OBUF_inst_i_66
       (.I0(\u1/ls181/L0_out [6]),
        .I1(\u1/ls181/L0_out [8]),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(c0_IBUF),
        .I5(\u1/ls181/L0_out [7]),
        .O(zn_OBUF_inst_i_66_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    zn_OBUF_inst_i_67
       (.I0(input1_IBUF[3]),
        .I1(input1_IBUF[1]),
        .I2(input1_IBUF[0]),
        .I3(c0_IBUF),
        .I4(input1_IBUF[2]),
        .O(zn_OBUF_inst_i_67_n_0));
  LUT6 #(
    .INIT(64'h8088000000000000)) 
    zn_OBUF_inst_i_68
       (.I0(cy_OBUF_inst_i_29_n_0),
        .I1(zn_OBUF_inst_i_75_n_0),
        .I2(input1_IBUF[0]),
        .I3(input2_IBUF[0]),
        .I4(c0_IBUF),
        .I5(cy_OBUF_inst_i_31_n_0),
        .O(zn_OBUF_inst_i_68_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    zn_OBUF_inst_i_72
       (.I0(input2_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(c0_IBUF),
        .O(\input2[0] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    zn_OBUF_inst_i_73
       (.I0(c0_IBUF),
        .I1(input2_IBUF[0]),
        .I2(input1_IBUF[0]),
        .O(zn_OBUF_inst_i_73_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    zn_OBUF_inst_i_74
       (.I0(c0_IBUF),
        .I1(input1_IBUF[0]),
        .O(zn_OBUF_inst_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hB)) 
    zn_OBUF_inst_i_75
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .O(zn_OBUF_inst_i_75_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'hE)) 
    zn_OBUF_inst_i_76
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .O(\u1/ls181/L0_out [8]));
endmodule

(* NotValidForBitStream *)
module test
   (clk,
    rst,
    seg_sel,
    seg_data,
    input1,
    input2,
    s,
    f_in,
    c0,
    cy,
    zn);
  input clk;
  input rst;
  output [15:0]seg_sel;
  output [7:0]seg_data;
  input [7:0]input1;
  input [7:0]input2;
  input [4:0]s;
  input [1:0]f_in;
  input c0;
  output cy;
  output zn;

  wire c0;
  wire c0_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire cy;
  wire cy_OBUF;
  wire cy_OBUF_inst_i_10_n_0;
  wire cy_OBUF_inst_i_13_n_0;
  wire cy_OBUF_inst_i_14_n_0;
  wire cy_OBUF_inst_i_36_n_0;
  wire cy_OBUF_inst_i_37_n_0;
  wire cy_OBUF_inst_i_38_n_0;
  wire cy_OBUF_inst_i_4_n_0;
  wire cy_OBUF_inst_i_5_n_0;
  wire cy_OBUF_inst_i_68_n_0;
  wire cy_OBUF_inst_i_69_n_0;
  wire cy_OBUF_inst_i_70_n_0;
  wire cy_OBUF_inst_i_71_n_0;
  wire cy_OBUF_inst_i_75_n_0;
  wire cy_OBUF_inst_i_79_n_0;
  wire cy_OBUF_inst_i_7_n_0;
  wire cy_OBUF_inst_i_9_n_0;
  wire [1:0]f_in;
  wire [1:0]f_in_IBUF;
  wire [7:0]input1;
  wire [7:0]input1_IBUF;
  wire [7:0]input2;
  wire [7:0]input2_IBUF;
  wire [2:2]\ls181/L0_out ;
  wire rst;
  wire rst_IBUF;
  wire [4:0]s;
  wire [4:0]s_IBUF;
  wire [7:0]seg_data;
  wire [6:0]seg_data_OBUF;
  wire [15:0]seg_sel;
  wire [15:0]seg_sel_OBUF;
  wire [7:0]show;
  wire u1_n_10;
  wire u1_n_11;
  wire u1_n_12;
  wire u1_n_13;
  wire u1_n_14;
  wire u1_n_15;
  wire u1_n_16;
  wire u1_n_17;
  wire u1_n_18;
  wire u1_n_19;
  wire u1_n_20;
  wire u1_n_21;
  wire u1_n_22;
  wire u1_n_23;
  wire u1_n_24;
  wire u1_n_25;
  wire u1_n_26;
  wire u1_n_27;
  wire u1_n_28;
  wire u1_n_29;
  wire u1_n_30;
  wire u1_n_31;
  wire u1_n_32;
  wire u1_n_33;
  wire u1_n_34;
  wire u1_n_35;
  wire u1_n_36;
  wire u1_n_37;
  wire u1_n_38;
  wire u1_n_39;
  wire u1_n_40;
  wire u1_n_41;
  wire u1_n_42;
  wire u1_n_43;
  wire u1_n_44;
  wire u1_n_45;
  wire u1_n_46;
  wire u1_n_47;
  wire u1_n_48;
  wire u1_n_49;
  wire u1_n_50;
  wire u1_n_51;
  wire u1_n_52;
  wire u1_n_53;
  wire u1_n_54;
  wire u1_n_55;
  wire u2_n_0;
  wire u2_n_1;
  wire u2_n_10;
  wire u2_n_11;
  wire u2_n_12;
  wire u2_n_13;
  wire u2_n_14;
  wire u2_n_15;
  wire u2_n_16;
  wire u2_n_17;
  wire u2_n_18;
  wire u2_n_19;
  wire u2_n_2;
  wire u2_n_20;
  wire u2_n_21;
  wire u2_n_22;
  wire u2_n_23;
  wire u2_n_24;
  wire u2_n_25;
  wire u2_n_26;
  wire u2_n_27;
  wire u2_n_28;
  wire u2_n_29;
  wire u2_n_3;
  wire u2_n_30;
  wire u2_n_31;
  wire u2_n_32;
  wire u2_n_33;
  wire u2_n_34;
  wire u2_n_35;
  wire u2_n_36;
  wire u2_n_37;
  wire u2_n_38;
  wire u2_n_39;
  wire u2_n_4;
  wire u2_n_40;
  wire u2_n_41;
  wire u2_n_42;
  wire u2_n_43;
  wire u2_n_44;
  wire u2_n_45;
  wire u2_n_46;
  wire u2_n_47;
  wire u2_n_48;
  wire u2_n_5;
  wire u2_n_6;
  wire u2_n_65;
  wire u2_n_7;
  wire u2_n_8;
  wire u2_n_9;
  wire zn;
  wire zn_OBUF;
  wire zn_OBUF_inst_i_80_n_0;
  wire zn_OBUF_inst_i_84_n_0;
  wire zn_OBUF_inst_i_88_n_0;

initial begin
 $sdf_annotate("test_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF c0_IBUF_inst
       (.I(c0),
        .O(c0_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF cy_OBUF_inst
       (.I(cy_OBUF),
        .O(cy));
  LUT6 #(
    .INIT(64'h00000000FB00FBFF)) 
    cy_OBUF_inst_i_10
       (.I0(input1_IBUF[7]),
        .I1(input2_IBUF[7]),
        .I2(u2_n_27),
        .I3(s_IBUF[0]),
        .I4(u1_n_28),
        .I5(s_IBUF[4]),
        .O(cy_OBUF_inst_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFAFFFA0FF80FF80)) 
    cy_OBUF_inst_i_13
       (.I0(u2_n_9),
        .I1(input2_IBUF[7]),
        .I2(s_IBUF[0]),
        .I3(s_IBUF[4]),
        .I4(u2_n_10),
        .I5(input1_IBUF[7]),
        .O(cy_OBUF_inst_i_13_n_0));
  LUT6 #(
    .INIT(64'h000000008BBB8B8B)) 
    cy_OBUF_inst_i_14
       (.I0(c0_IBUF),
        .I1(s_IBUF[0]),
        .I2(u2_n_7),
        .I3(input1_IBUF[7]),
        .I4(input2_IBUF[7]),
        .I5(s_IBUF[4]),
        .O(cy_OBUF_inst_i_14_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_35
       (.I0(input1_IBUF[7]),
        .I1(input2_IBUF[7]),
        .O(\ls181/L0_out ));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_36
       (.I0(input1_IBUF[6]),
        .I1(input2_IBUF[6]),
        .O(cy_OBUF_inst_i_36_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_37
       (.I0(input1_IBUF[5]),
        .I1(input2_IBUF[5]),
        .O(cy_OBUF_inst_i_37_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_38
       (.I0(input1_IBUF[4]),
        .I1(input2_IBUF[4]),
        .O(cy_OBUF_inst_i_38_n_0));
  LUT6 #(
    .INIT(64'hBBBBBBBBB8BBB888)) 
    cy_OBUF_inst_i_4
       (.I0(cy_OBUF_inst_i_10_n_0),
        .I1(s_IBUF[1]),
        .I2(u1_n_27),
        .I3(s_IBUF[0]),
        .I4(u1_n_18),
        .I5(s_IBUF[4]),
        .O(cy_OBUF_inst_i_4_n_0));
  MUXF7 cy_OBUF_inst_i_5
       (.I0(cy_OBUF_inst_i_13_n_0),
        .I1(cy_OBUF_inst_i_14_n_0),
        .O(cy_OBUF_inst_i_5_n_0),
        .S(s_IBUF[1]));
  LUT2 #(
    .INIT(4'h2)) 
    cy_OBUF_inst_i_68
       (.I0(input1_IBUF[0]),
        .I1(input2_IBUF[0]),
        .O(cy_OBUF_inst_i_68_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_69
       (.I0(input1_IBUF[3]),
        .I1(input2_IBUF[3]),
        .O(cy_OBUF_inst_i_69_n_0));
  LUT4 #(
    .INIT(16'hCCB8)) 
    cy_OBUF_inst_i_7
       (.I0(u1_n_55),
        .I1(s_IBUF[0]),
        .I2(input1_IBUF[7]),
        .I3(s_IBUF[4]),
        .O(cy_OBUF_inst_i_7_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_70
       (.I0(input1_IBUF[2]),
        .I1(input2_IBUF[2]),
        .O(cy_OBUF_inst_i_70_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    cy_OBUF_inst_i_71
       (.I0(input1_IBUF[1]),
        .I1(input2_IBUF[1]),
        .O(cy_OBUF_inst_i_71_n_0));
  LUT3 #(
    .INIT(8'h1E)) 
    cy_OBUF_inst_i_75
       (.I0(input2_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(c0_IBUF),
        .O(cy_OBUF_inst_i_75_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    cy_OBUF_inst_i_79
       (.I0(input1_IBUF[0]),
        .I1(c0_IBUF),
        .O(cy_OBUF_inst_i_79_n_0));
  LUT4 #(
    .INIT(16'hCCB8)) 
    cy_OBUF_inst_i_9
       (.I0(u1_n_46),
        .I1(s_IBUF[0]),
        .I2(u1_n_37),
        .I3(s_IBUF[4]),
        .O(cy_OBUF_inst_i_9_n_0));
  IBUF \f_in_IBUF[0]_inst 
       (.I(f_in[0]),
        .O(f_in_IBUF[0]));
  IBUF \f_in_IBUF[1]_inst 
       (.I(f_in[1]),
        .O(f_in_IBUF[1]));
  IBUF \input1_IBUF[0]_inst 
       (.I(input1[0]),
        .O(input1_IBUF[0]));
  IBUF \input1_IBUF[1]_inst 
       (.I(input1[1]),
        .O(input1_IBUF[1]));
  IBUF \input1_IBUF[2]_inst 
       (.I(input1[2]),
        .O(input1_IBUF[2]));
  IBUF \input1_IBUF[3]_inst 
       (.I(input1[3]),
        .O(input1_IBUF[3]));
  IBUF \input1_IBUF[4]_inst 
       (.I(input1[4]),
        .O(input1_IBUF[4]));
  IBUF \input1_IBUF[5]_inst 
       (.I(input1[5]),
        .O(input1_IBUF[5]));
  IBUF \input1_IBUF[6]_inst 
       (.I(input1[6]),
        .O(input1_IBUF[6]));
  IBUF \input1_IBUF[7]_inst 
       (.I(input1[7]),
        .O(input1_IBUF[7]));
  IBUF \input2_IBUF[0]_inst 
       (.I(input2[0]),
        .O(input2_IBUF[0]));
  IBUF \input2_IBUF[1]_inst 
       (.I(input2[1]),
        .O(input2_IBUF[1]));
  IBUF \input2_IBUF[2]_inst 
       (.I(input2[2]),
        .O(input2_IBUF[2]));
  IBUF \input2_IBUF[3]_inst 
       (.I(input2[3]),
        .O(input2_IBUF[3]));
  IBUF \input2_IBUF[4]_inst 
       (.I(input2[4]),
        .O(input2_IBUF[4]));
  IBUF \input2_IBUF[5]_inst 
       (.I(input2[5]),
        .O(input2_IBUF[5]));
  IBUF \input2_IBUF[6]_inst 
       (.I(input2[6]),
        .O(input2_IBUF[6]));
  IBUF \input2_IBUF[7]_inst 
       (.I(input2[7]),
        .O(input2_IBUF[7]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF \s_IBUF[0]_inst 
       (.I(s[0]),
        .O(s_IBUF[0]));
  IBUF \s_IBUF[1]_inst 
       (.I(s[1]),
        .O(s_IBUF[1]));
  IBUF \s_IBUF[2]_inst 
       (.I(s[2]),
        .O(s_IBUF[2]));
  IBUF \s_IBUF[3]_inst 
       (.I(s[3]),
        .O(s_IBUF[3]));
  IBUF \s_IBUF[4]_inst 
       (.I(s[4]),
        .O(s_IBUF[4]));
  OBUF \seg_data_OBUF[0]_inst 
       (.I(seg_data_OBUF[0]),
        .O(seg_data[0]));
  OBUF \seg_data_OBUF[1]_inst 
       (.I(seg_data_OBUF[1]),
        .O(seg_data[1]));
  OBUF \seg_data_OBUF[2]_inst 
       (.I(seg_data_OBUF[2]),
        .O(seg_data[2]));
  OBUF \seg_data_OBUF[3]_inst 
       (.I(seg_data_OBUF[3]),
        .O(seg_data[3]));
  OBUF \seg_data_OBUF[4]_inst 
       (.I(seg_data_OBUF[4]),
        .O(seg_data[4]));
  OBUF \seg_data_OBUF[5]_inst 
       (.I(seg_data_OBUF[5]),
        .O(seg_data[5]));
  OBUF \seg_data_OBUF[6]_inst 
       (.I(seg_data_OBUF[6]),
        .O(seg_data[6]));
  OBUF \seg_data_OBUF[7]_inst 
       (.I(1'b1),
        .O(seg_data[7]));
  OBUF \seg_sel_OBUF[0]_inst 
       (.I(seg_sel_OBUF[0]),
        .O(seg_sel[0]));
  OBUF \seg_sel_OBUF[10]_inst 
       (.I(seg_sel_OBUF[10]),
        .O(seg_sel[10]));
  OBUF \seg_sel_OBUF[11]_inst 
       (.I(seg_sel_OBUF[11]),
        .O(seg_sel[11]));
  OBUF \seg_sel_OBUF[12]_inst 
       (.I(seg_sel_OBUF[12]),
        .O(seg_sel[12]));
  OBUF \seg_sel_OBUF[13]_inst 
       (.I(seg_sel_OBUF[13]),
        .O(seg_sel[13]));
  OBUF \seg_sel_OBUF[14]_inst 
       (.I(seg_sel_OBUF[14]),
        .O(seg_sel[14]));
  OBUF \seg_sel_OBUF[15]_inst 
       (.I(seg_sel_OBUF[15]),
        .O(seg_sel[15]));
  OBUF \seg_sel_OBUF[1]_inst 
       (.I(seg_sel_OBUF[1]),
        .O(seg_sel[1]));
  OBUF \seg_sel_OBUF[2]_inst 
       (.I(seg_sel_OBUF[2]),
        .O(seg_sel[2]));
  OBUF \seg_sel_OBUF[3]_inst 
       (.I(seg_sel_OBUF[3]),
        .O(seg_sel[3]));
  OBUF \seg_sel_OBUF[4]_inst 
       (.I(seg_sel_OBUF[4]),
        .O(seg_sel[4]));
  OBUF \seg_sel_OBUF[5]_inst 
       (.I(seg_sel_OBUF[5]),
        .O(seg_sel[5]));
  OBUF \seg_sel_OBUF[6]_inst 
       (.I(seg_sel_OBUF[6]),
        .O(seg_sel[6]));
  OBUF \seg_sel_OBUF[7]_inst 
       (.I(seg_sel_OBUF[7]),
        .O(seg_sel[7]));
  OBUF \seg_sel_OBUF[8]_inst 
       (.I(seg_sel_OBUF[8]),
        .O(seg_sel[8]));
  OBUF \seg_sel_OBUF[9]_inst 
       (.I(seg_sel_OBUF[9]),
        .O(seg_sel[9]));
  alu u1
       (.CO(u1_n_18),
        .D(show),
        .DI({cy_OBUF_inst_i_69_n_0,cy_OBUF_inst_i_70_n_0,cy_OBUF_inst_i_71_n_0}),
        .O({u1_n_10,u1_n_11,u1_n_12,u1_n_13}),
        .S({u2_n_45,u2_n_46,u2_n_47,u2_n_48}),
        .c0({u1_n_19,u1_n_20,u1_n_21,u1_n_22}),
        .c0_IBUF(c0_IBUF),
        .cy(cy_OBUF_inst_i_4_n_0),
        .cy_0(cy_OBUF_inst_i_5_n_0),
        .cy_OBUF(cy_OBUF),
        .cy_OBUF_inst_i_1(cy_OBUF_inst_i_9_n_0),
        .cy_OBUF_inst_i_1_0(cy_OBUF_inst_i_7_n_0),
        .cy_OBUF_inst_i_20(u1_n_27),
        .cy_OBUF_inst_i_25(u1_n_55),
        .cy_OBUF_inst_i_26(u1_n_46),
        .cy_OBUF_inst_i_27(u1_n_37),
        .cy_OBUF_inst_i_42({u1_n_23,u1_n_24,u1_n_25,u1_n_26}),
        .f_in_IBUF(f_in_IBUF),
        .\input1[0] ({u1_n_47,u1_n_48,u1_n_49,u1_n_50}),
        .\input1[3] ({u1_n_29,u1_n_30,u1_n_31,u1_n_32}),
        .\input1[7] ({u1_n_14,u1_n_15,u1_n_16,u1_n_17}),
        .\input1[7]_0 ({u1_n_33,u1_n_34,u1_n_35,u1_n_36}),
        .\input1[7]_1 ({u1_n_42,u1_n_43,u1_n_44,u1_n_45}),
        .\input1[7]_2 ({u1_n_51,u1_n_52,u1_n_53,u1_n_54}),
        .input1_IBUF(input1_IBUF),
        .\input2[0] ({u1_n_38,u1_n_39,u1_n_40,u1_n_41}),
        .input2_IBUF(input2_IBUF),
        .minusOp_carry__0(u1_n_28),
        .s_IBUF(s_IBUF),
        .\showw[3]_i_2 (u2_n_13),
        .\showw[3]_i_2_0 (u2_n_35),
        .\showw[3]_i_2_1 (u2_n_21),
        .\showw[4]_i_2 (u2_n_14),
        .\showw[4]_i_2_0 (u2_n_36),
        .\showw[4]_i_2_1 (u2_n_22),
        .\showw[7]_i_2 (u2_n_17),
        .\showw[7]_i_2_0 (u2_n_40),
        .\showw[7]_i_2_1 (u2_n_26),
        .\showw[7]_i_3 (u2_n_18),
        .\showw[7]_i_3_0 (u2_n_39),
        .\showw[7]_i_3_1 (u2_n_25),
        .\showw_reg[2] (u2_n_1),
        .\showw_reg[3] (u2_n_2),
        .\showw_reg[3]_i_5 (u2_n_28),
        .\showw_reg[4] (u2_n_3),
        .\showw_reg[4]_i_5 (u2_n_32),
        .\showw_reg[5] (u2_n_4),
        .\showw_reg[6] (u2_n_5),
        .\showw_reg[6]_0 (u2_n_6),
        .\showw_reg[6]_1 (u2_n_8),
        .\showw_reg[7] (u2_n_0),
        .\showw_reg[7]_i_10 (u2_n_29),
        .\showw_reg[7]_i_6 (u2_n_27),
        .zn_OBUF(zn_OBUF),
        .zn_OBUF_inst_i_10(u2_n_30),
        .zn_OBUF_inst_i_14(u2_n_31),
        .zn_OBUF_inst_i_2(u2_n_16),
        .zn_OBUF_inst_i_22(u2_n_65),
        .zn_OBUF_inst_i_2_0(u2_n_38),
        .zn_OBUF_inst_i_2_1(u2_n_24),
        .zn_OBUF_inst_i_3(u2_n_15),
        .zn_OBUF_inst_i_3_0(u2_n_37),
        .zn_OBUF_inst_i_3_1(u2_n_23),
        .zn_OBUF_inst_i_41({u2_n_41,u2_n_42,u2_n_43,u2_n_44}),
        .zn_OBUF_inst_i_44({\ls181/L0_out ,cy_OBUF_inst_i_36_n_0,cy_OBUF_inst_i_37_n_0,cy_OBUF_inst_i_38_n_0}),
        .zn_OBUF_inst_i_5(u2_n_12),
        .zn_OBUF_inst_i_56(zn_OBUF_inst_i_80_n_0),
        .zn_OBUF_inst_i_58(zn_OBUF_inst_i_88_n_0),
        .zn_OBUF_inst_i_58_0(zn_OBUF_inst_i_84_n_0),
        .zn_OBUF_inst_i_5_0(u2_n_34),
        .zn_OBUF_inst_i_5_1(u2_n_20),
        .zn_OBUF_inst_i_6(u2_n_19),
        .zn_OBUF_inst_i_60(cy_OBUF_inst_i_68_n_0),
        .zn_OBUF_inst_i_60_0(cy_OBUF_inst_i_79_n_0),
        .zn_OBUF_inst_i_60_1(cy_OBUF_inst_i_75_n_0),
        .zn_OBUF_inst_i_6_0(u2_n_11),
        .zn_OBUF_inst_i_6_1(u2_n_33));
  state u2
       (.AR(rst_IBUF),
        .D(show),
        .O({u1_n_10,u1_n_11,u1_n_12,u1_n_13}),
        .S({u2_n_45,u2_n_46,u2_n_47,u2_n_48}),
        .c0(u2_n_28),
        .c0_0(u2_n_31),
        .c0_IBUF(c0_IBUF),
        .clk(clk_IBUF_BUFG),
        .cy_OBUF_inst_i_28_0(u2_n_7),
        .cy_OBUF_inst_i_33_0(u2_n_27),
        .cy_OBUF_inst_i_53_0(u2_n_9),
        .\input1[0] (u2_n_33),
        .\input1[1] (u2_n_32),
        .\input1[1]_0 (u2_n_34),
        .\input1[2] (u2_n_29),
        .\input1[2]_0 (u2_n_35),
        .\input1[3] (u2_n_30),
        .\input1[3]_0 (u2_n_36),
        .\input1[4] (u2_n_37),
        .\input1[5] (u2_n_38),
        .\input1[6] (u2_n_10),
        .\input1[6]_0 (u2_n_39),
        .\input1[7] (u2_n_40),
        .input1_IBUF(input1_IBUF),
        .\input2[0] (u2_n_65),
        .\input2[7] ({u2_n_41,u2_n_42,u2_n_43,u2_n_44}),
        .input2_IBUF(input2_IBUF),
        .\s[0] (u2_n_11),
        .\s[0]_0 (u2_n_12),
        .\s[0]_1 (u2_n_13),
        .\s[0]_10 (u2_n_22),
        .\s[0]_11 (u2_n_23),
        .\s[0]_12 (u2_n_24),
        .\s[0]_13 (u2_n_25),
        .\s[0]_14 (u2_n_26),
        .\s[0]_2 (u2_n_14),
        .\s[0]_3 (u2_n_15),
        .\s[0]_4 (u2_n_16),
        .\s[0]_5 (u2_n_17),
        .\s[0]_6 (u2_n_18),
        .\s[0]_7 (u2_n_19),
        .\s[0]_8 (u2_n_20),
        .\s[0]_9 (u2_n_21),
        .\s[1] (u2_n_0),
        .\s[1]_0 (u2_n_1),
        .\s[1]_1 (u2_n_2),
        .\s[1]_2 (u2_n_3),
        .\s[1]_3 (u2_n_4),
        .\s[1]_4 (u2_n_5),
        .\s[1]_5 (u2_n_6),
        .\s[1]_6 (u2_n_8),
        .s_IBUF({s_IBUF[4],s_IBUF[1:0]}),
        .seg_data_OBUF(seg_data_OBUF),
        .seg_sel_OBUF(seg_sel_OBUF),
        .\showw_reg[4]_i_3 ({u1_n_47,u1_n_48,u1_n_49,u1_n_50}),
        .\showw_reg[4]_i_4 ({u1_n_38,u1_n_39,u1_n_40,u1_n_41}),
        .\showw_reg[4]_i_4_0 ({u1_n_29,u1_n_30,u1_n_31,u1_n_32}),
        .\showw_reg[4]_i_5 ({u1_n_19,u1_n_20,u1_n_21,u1_n_22}),
        .\showw_reg[7]_i_4 ({u1_n_51,u1_n_52,u1_n_53,u1_n_54}),
        .\showw_reg[7]_i_5 ({u1_n_42,u1_n_43,u1_n_44,u1_n_45}),
        .\showw_reg[7]_i_5_0 ({u1_n_33,u1_n_34,u1_n_35,u1_n_36}),
        .\showw_reg[7]_i_6 ({u1_n_23,u1_n_24,u1_n_25,u1_n_26}),
        .\showw_reg[7]_i_6_0 ({u1_n_14,u1_n_15,u1_n_16,u1_n_17}));
  OBUF zn_OBUF_inst
       (.I(zn_OBUF),
        .O(zn));
  LUT3 #(
    .INIT(8'h1E)) 
    zn_OBUF_inst_i_80
       (.I0(input2_IBUF[0]),
        .I1(input1_IBUF[0]),
        .I2(c0_IBUF),
        .O(zn_OBUF_inst_i_80_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    zn_OBUF_inst_i_84
       (.I0(input1_IBUF[0]),
        .I1(c0_IBUF),
        .O(zn_OBUF_inst_i_84_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    zn_OBUF_inst_i_88
       (.I0(input1_IBUF[0]),
        .I1(c0_IBUF),
        .O(zn_OBUF_inst_i_88_n_0));
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
