-- LATCH TIPO D

entity LATCHD is
    port (D: in BIT; Ln: in BIT;
    Q, QN; out BIT);
end LATCHD;

architecture ESTRUCTURAL of LATCHD is
    -- INVER no tiene un componente asociado
component INVER -- puede ser component INVER is (VHDL 93)
    port (A:in BIT; B:out BIT);
end component; -- se asociara a otro componente de una libreria

-- especif. configuracion de instancia de componente
for U0: INVER use entity WORK.GINVER(FUNCIONAL);
-- asociar INVER a GINVER de la libreria WORK y con la ent FUNCIONAL
for all: NOR2 use entity WORK.GNOR2(PRIMERA);
-- asociar a todos los NOR2 el GNOR2 de WORK con entidad PRIMERA

component NOR2 
    port (A,B: in BIT; C:out BIT);
end component NOR2; --es opcional poner NOR2 al final

-- aqui se indican las interconexiones DN, R, S
signal DN, R, S: BIT;
signal Qi, QNi: BIT; -- no tiene modo (las puedo leer y escribir sin ninguna restrinccion)
begin -- sentencias concurrente (no es importante el orden)
    -- sentencia de instancia de componente:
    U0: INVER port map (D, DN); -- instancia de componentes(conexion posicional)
    U1: NOR2 port map (D, Ln, R); -- D conectado con A, Ln con B y R con C
    U2: NOR2 port map (C=>S, A=>DN, B=>Ln); --conexion nominal (cambiar el orden (hay que determinarlo))
    U3: NOR2 port map (R, C=>Qi, R=>QNi); -- nor 3 con Qi y QNi con temporales
    U4: NOR2 port map (S, Qi, QNi);

    Q <= Qi; -- conexion de Q a Qi
    QN <= QNi; -- conexion de QN a QNi
end ESTRUCTURAL;

-- evento, es un cambio de valor de una senal