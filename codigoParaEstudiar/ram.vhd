ENTITY RAM IS 
GENERIC (
    DATA_WIDTH : INTEGER := 64; 
    ADDR_WIDTH : INTEGER := 12;
    TAA : TIME := 50;
    TOE : TIME := 40
);
PORT (
    OEB, WRB, CSB : IN STD_LOGIC;
    DATA: INOUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    ADDR: IN STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0)
);
END RAM;

ARCHITECTURE RAM_ARCH OF RAM IS 

BEGIN 
RAM1:RAM
GENERIC MAP(
    DATA_WIDTH => 32,
    ADDR_WIDTH => 20,
    TAA => 30 NS,
    TOE => 35 NS
)
PORT MAP(
    OEB => OEB, WRB => WRB, CSB => CSB,
    DATA => DATA,
    ADDR => ADDR
);

RAM2:RAM 
PORT MAP(
    OEB => OEB, WRB => WRB, CSB => CSB,
    DATA => DATA,
    ADDR => ADDR
);
END RAM_ARCH;