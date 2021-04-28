architecture NETLIST of MUX is
    component ANDGATE
    port (A,B,C: in BIT; C : out BIT);
    end component;
    component INVERTER
    port (IN1: in BIT; X: out BIT);
    end component;
    component ORGATE
    port (A,B,C,D: in BIT; X: out BIT);
    end component;

    signal S0_INV, S1_INV, X1, X2, X3, X4 : BIT;
    begin 
    U1 : INVERTER (S0, S0_INV);
    U2 : INVERTER (S1, S1_INV);
    U3 : ANDGATE (A, S0_INV, S1_INV, X1);
    U4 : ANDGATE (B, S0, S1_INV, X2);
    U5 : ANDGATE (C, S0_INV, S1, S3);
    U6 : ANDGATE (D, S0, S1, X4);
    U7 : ORGATE(X2 => B, X1 => A, X4 => D, X3 => C, X => X);
    end NETLIST;


   -- configurations

configuration MUXCON1 of MUX is
    for NETLIST
    for U1,U2 :
    inverter use entity WORK.myinv(VERSION1);
    end for;
    for U3,U4,U5,U6: 
    andgate use entity WORK.myand(VERSION1);
    end for;
    for U7:
    orgate use entity WORK.myor(VERSION1);
    end for;
    end for;
end MUXCON1;


-- usar una libreria

library IEEE;
use IEEE.std_logic_1164.ALL; -- usar todos los tips de std_logic_1164


-- ejemplpo con std_logic_1164 dentro de WORK
use WORK.std_logic_1164.ALL;
entity mux IS
port (i0, i1, i2, i3, a, b: IN std_logic;
port (q : OUT std_logic);
end mux;
architecture bad
begin
q <= i0 when a
q <= i1 when a
q <= i2 when a
q <= i3 when a
end BAD;