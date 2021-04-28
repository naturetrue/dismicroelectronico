-- file.vhdl

library IEEE;
use IEEE.std_logic_1164.all;

entity sum8 is 
port (
    A: in STD_LOGIC_VECTOR(7 downto 0);
    B: in STD_LOGIC_VECTOR(7 downto 0);
    CRY: in STD_LOGIC;
    S: out STD_LOGIC_VECTOR(7 downto 0);
    CO: out STD_LOGIC;
    CLK: in STD_LOGIC;
    EN: in STD_LOGIC
);
end sum8;

architecture sum8proc of sum8 is
signal 
begin 

end sum8proc;