library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;



entity TP3_EJ4_AND is
    Generic (N: integer :=8);
	Port ( 
		A_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		B_i : in STD_LOGIC_VECTOR(N-1 downto 0) ;
		R_o : out STD_LOGIC_VECTOR(N-1 downto 0)
        );
end TP3_EJ4_AND;

architecture Behavioral of TP3_EJ4_AND is

begin
	process(A_i,B_i)
	begin
	for i in 0 to N-1 loop
		if(A_i(i)='1')then
			if(B_i(i)='1')then
				R_o(i)<='1';
			end if;
		else
			R_o(i)<='0';				
		end if;
		if(B_i(i)='1')then
			if(A_i(i)='1')then
				R_o(i)<='1';
			end if;
		else
			R_o(i)<='0';	
		end if;	
	end loop;
	end process;

end Behavioral;
