LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE BIT32 IS 
TYPE TW32 IS ARRAY (31 DOWNTO 0) OF STD_LOGIC;
END BIT32;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.BIT32.ALL;

ENTITY CPU IS 
PORT(
    CLK, INTERRUPT: IN STD_LOGIC;
    ADDR: OUT TW32;
    DATA: INOUT TW32
);
END CPU;

ARCHITECTURE CPU_BLK OF CPU IS 
SIGNAL IBUS,DBUS : TW32;
BEGIN 
ALU:BLOCK
SIGNAL QBUS: TW32;
BEGIN 
-- alu behavoir statements
END BLOCK ALU;

REG8: BLOCK
SIGNAL ZBUS:TW32;
BEGIN 
REG1 : BLOCK 
SIGNAL QBUS : TW32;
BEGIN 
END BLOCK REG1;
END BLOCK REG8;
END CPU_BLK;

