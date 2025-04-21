-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Wed Apr 20 10:32:42 2022
-- Host        : DESKTOP-8A0DOB0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               F:/desktop/study/test/soc/experiment/test2/test2.sim/sim_1/synth/func/xsim/tb_adder_func_synth.vhd
-- Design      : parellel_adder
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity parellel_adder is
  port (
    clk : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    b : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c_in : in STD_LOGIC;
    sel_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    c_out : out STD_LOGIC;
    sum_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of parellel_adder : entity is true;
end parellel_adder;

architecture STRUCTURE of parellel_adder is
  signal a_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal b_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal c0 : STD_LOGIC;
  signal c00 : STD_LOGIC;
  signal c1 : STD_LOGIC;
  signal c10 : STD_LOGIC;
  signal c2 : STD_LOGIC;
  signal c20 : STD_LOGIC;
  signal c3 : STD_LOGIC;
  signal c30 : STD_LOGIC;
  signal c4 : STD_LOGIC;
  signal c40 : STD_LOGIC;
  signal c5 : STD_LOGIC;
  signal c50 : STD_LOGIC;
  signal c6 : STD_LOGIC;
  signal c60 : STD_LOGIC;
  signal c_in_IBUF : STD_LOGIC;
  signal c_out0 : STD_LOGIC;
  signal c_out_OBUF : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal p_14_out : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sel_in_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sel_out_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sum_out_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of c0_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of c1_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of c2_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of c3_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of c4_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of c5_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of c6_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of c_out_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \sum_out[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \sum_out[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \sum_out[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sum_out[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \sum_out[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \sum_out[5]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \sum_out[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \sum_out[7]_i_1\ : label is "soft_lutpair7";
begin
\a_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(0),
      O => a_IBUF(0)
    );
\a_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(1),
      O => a_IBUF(1)
    );
\a_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(2),
      O => a_IBUF(2)
    );
\a_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(3),
      O => a_IBUF(3)
    );
\a_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(4),
      O => a_IBUF(4)
    );
\a_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(5),
      O => a_IBUF(5)
    );
\a_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(6),
      O => a_IBUF(6)
    );
\a_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => a(7),
      O => a_IBUF(7)
    );
\b_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(0),
      O => b_IBUF(0)
    );
\b_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(1),
      O => b_IBUF(1)
    );
\b_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(2),
      O => b_IBUF(2)
    );
\b_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(3),
      O => b_IBUF(3)
    );
\b_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(4),
      O => b_IBUF(4)
    );
\b_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(5),
      O => b_IBUF(5)
    );
\b_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(6),
      O => b_IBUF(6)
    );
\b_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => b(7),
      O => b_IBUF(7)
    );
c0_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(0),
      I1 => c_in_IBUF,
      I2 => b_IBUF(0),
      O => c00
    );
c0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c00,
      Q => c0,
      R => '0'
    );
c1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(1),
      I1 => c0,
      I2 => b_IBUF(1),
      O => c10
    );
c1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c10,
      Q => c1,
      R => '0'
    );
c2_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(2),
      I1 => c1,
      I2 => b_IBUF(2),
      O => c20
    );
c2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c20,
      Q => c2,
      R => '0'
    );
c3_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(3),
      I1 => c2,
      I2 => b_IBUF(3),
      O => c30
    );
c3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c30,
      Q => c3,
      R => '0'
    );
c4_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(4),
      I1 => c3,
      I2 => b_IBUF(4),
      O => c40
    );
c4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c40,
      Q => c4,
      R => '0'
    );
c5_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(5),
      I1 => c4,
      I2 => b_IBUF(5),
      O => c50
    );
c5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c50,
      Q => c5,
      R => '0'
    );
c6_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(6),
      I1 => c5,
      I2 => b_IBUF(6),
      O => c60
    );
c6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c60,
      Q => c6,
      R => '0'
    );
c_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => c_in,
      O => c_in_IBUF
    );
c_out_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => c_out_OBUF,
      O => c_out
    );
c_out_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => a_IBUF(7),
      I1 => c6,
      I2 => b_IBUF(7),
      O => c_out0
    );
