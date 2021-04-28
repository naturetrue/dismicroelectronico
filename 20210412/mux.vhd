entity MUX is
port (A,B,C,D : in BIT;
        S0, S1 : in BIT;
        X: out BIT);
end MUX;

architecture DATAFLOW of MUX is 
signal SEL : INTEGER;
begin
    SEL <= 0 when S0 = '0' and S1 = '0' else
        1 when S0 = '1' and S1 = '0' else
        2 when S0 = '0' and S1 = '1' else
        3;
    X <= A after 1 NS when SEL = 0 else
        B after 1 NS when SEL = 1 else
        C after 1 NS when SEL = 2 else 
        D after 1 NS;
end DATAFLOW;