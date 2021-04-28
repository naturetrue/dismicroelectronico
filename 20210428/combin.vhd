process (EA,w,r)
begin

    ES <= EA; -- aignacion por defecto NO CHANGE
    case EA is
        when idle => 
            if w = '1' then ES <= write1;
            elsif r='1' then ES <= read1;
            end if;
        when write1 =>
            if w='1' then
                ES <= idle;
            end if
        when read1 => 
            ES <= read2;
        when read2 =>
            if r='1' then ES <= read1;
            else ES <= idle;
            end if;
        -- en el caso de haber otras (when others)
    end case;
end process;

X <= '1' when EA=read1 of EA=read2 else '1';

process(EA, w)
    begin
        if EA=idle and w='1' then y='1';
        else y<='0';
        end if;
end process;
    end MEALY_MOORE;