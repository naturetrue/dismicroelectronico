-- IF ELSIF ELSE 

IF (CONDITION1) THEN 
LOGIC 
ELSIF (CONDITION2) THEN 
LOGIC
ELSE 
LOGIC
END IF;

-- CASE

CASE VAR IS 
WHEN 1 =>
LOGIC  
WHEN 2 =>
LOGIC 
WHEN OTHERS =>
LOGIC 
END CASE; 

-- PROCESS

PROCESS (A,B ...) 
BEGIN 
LOGIC AFTER X NS 
WAIT FOR 10 NS
END PROCESS;

-- WAIT 
WAIT ON -- espera a cambios de una senal 
WAIT UNTIL -- espera a que una senal sea true (una condicion)
WAIT FOR -- espera un tiempo 

-- ejemplos del wait 

PROCESS 
BEGIN 
WAIT UNTIL CLOCK = '1' AND CLOCK'EVENT 
Q <= D;
END PROCESS;

PROCESS 
BEGIN 
WAIT UNTIL CLOCK = '1' AND CLOCK'EVENT; -- espera a que  CLOCK sea 1 y que este en flanco de subida
IF (RESET = '1') THEN
Q <= '0';
ELSE 
Q <= D;
END IF; 
END PROCESS;


PROCESS 
BEGIN 
IF (RESET = '1') THEN 
Q <= '0';
ELSIF CLOCK'EVENT AND CLOCK = '1' THEN 
Q <= D;
END IF;
WAIT ON RESET,CLOCK; -- espera a que las senales RESET y CLOCK cambien
END PROCESS;

-- con lista de sensibilidad 
process (C)
begin 
if C = '1' then 
Q <= D;
end if ;
end process;

-- con sentencia wait 
process 
begin 
wait on C;
if C = '1' then
Q <= D;
end if;
end process;

-- constantes

constant nombre_cte : STD_LOGIC := '1';

-- variables 
variable nombre_var : STD_LOGIC_VECTOR(0 to 7) := "10110011";

-- senales 
signal nombre_senal : INTEGER := x"1A";


S'EVENT --> ha habido un evento
S'STABLE --> no ha habido un evento 
S'LAST_EVENT --> tiempo transcurrido desde el ultimo evento 
S'LAST_VALUE --> valor previo antes del ultimo evento 

-- crear tipos para estados: 
type ESTADOS is (S0,S1,S2);
signal EA,ES : ESTADOS;
