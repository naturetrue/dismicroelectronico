architecture Behavoir of CB8DRE is
    signal Qr, Qn: UNSIGNED(7 downto 0);
    begin
        process
        begin 
        wait until rising_edge(CLK):
        if RST='1' then
            Qr <= (others=>'1');
        elsif LD ='1' then
            Qr <= UNSIGNED(DIN);
        elsif CEN='1' then
            Qr <= Qn;
        end if;
        end process;
        Qn <= Qr - 1;

        TC <= '1' when Qr=0 else '0';

        Q <= STD_LOGIC_VECTOR(Qr);
    end Behavoir;