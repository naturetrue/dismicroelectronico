-- nueva arquitectura de forma asociativa

architecture FUNCIONAL of LATCHD is
signal DN, Qi, QNi: BIT;
begin --zona de sentencias concurrentes
Qi <= (QNi nor (D nor Ln)) after 3 NS; -- logica
QNi <= (Qi nor (DN nor Ln)) after 3 NS; -- logica
DN <= not D after 1 NS; -- logica (si quitamos la clausula after: no ocurre nada)
Q <= Qi; -- conexion
QN <= QNi; -- conexion
end FUNCIONAL;
