-- procesos registrados
-- DISTINTAS FORMAS DE DETECTAR UN PROCESO REGISTRADO
process 
begin 
wait until (C'EVENT and C = '1');
-- logica
end process;
--------------------------------
process (C)
begin 
if (C'EVENT and C = '1') then
    --logica
end if;
end process;
--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

process 
begin 
wait until RISING EDGE(C);
-- Logica
end process;

-- reglas de reset asincrono
-- - ninguna sentencia fuera del if
-- - no debe aparecer la rama else
-- - la rama elsif contiene el funcionamiento normal

process (R,C)
begin 

if (R = '1') then Q <= '0'
elsif (C'EVENT and C = '1') then Q <= D;
end if;
end process;

