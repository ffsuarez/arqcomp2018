library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

ENTITY TP3_EJ2 is
	GENERIC (N: integer :=8);
	PORT(
		A_i : in STD_LOGIC_VECTOR (N-1 downto 0);
		B_i : in STD_LOGIC_VECTOR (N-1 downto 0);
		C_i : in STD_LOGIC;
		R_o : out STD_LOGIC_VECTOR (N-1 downto 0);
		C_o : out STD_LOGIC
	
	);
END TP3_EJ2;

ARCHITECTURE Behaviour OF TP3_EJ2 is
COMPONENT TP3_EJ1 is 
	PORT(
		A_i : in STD_LOGIC ;
		B_i : in STD_LOGIC ;
        C_i : in  STD_LOGIC;
		R_o : out STD_LOGIC;
		C_o : out STD_LOGIC	
	);
END COMPONENT;
--
SIGNAL carry : STD_LOGIC_VECTOR(N downto 0);
SIGNAL SR_o : STD_LOGIC_VECTOR(N-1 downto 0);
BEGIN
carry(0)<=C_i;   --a senial carry(0) le asigno C_i
C_o<=carry(N);
GEN:for I in 0 to N-1 generate
	INS_FULL_ADDER: TP3_EJ1 PORT MAP
		(A_i=>A_i(I),B_i=>B_i(I),C_i=>carry(I),R_o=>SR_o(I),C_o=>carry(I+1));
end generate GEN;

process (SR_o)
begin
	if (carry(N)='1')then
		R_o<=(others=>'0');
	else
		R_o<=SR_o;
	end if;
end process;

END Behaviour;