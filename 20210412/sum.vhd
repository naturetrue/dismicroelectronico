entity SUM1 is
port (A, B, CIN: in BIT;
S, COUT: out BIT);
end SUM1; 

architecture ADDER1 of SUM1 is

begin
S <= (A xor B) xor CIN;
COUT <= (A and B) or (C and (A xor B));
end ADDER1;

entity SUM4 is 
port (A, B, CIN: in BIT_VECTOR(3 downto 0);
S, COUT: out BIT_VECTOR(3 downto 0));
end SUM4;

architecture ADDER4 of SUM4 is 
begin
U0: SUM1 port map ();
U1: SUM1 port map ();
U2: SUM1 port map ();
U3: SUM1 port map ();
end ADDER4;