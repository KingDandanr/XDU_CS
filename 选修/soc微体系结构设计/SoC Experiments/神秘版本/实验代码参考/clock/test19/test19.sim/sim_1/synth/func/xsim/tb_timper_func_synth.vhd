-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed May 24 17:57:00 2023
-- Host        : LAPTOP-JZH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/akyna/Codes/vivado/experiment1/test19/test19.sim/sim_1/synth/func/xsim/tb_timper_func_synth.vhd
-- Design      : timper
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity timper is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    clk1 : out STD_LOGIC;
    clk2 : out STD_LOGIC;
    nclk1 : out STD_LOGIC;
    nclk2 : out STD_LOGIC;
    w0 : out STD_LOGIC;
    w1 : out STD_LOGIC;
    w2 : out STD_LOGIC;
    w3 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of timper : entity is true;
end timper;

architecture STRUCTURE of timper is
  signal clk1_OBUF : STD_LOGIC;
  signal clk2_OBUF : STD_LOGIC;
  signal clk2_i_1_n_0 : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal cnt1 : STD_LOGIC;
  signal \cnt1[0]_i_1_n_0\ : STD_LOGIC;
  signal cnt2 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \cnt2[0]_i_1_n_0\ : STD_LOGIC;
  signal \cnt2[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt2[2]_i_1_n_0\ : STD_LOGIC;
  signal nclk1_OBUF : STD_LOGIC;
  signal nclk2_OBUF : STD_LOGIC;
  signal nclk2_i_1_n_0 : STD_LOGIC;
  signal rstn_IBUF : STD_LOGIC;
  signal w0_OBUF : STD_LOGIC;
  signal w0_i_1_n_0 : STD_LOGIC;
  signal w1_OBUF : STD_LOGIC;
  signal w1_i_1_n_0 : STD_LOGIC;
  signal w1_i_2_n_0 : STD_LOGIC;
  signal w2_OBUF : STD_LOGIC;
  signal w2_i_1_n_0 : STD_LOGIC;
  signal w2_i_2_n_0 : STD_LOGIC;
  signal w3_OBUF : STD_LOGIC;
  signal w3_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of clk1_OBUF_inst_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt2[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt2[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of nclk1_OBUF_inst_i_1 : label is "soft_lutpair1";
begin
clk1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => clk1_OBUF,
      O => clk1
    );
clk1_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clk_IBUF,
      I1 => rstn_IBUF,
      O => clk1_OBUF
    );
clk2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => clk2_OBUF,
      O => clk2
    );
clk2_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn_IBUF,
      O => clk2_i_1_n_0
    );
clk2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \cnt1[0]_i_1_n_0\,
      Q => clk2_OBUF,
      R => clk2_i_1_n_0
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
\cnt1[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt1,
      O => \cnt1[0]_i_1_n_0\
    );
\cnt1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => rstn_IBUF,
      D => \cnt1[0]_i_1_n_0\,
      Q => cnt1,
      R => '0'
    );
\cnt2[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt2(0),
      O => \cnt2[0]_i_1_n_0\
    );
\cnt2[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt2(0),
      I1 => cnt2(1),
      O => \cnt2[1]_i_1_n_0\
    );
\cnt2[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => cnt2(0),
      I1 => cnt2(1),
      I2 => cnt2(2),
      O => \cnt2[2]_i_1_n_0\
    );
\cnt2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => rstn_IBUF,
      D => \cnt2[0]_i_1_n_0\,
      Q => cnt2(0),
      R => '0'
    );
\cnt2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => rstn_IBUF,
      D => \cnt2[1]_i_1_n_0\,
      Q => cnt2(1),
      R => '0'
    );
\cnt2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => rstn_IBUF,
      D => \cnt2[2]_i_1_n_0\,
      Q => cnt2(2),
      R => '0'
    );
nclk1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => nclk1_OBUF,
      O => nclk1
    );
nclk1_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rstn_IBUF,
      I1 => clk_IBUF,
      O => nclk1_OBUF
    );
nclk2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => nclk2_OBUF,
      O => nclk2
    );
nclk2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => cnt1,
      I1 => rstn_IBUF,
      O => nclk2_i_1_n_0
    );
nclk2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => '1',
      Q => nclk2_OBUF,
      R => nclk2_i_1_n_0
    );
rstn_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rstn,
      O => rstn_IBUF
    );
w0_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => w0_OBUF,
      O => w0
    );
w0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt2(2),
      I1 => cnt2(1),
      O => w0_i_1_n_0
    );
w0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => w0_i_1_n_0,
      Q => w0_OBUF,
      R => clk2_i_1_n_0
    );
w1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => w1_OBUF,
      O => w1
    );
w1_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => cnt2(1),
      I1 => cnt2(2),
      I2 => rstn_IBUF,
      O => w1_i_1_n_0
    );
w1_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt2(2),
      O => w1_i_2_n_0
    );
w1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => w1_i_2_n_0,
      Q => w1_OBUF,
      R => w1_i_1_n_0
    );
w2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => w2_OBUF,
      O => w2
    );
w2_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => cnt2(2),
      I1 => rstn_IBUF,
      O => w2_i_1_n_0
    );
w2_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt2(1),
      O => w2_i_2_n_0
    );
w2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => w2_i_2_n_0,
      Q => w2_OBUF,
      R => w2_i_1_n_0
    );
w3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => w3_OBUF,
      O => w3
    );
w3_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => cnt2(1),
      I1 => cnt2(2),
      I2 => rstn_IBUF,
      O => w3_i_1_n_0
    );
w3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => '1',
      Q => w3_OBUF,
      R => w3_i_1_n_0
    );
end STRUCTURE;
