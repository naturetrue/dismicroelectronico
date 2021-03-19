architecture SECUENCIAL of LATCHD is
begin -- zona sent. concurrente

-- atencion! hay que tener en cuenta los infinite loops (poner lista de sensibilidad)
process (Ln, D) -- lista de sensibilidad (una vez derminado el evento secuencial, espera a que Ln y D cambien de valor ...
                -- para reactivar el proceso).
begin -- zona sent. secuenciales (solo dentro de los process)
if (Ln='0' and D='0') then
    Q <= '0' after 2 NS;
    QN <= '1' after 3 NS;
elsif (Ln='0' and D='1') then
    Q <= '1' after 2 NS;
    QN <= '0' after 3 NS;
end if; 

-- resto sentencias ecuenciales
end process;


end SECUENCIAL;