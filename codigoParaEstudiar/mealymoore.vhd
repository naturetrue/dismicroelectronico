architecture MEALY_MOORE of FSM is 
type ESTADOS is (SO,S1,S2);
signal EA,ES: ESTADOS;
begin 
-- registro de estado
-- process (CLK,R) begin end process 
process 
begin 
wait until CLK'EVENT and CLK='1';
if R='1' then EA <= S0;
else EA <= ES;
end if;
end process;
-- logica de estado siguiente
process (EA,A,B)
if EA = S0 then -- estado 0
if A'EVENT then
ES <= S0;
elsif ((A and B)) then
ES <= S1;
else
end if;
elsif EA = S1 then -- estado 1
else -- estado 2
end if;
begin 
end process;
-- logica salidas moore 
process(EA)
begin 
end process;
-- logica salidas mealy
process(EA,A,B)
begin 
end process;
end architecture;