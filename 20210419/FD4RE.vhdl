library IEEE;
use IEEE.STD_LOGIC_1164.all;

package REGS_COMPONENTS is 

component FD4RE is
port(
    R:in BIT;
    C:in BIT;
    CE: in BIT;
    D0,D1,D2,D3: in BIT;
    Q0,Q1,Q2,Q3: out BIT;
);
end component;

component FD4RE_std is 
port(
    R:in STD_LOGIC;
    C:in STD_LOGIC;
    CE: in STD_LOGIC;
    D0,D1,D2,D3: in STD_LOGIC;
    Q0,Q1,Q2,Q3: out STD_LOGIC;
);
end component;
