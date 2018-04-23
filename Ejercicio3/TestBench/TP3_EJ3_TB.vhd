--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:43:17 04/11/2018
-- Design Name:   
-- Module Name:   D:/workdirectory/TP3_EJ2/TP3_EJ2_TB.vhd
-- Project Name:  TP3_EJ2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TP3_EJ2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY TP3_EJ3_TB IS
END TP3_EJ3_TB;
 
ARCHITECTURE behavior OF TP3_EJ3_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TP3_EJ3
    PORT(
         A_i : IN  std_logic_vector(7 downto 0);
         B_i : IN  std_logic_vector(7 downto 0);
         C_i : IN  std_logic;
		 SR : IN std_logic;
         R_o : OUT  std_logic_vector(7 downto 0);
         C_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_i : std_logic_vector(7 downto 0) := (others => '0');
   signal B_i : std_logic_vector(7 downto 0) := (others => '0');
   signal C_i : std_logic := '0';
	signal SR : std_logic :='0';
 	--Outputs
   signal R_o : std_logic_vector(7 downto 0);
   signal C_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TP3_EJ3 PORT MAP (
          A_i => A_i,
          B_i => B_i,
          C_i => C_i,
			 SR => SR,
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
		
		SR<='0';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;
		SR<='1';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;		
		  wait;
		
      --wait;
   end process;
	--wait;
END;
