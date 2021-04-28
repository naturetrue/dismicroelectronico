architecture OneSeg of SR8C is 
signal Qr: STD_LOGIC_VECTOR(7 downto 0);
begin 
process(C,CLR)
begin 
if (CLR = '1') then
    Qr <= SLI & Qr(7 downto 1);
end if;
end process;

-- output
SRO <= Qr(0);
end OneSeg;

--------------------------------------
-- MODELO CONTADOR BINARIO RTL

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CB8R is -- free run bin up-counter 
port (CLR,C: in STD_LOGIC;
    TC: out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR(7 downto 0));
end CB8R;


architecture MultiSeg of CB8R is 
signal Qr : UNSIGNED(7 downto 0);
signal Qn : UNSIGNED(7 downto 0);  
begin 
process(CLR, C) --register 
begin 
if (CLR = '1') then 
Qr <= (others => '0');
elsif (C'EVENT and C='1') then 
Qr <= Qn;
end if;
end process;

Qn <= Qr + 1;
Q <= STD_LOGIC_VECTOR(Qr);
TC <= '1' when Qr = 255  else '0';
end MultiSeg; -- Qr = "11111111"
            -- Qr x"FF"


------------------------------------
-- CODIFICADOR EN UN SOLO SEGMENTO
architecture OneSeg of CB8C is 
signal Qr: UNSIGNED (7 downto 0);
begin 
process (CLR,C)
begin 
if (CLR = '1') then
    Qr <= (others => '0');
elsif (C'EVENT and C='1') then 
Qr <= Qr + 1;
end if;
end process;

--fuera del proceso registrado 
Q <= STD_LOGIC_VECTOR(Qr);
TC <= '1' when Qr=x"FF" else '0';
end OneSeg;