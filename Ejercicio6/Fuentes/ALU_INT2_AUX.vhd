
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_INT2_AUX is
    GENERIC (N : integer :=8);
	Port ( 	A_i : in  STD_LOGIC_VECTOR (N-1 downto 0);
			B_i : in  STD_LOGIC_VECTOR (N-1 downto 0);								
			C_i : in STD_LOGIC;
			OP_i : in STD_LOGIC_VECTOR (2 downto 0);
			R_o : out  STD_LOGIC_VECTOR (N-1 downto 0);
			C_o : out STD_LOGIC;
			CLK_i : in STD_LOGIC
			);
			
end ALU_INT2_AUX;

architecture Behavioral of ALU_INT2_AUX is

--Declaracion de los componentes
--Full Adder
COMPONENT TP3_EJ1 is 
	PORT(
		A_i : in STD_LOGIC ;
		B_i : in STD_LOGIC ;
        C_i : in  STD_LOGIC;
		R_o : out STD_LOGIC;
		C_o : out STD_LOGIC	
	);
END COMPONENT;
--RPC Adder
COMPONENT TP3_EJ2 is
	PORT(
		A_i : in STD_LOGIC_VECTOR (N-1 downto 0);
		B_i : in STD_LOGIC_VECTOR (N-1 downto 0);
		C_i : in STD_LOGIC;
		R_o : out STD_LOGIC_VECTOR (N-1 downto 0);
		C_o : out STD_LOGIC		
	);
END COMPONENT;
--Restador
COMPONENT TP3_EJ3 is
	PORT(
		A_i : in STD_LOGIC_VECTOR (N-1 downto 0);
		B_i : in STD_LOGIC_VECTOR (N-1 downto 0);
		C_i : in STD_LOGIC;
		SR : in STD_LOGIC;
		R_o : out STD_LOGIC_VECTOR (N-1 downto 0);
		C_o : out STD_LOGIC
	);
END COMPONENT;
--AND
COMPONENT TP3_EJ4_AND is
	PORT(
		A_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		B_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		R_o : out STD_LOGIC_VECTOR(N-1 downto 0)	
	);
END COMPONENT;	
--OR
COMPONENT TP3_EJ4_OR is
	PORT(
		A_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		B_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		R_o : out STD_LOGIC_VECTOR(N-1 downto 0)	
	);
END COMPONENT;
--NOT
COMPONENT TP3_EJ4_NOT is
	PORT(
		A_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		R_o : out STD_LOGIC_VECTOR(N-1 downto 0)	
	);
END COMPONENT;

--Declaracion de las senales
SIGNAL SR000_o : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SR001_o : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SR010_o : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SR011_o : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SR100_o : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SCS_o :STD_LOGIC;--Senal de Carry de Suma (salida)
SIGNAL SCR_o :STD_LOGIC;--Senal de Carry de Resta (salida)
SIGNAL SA_i : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SB_i : STD_LOGIC_VECTOR (N-1 downto 0);
SIGNAL SC_i :STD_LOGIC;
SIGNAL SOP_i :STD_LOGIC_VECTOR(2 downto 0);
--------------------------------------------------
BEGIN
--------------------------------------------------

auxiliar: process(CLK_i,SA_i,SB_i,SC_i,SCR_o,SCS_o,SOP_i)
begin
	if(CLK_i'event and CLK_i='1')then
		
		SA_i<=A_i;
		SB_i<=B_i;
		SC_i<=C_i;
		SOP_i<=OP_i;
		
		
		if(OP_i="000")then
			R_o<=SR000_o; 
			C_o<=SCS_o;
		end if;
		if(OP_i="001")then
			R_o<=SR001_o; 
			C_o<=SCR_o;
		end if;		
		if(OP_i="010")then
			R_o<=SR010_o;
			C_o<='Z';
		end if;
		if(OP_i="011")then
			R_o<=SR011_o;
			C_o<='Z';
		end if;
		if(OP_i="100")then
			R_o<=SR100_o;
			C_o<='Z';
		end if;
		
		
		
		
		
		--ACLARACION: Las salidas se encuentran almacenadas en registro
		-- 				sobre el proceso "proc_2"
	end if;
end process;


--------------------------------------------------
	INST_SUMASOLA: TP3_EJ2 PORT MAP(
		A_i=>A_i,
		B_i=>B_i,
		C_i=>C_i,
		R_o=>SR000_o,
		C_o=>SCS_o
	);

	INST_RESTA: TP3_EJ3 PORT MAP(
		A_i=>A_i,
		B_i=>B_i,
		C_i=>C_i,
		SR=>'1',
		R_o=>SR001_o,
		C_o=>SCR_o
	);

	INST_AND: TP3_EJ4_AND PORT MAP(
		A_i=>A_i,
		B_i=>B_i,		
		R_o=>SR010_o		
	);

	INST_OR: TP3_EJ4_OR PORT MAP(
		A_i=>A_i,
		B_i=>B_i,		
		R_o=>SR011_o		
	);

	INST_NOT: TP3_EJ4_NOT PORT MAP(
		A_i=>A_i,
		R_o=>SR100_o		
	);

---------------------------------------------------
--proc_2: process(CLK_i,OP_i,SR000_o,SCS_o,SCR_o,SR010_o,SR011_o,SR100_o)
--begin	
--	if(CLK_i'event and CLK_i='1')then
--
--	end if;
--end process proc_2;

--------------------------------------------------

END Behavioral;

