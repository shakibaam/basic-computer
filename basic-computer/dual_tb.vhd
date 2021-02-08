--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:44:37 09/23/2020
-- Design Name:   
-- Module Name:   E:/basic_computer/dual_tb.vhd
-- Project Name:  basic_computer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dual_RAM
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
--USE ieee.numeric_std.ALL;
 
ENTITY dual_tb IS
END dual_tb;
 
ARCHITECTURE behavior OF dual_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dual_RAM
    PORT(
         clock : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         wr : IN  std_logic;
         rd : IN  std_logic;
         addrs : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal addrs : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dual_RAM PORT MAP (
          clock => clock,
          data_in => data_in,
          data_out => data_out,
          wr => wr,
          rd => rd,
          addrs => addrs
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;
		wr<='1';
		addrs<="0000";
		data_in<="10101010";
		
		
		 wait for clock_period*10;
		wr<='0';
		
		
			 wait for clock_period*10;
		wr<='1';
				addrs<="0001";
		data_in<="10101111";
		
		
			
		 wait for clock_period*10;
		wr<='0';
		
		
			 wait for clock_period/2;
		rd<='1';
		addrs<="0000";

      -- insert stimulus here 

      wait;
   end process;

END;
