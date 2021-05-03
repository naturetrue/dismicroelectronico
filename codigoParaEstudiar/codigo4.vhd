LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY LATCH IS  
PORT (
    D,CLK : IN STD_LOGIC;
    Q,QB: OUT STD_LOGIC
);
END LATCH;

ARCHITECTURE LATCH_GUARD OF LATCH IS 
BEGIN 
G1: BLOCK (CLK = '1')
BEGIN 
Q <= GUARDED D AFTER 5 NS;
QB <= GUARDED NOT(D) AFTER 7 NS;
END BLOCK G1 ;
END LATCH_GUARD; -- lo de los bloques no se usa en el curso