library IEEE;
use IEEE.Std_logic_1164.all;

ENTITY booth_multiplier IS
PORT(
        multiplicand, multiplier : IN BIT_VECTOR(7 DOWNTO 0);
        clock : IN BIT; 
        product : INOUT BIT_VECTOR(15 DOWNTO 0));
END booth_multiplier;

ARCHITECTURE structural OF booth_multiplier IS

SIGNAL mdreg, adderout, carries, augend, tcbuffout : BIT_VECTOR(7 DOWNTO 0);
SIGNAL mrreg : BIT_VECTOR(8 DOWNTO 0);
SIGNAL adder_ovfl : BIT;
SIGNAL comp ,clr_mr ,load_mr ,shift_mr ,clr_md ,load_md ,clr_pp ,load_pp ,shift_pp : BIT;
SIGNAL boostate : NATURAL RANGE 0 TO 16;

BEGIN

PROCESS

BEGIN

WAIT UNTIL (clock'EVENT AND clock = '1');
IF clr_md = '1' THEN
mdreg <= (OTHERS => '0');
ELSIF load_md = '1' THEN
mdreg <= multiplicand;
ELSE
mdreg <= mdreg;
END IF;

IF clr_mr = '1' THEN
mrreg <= (OTHERS => '0');
ELSIF load_mr = '1' THEN
mrreg(8 DOWNTO 1) <= multiplier;
mrreg(0) <= '0';
ELSIF shift_mr = '1' THEN
mrreg <= mrreg SRL 1;
ELSE
mrreg <= mrreg;
END IF;

IF clr_pp = '1' THEN
product <= (OTHERS => '0');
ELSIF load_pp = '1' THEN
product(15 DOWNTO (7 + 1)) <= adderout;
product(7 DOWNTO 0) <= product(7 DOWNTO 0);
ELSIF shift_pp = '1' THEN
product <= product SRA 1;
ELSE
product <= product;
END IF;

END PROCESS;

augend <= product(15 DOWNTO 8);
addgen : FOR i IN adderout'RANGE 
GENERATE
lsadder : IF i = 0 GENERATE
adderout(i) <= tcbuffout(i) XOR augend(i) XOR comp;
carries(i) <= (tcbuffout(i) AND augend(i)) OR
(tcbuffout(i) AND comp) OR
(comp AND augend(i));
END GENERATE;
otheradder : IF i /= 0 GENERATE
adderout(i) <= tcbuffout(i) XOR augend(i) XOR carries(i-1);
carries(i) <= (tcbuffout(i) AND augend(i)) OR
(tcbuffout(i) AND carries(i-1)) OR
(carries(i-1) AND augend(i));
END GENERATE;
END GENERATE;
adder_ovfl <= carries(6) XOR carries(7);
tcbuffout <= NOT mdreg WHEN (comp = '1') ELSE mdreg;
PROCESS BEGIN
WAIT UNTIL (clock'EVENT AND clock = '1');
IF boostate < 15 THEN boostate <= boostate + 1;
ELSE boostate <= 0;
END IF;
END PROCESS;
PROCESS(boostate)
BEGIN
comp <= '0';
clr_mr <= '0';
load_mr <= '0';
shift_mr <= '0';
clr_md <= '0';
load_md <= '0';
clr_pp <= '0';
load_pp <= '0';
shift_pp <= '0';
IF boostate = 0 THEN
load_mr <= '1';
load_md <= '1';
clr_pp <= '1';
ELSIF boostate MOD 2 = 0 THEN
shift_mr <= '1';
shift_pp <= '1';
ELSE
IF mrreg(0) = mrreg(1) THEN
NULL;
ELSE
load_pp <= '1'; 
END IF;
comp <= mrreg(1);
END IF;
END PROCESS;
END structural;
