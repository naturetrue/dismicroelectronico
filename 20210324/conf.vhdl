configuration CONF1 of LATCHD is
    for ESTRUCTURAL
    -- configuracion de los componentes
    for all: NOR2 use entity WORK.GNOR(FUNCIONAL);
    end for;
    for all: INVER use entity WORK.GINVER(FUNCIONAL);
    end for;
    end for;

configuration CONF2 of LATCHD is
    for FUNCIONAL
    end for;
    end for;
