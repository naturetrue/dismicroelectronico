entity TB is end;
-- entidad con end significa que ya esta terminada

architecture MIXTA of TB is 

component LD 
 port (D, Ln: in BIT; Q,QN: out BIT);
end component;

begin 
DUT: LD port map(DT, LnT, QT, QNT);
process 
begin
    LnT <= '0';
    DT <= '1';

    wait for 10 NS; -- wait con condicion de reactivacion
    DT <= '0';
    wait for 10 NS;
    DT <= '1';
    wait for 10 NS;
    LnT <= '1';
    wait for 10 NS;
    DT <= '0';
    wait;
end process;
end MIXTA;