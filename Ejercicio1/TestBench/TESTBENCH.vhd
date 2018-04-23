LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TESTBENCH is
END TESTBENCH;

ARCHITECTURE Behavior of TESTBENCH is
--Declaracion de los componentes para la UUT
COMPONENT TP3_EJ1
	PORT(
			A_i : in STD_LOGIC;
			B_i : in STD_LOGIC;
			C_i : in STD_LOGIC;
			R_o : out STD_LOGIC;
			C_o : out STD_LOGIC
	
	);
END COMPONENT;
signal A_i : STD_LOGIC :='0';
signal B_i : STD_LOGIC :='0';
signal C_i : STD_LOGIC :='0';
signal R_o : STD_LOGIC;
signal C_o : STD_LOGIC;

BEGIN
--instanciacion de la UUT
uut: TP3_EJ1 PORT MAP (
A_i =>A_i,
B_i =>B_i,
C_i =>C_i,
R_o =>R_o,
C_o =>C_o);


	stim_p: process
	begin
	C_i<='0';A_i<='0';B_i<='1';
	wait for 20 ns;
	C_i<='0';A_i<='1';B_i<='0';
	wait for 20 ns;
	C_i<='0';A_i<='1';B_i<='1';
	wait for 20 ns;
	C_i<='1';A_i<='0';B_i<='0';
	wait for 20 ns;
	C_i<='1';A_i<='0';B_i<='1';
	wait for 20 ns;
	C_i<='1';A_i<='1';B_i<='0';
	wait for 20 ns;
	C_i<='1';A_i<='1';B_i<='1';
	wait;
	end process;	
END;