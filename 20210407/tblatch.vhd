
entity TB is end;

architecture MIXTA of TB is 
component LD 
port (D,Ln:in BIT; Q,QN: out BIT);
end component;

-- for DUT: LD use entity CLASE.LATCHD(SECUENCIAL);
for DUT: LD use configuration CLASE.CONF3;
signal DT,LnT,QT,QNT: BIT;
begin 
DUT: LD port map(DT,LnT,QT,QNT);
process
begin
LnT <= '0';
DT <= '1';
wait for 10 NS;
DT <= '0';
wait for 10 NS;
DT <= '1';
wait for 10 NS;
LnT <= '1';
wait for 10 NS;
DT <= '0';
wait; -- wait for 10 NS;
end process;
LnT <= '0', '1' after 10 NS;
end MIXTA;