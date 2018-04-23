--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:56:09 04/17/2018
-- Design Name:   
-- Module Name:   D:/DSD_estudio/work_directory/ALU/ALU_INT2_TB.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_INT2
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
 
ENTITY ALU_INT2_TB IS
END ALU_INT2_TB;
 
ARCHITECTURE behavior OF ALU_INT2_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_INT2
    PORT(
         A_i : IN  std_logic_vector(7 downto 0);
         B_i : IN  std_logic_vector(7 downto 0);
         C_i : IN  std_logic;
         OP_i : IN  std_logic_vector(2 downto 0);
         R_o : OUT  std_logic_vector(7 downto 0);
         C_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_i : std_logic_vector(7 downto 0) := (others => '0');
   signal B_i : std_logic_vector(7 downto 0) := (others => '0');
   signal C_i : std_logic := '0';
   signal OP_i : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal R_o : std_logic_vector(7 downto 0);
   signal C_o : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_INT2 PORT MAP (
          A_i => A_i,
          B_i => B_i,
          C_i => C_i,
          OP_i => OP_i,
          R_o => R_o,
          C_o => C_o
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		OP_i<="000";C_i<='0';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;
		  --wait;

		OP_i<="000";C_i<='1';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;
		  
		OP_i<="001";C_i<='0';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;	

		OP_i<="001";C_i<='1';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;	

		OP_i<="010";C_i<='0';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;

		OP_i<="010";C_i<='1';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;		  
		  
		OP_i<="011";C_i<='0';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;		  
		  

		OP_i<="100";C_i<='0';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;

		OP_i<="100";C_i<='1';
		  for selA_i in 0 to 2 ** A_i'length - 1 loop  -- 0 to 3 for sel'length = 2
			for selB_i in 0 to 2 ** B_i'length - 1 loop  -- 0 to 15 for p'length = 4
			  A_i <= std_logic_vector(to_unsigned(selA_i, A_i'length));
			  B_i   <= std_logic_vector(to_unsigned(selB_i, B_i'length));
			  wait for 5 ns;
			end loop;
		  end loop;		  
      wait;	
   end process;

END;
