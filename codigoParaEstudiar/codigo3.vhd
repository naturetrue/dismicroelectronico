PACKAGE MATH IS -- paquete para exportacion y uso
TYPE TW32 IS ARRAY (31 DOWNTO 0) OF STD_LOGIC; -- definimos que es un tw32
FUNCTION TW_ADD(A,B : TW32) RETURN TW32; -- funcion de suma
FUNCTION TW_SUB(A,B : TW32) RETURN TW32; -- funcion de resta
END MATH;

-- SE COMPILA Y SE ANADE A UN WORK BENCH