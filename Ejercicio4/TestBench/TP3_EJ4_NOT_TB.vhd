LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY TB_NOT IS
END TB_NOT;
 
ARCHITECTURE behavior OF TB_NOT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TP3_EJ4_NOT
    PORT(
         A_i : IN  std_logic_vector(7 downto 0);
         B_i : IN  std_logic_vector(7 downto 0);
         C_i : IN  std_logic;
         R_o : OUT  std_logic_vector(7 downto 0);
         C_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_i : std_logic_vector(7 downto 0) := (others => '0');
   signal B_i : std_logic_vector(7 downto 0) := (others => '0');
   signal C_i : std_logic := '0';

 	--Outputs
   signal R_o : std_logic_vector(7 downto 0);
   signal C_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TP3_EJ4_NOT PORT MAP (
          A_i => A_i,
          B_i => B_i,
          C_i => C_i,
          R_o => R_o,
          C_o => C_o
        );

   -- Clock process definitions
   -- <clock>_process :process
   -- begin
		-- <clock> <= '0';
		-- wait for <clock>_period/2;
		-- <clock> <= '1';
		-- wait for <clock>_period/2;
   -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      -- wait for 100 ns;	

      -- wait for <clock>_period*10;

      -- insert stimulus here 
		
		
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			--for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  --B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 25 ns;
			--end loop;
		  end loop;
		  wait;
		
      --wait;
   end process;
	--wait;
END;
