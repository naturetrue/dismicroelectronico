library IEEE;
library REGISTROS;
use IEEE.STD_LOGIC_1164.all;
-- use IEEE.NUMERIC_STD.all; 

entity CB4RE is
port(
    CLRp, Cp, CEp : in STD_LOGIC;
    Q0,Q1,Q2,Q3 : out STD_LOGIC;
    TC, CEO : out STD_LOGIC);
)

architecture MIXTA of CB4RE is
signal Qn: STD_LOGIC_VECTOR(3 downto 0);
signal Qr: STD_LOGIC_VECTOR(3 downto 0);
begin 
REG: entity REGISTROS.FD4CE(BEHAV)
port map(
    CLR     => CLRp,
    C       => Cp,
    CE      => CEp
    D0      => Qn(0), D1 => Qn(1), D2 => Qn(2), D3 => Qn(3),
    Q0      => Qr(0), Q1 => Qr(1), Q2 => Qr(2), Q3 => Qr(3));
Qn(0) <= not Qr(0);
Qn(1) <= (Qr(0)) xor Qr(1);
Qn(2) <= (Qr(1) and Qr(0)) xor Qr(2);
Qn(3) <= (Qr(2) and Qr(1) and Qr(0)) xor Qr(3);

Q0 <= Qr(0);
Q1 <= Qr(1);
Q2 <= Qr(2);
Q3 <= Qr(3);

TC <= Qr(0) and Qr(1) and Qr(2) and Qr(3);
end MIXTA