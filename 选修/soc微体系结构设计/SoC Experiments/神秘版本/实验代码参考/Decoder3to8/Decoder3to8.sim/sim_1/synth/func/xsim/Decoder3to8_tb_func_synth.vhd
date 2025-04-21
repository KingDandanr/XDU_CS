-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Sat May 13 11:47:44 2023
-- Host        : LAPTOP-JZH running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/akyna/Codes/vivado/Decoder3to8/Decoder3to8.sim/sim_1/synth/func/xsim/Decoder3to8_tb_func_synth.vhd
-- Design      : Decoder3to8
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k160tfbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Decoder3to8 is
  port (
    input : in STD_LOGIC_VECTOR ( 2 downto 0 );
    output : out STD_LOGIC_VECTOR ( 7 downto 0 );
    enable : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Decoder3to8 : entity is true;
end Decoder3to8;

architecture STRUCTURE of Decoder3to8 is
  signal enable_IBUF : STD_LOGIC;
  signal \output[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \output[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \output[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal output_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \output[0]_INST_0_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[1]_INST_0_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[2]_INST_0_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[3]_INST_0_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[4]_INST_0_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \output[5]_INST_0_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \output[6]_INST_0_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \output[7]_INST_0_i_1\ : label is "soft_lutpair3";
begin
enable_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => enable,
      O => enable_IBUF
    );
\output[0]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(0),
      O => output(0)
    );
\output[0]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_2_n_0\,
      I2 => \output[7]_INST_0_i_3_n_0\,
      I3 => \output[7]_INST_0_i_4_n_0\,
      O => output_OBUF(0)
    );
\output[1]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(1),
      O => output(1)
    );
\output[1]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_2_n_0\,
      I2 => \output[7]_INST_0_i_3_n_0\,
      I3 => \output[7]_INST_0_i_4_n_0\,
      O => output_OBUF(1)
    );
\output[2]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(2),
      O => output(2)
    );
\output[2]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_2_n_0\,
      I2 => \output[7]_INST_0_i_4_n_0\,
      I3 => \output[7]_INST_0_i_3_n_0\,
      O => output_OBUF(2)
    );
\output[3]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(3),
      O => output(3)
    );
\output[3]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_2_n_0\,
      I2 => \output[7]_INST_0_i_3_n_0\,
      I3 => \output[7]_INST_0_i_4_n_0\,
      O => output_OBUF(3)
    );
\output[4]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(4),
      O => output(4)
    );
\output[4]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_3_n_0\,
      I2 => \output[7]_INST_0_i_2_n_0\,
      I3 => \output[7]_INST_0_i_4_n_0\,
      O => output_OBUF(4)
    );
\output[5]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(5),
      O => output(5)
    );
\output[5]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_4_n_0\,
      I2 => \output[7]_INST_0_i_3_n_0\,
      I3 => \output[7]_INST_0_i_2_n_0\,
      O => output_OBUF(5)
    );
\output[6]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(6),
      O => output(6)
    );
\output[6]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => enable_IBUF,
      I1 => \output[7]_INST_0_i_3_n_0\,
      I2 => \output[7]_INST_0_i_4_n_0\,
      I3 => \output[7]_INST_0_i_2_n_0\,
      O => output_OBUF(6)
    );
\output[7]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(7),
      O => output(7)
    );
\output[7]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \output[7]_INST_0_i_2_n_0\,
      I1 => enable_IBUF,
      I2 => \output[7]_INST_0_i_3_n_0\,
      I3 => \output[7]_INST_0_i_4_n_0\,
      O => output_OBUF(7)
    );
\output[7]_INST_0_i_2\: unisim.vcomponents.IBUF
     port map (
      I => input(2),
      O => \output[7]_INST_0_i_2_n_0\
    );
\output[7]_INST_0_i_3\: unisim.vcomponents.IBUF
     port map (
      I => input(0),
      O => \output[7]_INST_0_i_3_n_0\
    );
\output[7]_INST_0_i_4\: unisim.vcomponents.IBUF
     port map (
      I => input(1),
      O => \output[7]_INST_0_i_4_n_0\
    );
end STRUCTURE;
