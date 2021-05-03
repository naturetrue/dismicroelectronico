USE WORK.MATH.ALL;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY CPU IS 
PORT (CLK,INTERRUPT: IN STD_LOGIC;
ADDR : OUT TW32; CONT : IN INTEGER;
DATA : INOUT TW32);
END CPU;

ARCHITECTURE CPU_BLK OF CPU IS 
SIGNAL IBUS, DBUS : TW32;
BEGIN ALU : BLOCK
PORT (ABUS,BBUS : TW32;
D_OUT : OUT TW32;
CTBUS : IN INTEGER);
PORT MAP (ABUS => IBUS, BBUS => DBUS, D_OUT => DATA,
CTBUS => CONT);
SIGNAL QBUS : TW32;
BEGIN 
D_OUT <= TW_ADD(ABUS,BBUS) WHEN CTBUS = 0 ELSE 
TW_SUB(ABUS,BBUS) WHEN CTBUS = 1 ELSE 
ABUS;
END BLOCK ALU; 
END CPU_BLK; 