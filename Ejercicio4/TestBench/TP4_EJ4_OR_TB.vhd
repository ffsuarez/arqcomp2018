LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
ENTITY OR_TB IS
END OR_TB;

ARCHITECTURE Behaviour OF OR_TB IS
	COMPONENT TP3_EJ4_OR 
	PORT ( 
		A_i : in STD_LOGIC_VECTOR(7 downto 0) ;
		B_i : in STD_LOGIC_VECTOR(7 downto 0) ;
		R_o : out STD_LOGIC_VECTOR(7 downto 0)
	);
	END COMPONENT;
	SIGNAL A_i : STD_LOGIC_VECTOR(7 downto 0) ;
	SIGNAL B_i : STD_LOGIC_VECTOR(7 downto 0) ;
	SIGNAL R_o : STD_LOGIC_VECTOR(7 downto 0) ;
	
	BEGIN
	--UUT
	uut: TP3_EJ4_OR PORT MAP(
		A_i => A_i,
		B_i => B_i,
		R_o => R_o
	);
	--proceso stimulus
	stimulus: PROCESS
	BEGIN
		FOR selA_i IN 0 TO 2 ** A_i'length - 1 LOOP  -- 0 to 3 for sel'length = 2
		FOR selB_i IN 0 TO 2 ** B_i'length - 1 LOOP  -- 0 to 15 for p'length = 4
		  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
		  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
		  wait for 20 ns;
		end loop;
		end loop;
		wait;
	END PROCESS;
END;