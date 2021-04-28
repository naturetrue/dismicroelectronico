-- constantes en vhdl
constant IDENTIF : TIPO [:= EXPRESION]; -- expresion obligatoria

-- senales
signal IDENTIF: TIPO [RESTRICION][:= EXPRESION]; -- expresion es valor inicial
-- no puede ser declarado en zonas secuenciales (en el process)

-- variable
variable IDENTIF: TIPO [RESTRICION][:=EXPRESION];

-- FLANCO DE SUBIDA

process(C)
begin
    if (C'EVENT and C = '1') then -- C esta pasando de 0 a 1 (eso lo marca el event)
    Q <= D;
    end if;
end process;

process
begin 
wait until (C'EVENT and C = '1'); -- espera hasta que C cambie de 0 a 1
Q <= D;
end process;

-- FLANCO DE BAJADA

process(C)
begin
    if (C'EVENT and C = '0') then -- C esta pasando de 0 a 1 (eso lo marca el event)
    Q <= D;
    end if;
end process;

process
begin 
wait until (C'EVENT and C = '0'); -- espera hasta que C cambie de 0 a 1
Q <= D;
end process;