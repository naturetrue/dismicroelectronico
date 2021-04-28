entity CB4CE is 
port (CLRp, Cp, CEp : in BIT;
    Q0,Q1,Q2,Q3 : out BIT;
    TC, CEO : out BIT);
end;

architecture MIXTA of CB4CE is

signal Qn0,Qn1,Qn2,Qn3 : BIT;
signal Qr0,Qr1,Qr2,Qr3 : BIT;

begin 
-- instanciacion de U0 LIBRERIA.IDENTIFICADOR DE LA IDENTIDAD(ENTIDAD)
UO: entity REGISTROS.FD4CE(BEHAV); -- NUEVA EN VHDL93
port map(
    CLR => CLRp, C=>Cp, CE=>CEp
    D0=>Qn0,D1=>Qn1,D2=>Qn2,D3=>Qn3,
    Q0=>Qr0,Q1=>Qr1,Q2=>Qr2,Q3=>Qr2);

Qn0 <= not Qr0;
Qn1 <= Qr1 xor Qr0;
Qn2 <= Qr2 xor (Qr1 and Qr0);
Qn3 <= Qr3 xor (Qr2 and Qr1 and Qr0);

Q0 <= Qr0; Q1 <= Qr1; Q2 <= Qr2; Q3 <= Qr3;

TC <= Qr- and Qr1 and Qr2 and Qr3;
end MIXTA;