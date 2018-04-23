library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;



entity TP3_EJ1 is
    Port ( 
		A_i : in STD_LOGIC ;
		B_i : in STD_LOGIC ;
        C_i : in  STD_LOGIC;
		R_o : out STD_LOGIC;
		C_o : out STD_LOGIC
        );
end TP3_EJ1;

architecture Behavioral of TP3_EJ1 is

begin
	R_o <= (not(C_i)and not(A_i) and B_i ) or (not(C_i)and A_i and not(B_i) ) or (C_i and not(A_i) and not(B_i)  ) or (C_i and A_i and B_i ); 
	C_o <=(not(C_i)and A_i and B_i )or(C_i and not(A_i) and B_i )or(C_i and A_i and not(B_i) )or(C_i and A_i and B_i ); 
end Behavioral;

