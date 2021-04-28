-- logica condicional

process (EA)
begin 
Y1 <= (EA=S0 or EA=S1) then Y <= '1'
end process;

process(EA,A,B)
begin 
end process;

Y0 <= '1' when (EA=S0 and A='1' and B='1') -- condicion de activacion de la sentencia MEALY