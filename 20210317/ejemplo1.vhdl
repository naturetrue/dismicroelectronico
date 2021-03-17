-- Clase 2021-03-17 Diseno microelectronico
-- Codigo escrito por: Martin Garcia Gonzalez, con fin totalmente didactico


-- declaracion de una entidad
entity GNOR2 is
-- declaracion termina con ; si continua otra declaracion, al final se pone; despues de cerrar parentesis
    port (A: in BIT; B: in BIT; 
    C: out BIT );-- ; es separador de declaracion
-- in entrada, out salida, BIT tipo de entrada o salida
-- se podria haber escrito de forma mas abrebiada: A,B: in BIT

end GNOR2; --end GNOR2

-- declaracion de una arquitectura
architecture PRIMERA of GNOR2 is
-- se distinguen dos zonas: 
-- zona declarativa (puede estar vacia pero hay que delimitarla con la palabra clave begin)
begin -- inicio zona declarativa
    -- zona sentencias concurrente
    -- sentencia de asignacion (operacion not al or de A y B)
    C <= not(A or B); -- separacion de sentencia
    -- OJO: C debe ser de tipo igual a A y B (tipo BIT)
    C <= '0'; -- asignar a C el 0
    C <= A; -- puentear C con A (cable)
end PRIMERA; --fin de la arquitectura ("PRIMERA" es opcional)

-- arquitectura nueva llamada DELAY
architecture DELAY of GNOR2 is
begin
    C <= A nor B after 2 NS; -- se asigna a C, A nor B y eso se hace en un tiempo de 2NS
    -- la clausula after solo es para informacion pero no se sintetiza a la hora de generar
    -- el circuito

end DELAY;

-- nueva entidad
entity GINVER is
    port (A: in BIT; B: out BIT); -- entrada A, salida B, ambos 1 BIT
end GINVER;

architecture FUNCIONAL of GINVER is
begin -- obligatorio!!
    B <= not A; -- B es A negado
end FUNCIONAL; -- fin arquitectura

architecture DELAY of GINVER is 
begin 
    B <= not A after 1 NS; -- lo mismo que funcional pero con el after (1 nano segundo)
end DELAY; -- fin DELAY
