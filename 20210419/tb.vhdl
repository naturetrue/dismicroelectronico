library CLASE;
entityTB is end;

architecture MIXTA of TB is 
component LD
port (D,Ln: in BIT, Q,Qn: out BIT);

end component;

for DUT: LD use configuration CLASE.CONF3;
signal DT,LnT,QT,QNT: BIT;
begin 
DUT: LD port map(DT,LnT,QT, QNT);
process 
begin 
DT <= '1';
wait for 10 NS;
DT <= '0';
wait for 10 NS;
DT <= '1';
wait for 10 NS;
DT <= '0';
wait;

end process;

LnT <= '0','1' after 10 NS;
end MIXTA;