c_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => c_out0,
      Q => c_out_OBUF,
      R => '0'
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
\sel_in_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sel_in(0),
      O => sel_in_IBUF(0)
    );
\sel_in_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sel_in(1),
      O => sel_in_IBUF(1)
    );
\sel_in_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sel_in(2),
      O => sel_in_IBUF(2)
    );
\sel_in_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => sel_in(3),
      O => sel_in_IBUF(3)
    );
\sel_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sel_out_OBUF(0),
      O => sel_out(0)
    );
\sel_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sel_out_OBUF(1),
      O => sel_out(1)
    );
\sel_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sel_out_OBUF(2),
      O => sel_out(2)
    );
\sel_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sel_out_OBUF(3),
      O => sel_out(3)
    );
\sel_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sel_in_IBUF(0),
      Q => sel_out_OBUF(0),
      R => '0'
    );
\sel_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sel_in_IBUF(1),
      Q => sel_out_OBUF(1),
      R => '0'
    );
\sel_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sel_in_IBUF(2),
      Q => sel_out_OBUF(2),
      R => '0'
    );
\sel_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sel_in_IBUF(3),
      Q => sel_out_OBUF(3),
      R => '0'
    );
\sum_out[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(0),
      I1 => a_IBUF(0),
      I2 => c_in_IBUF,
      O => p_14_out(0)
    );
\sum_out[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(1),
      I1 => a_IBUF(1),
      I2 => c0,
      O => p_14_out(1)
    );
\sum_out[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(2),
      I1 => a_IBUF(2),
      I2 => c1,
      O => p_14_out(2)
    );
\sum_out[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(3),
      I1 => a_IBUF(3),
      I2 => c2,
      O => p_14_out(3)
    );
\sum_out[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(4),
      I1 => a_IBUF(4),
      I2 => c3,
      O => p_14_out(4)
    );
\sum_out[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(5),
      I1 => a_IBUF(5),
      I2 => c4,
      O => p_14_out(5)
    );
\sum_out[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(6),
      I1 => a_IBUF(6),
      I2 => c5,
      O => p_14_out(6)
    );
\sum_out[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => b_IBUF(7),
      I1 => a_IBUF(7),
      I2 => c6,
      O => p_14_out(7)
    );
\sum_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(0),
      O => sum_out(0)
    );
\sum_out_OBUF[10]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(10),
      T => '1'
    );
\sum_out_OBUF[11]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(11),
      T => '1'
    );
\sum_out_OBUF[12]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(12),
      T => '1'
    );
\sum_out_OBUF[13]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(13),
      T => '1'
    );
\sum_out_OBUF[14]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(14),
      T => '1'
    );
\sum_out_OBUF[15]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(15),
      T => '1'
    );
\sum_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(1),
      O => sum_out(1)
    );
\sum_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(2),
      O => sum_out(2)
    );
\sum_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(3),
      O => sum_out(3)
    );
\sum_out_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(4),
      O => sum_out(4)
    );
\sum_out_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(5),
      O => sum_out(5)
    );
\sum_out_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(6),
      O => sum_out(6)
    );
\sum_out_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => sum_out_OBUF(7),
      O => sum_out(7)
    );
\sum_out_OBUF[8]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(8),
      T => '1'
    );
\sum_out_OBUF[9]_inst\: unisim.vcomponents.OBUFT
     port map (
      I => '0',
      O => sum_out(9),
      T => '1'
    );
\sum_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(0),
      Q => sum_out_OBUF(0),
      R => '0'
    );
\sum_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(1),
      Q => sum_out_OBUF(1),
      R => '0'
    );
\sum_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(2),
      Q => sum_out_OBUF(2),
      R => '0'
    );
\sum_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(3),
      Q => sum_out_OBUF(3),
      R => '0'
    );
\sum_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(4),
      Q => sum_out_OBUF(4),
      R => '0'
    );
\sum_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(5),
      Q => sum_out_OBUF(5),
      R => '0'
    );
\sum_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(6),
      Q => sum_out_OBUF(6),
      R => '0'
    );
\sum_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => p_14_out(7),
      Q => sum_out_OBUF(7),
      R => '0'
    );
end STRUCTURE;
