-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY signals_test IS
  END signals_test;

  ARCHITECTURE behavior OF signals_test IS 

  -- Component Declaration
         component signalcontoller is port
        (clock:in std_logic;
         rst:in std_logic;
         T:out std_logic_vector(7 downto 0)
 );
end component;

 signal clock:  std_logic;
 signal rst: std_logic:='0';
 signal T: std_logic_vector(7 downto 0);
 
  constant clk_period : time := 50 ns;
       

  BEGIN

  -- Component Instantiation
          uut:  signalcontoller PORT MAP(
                clock,rst,T
          );




   clk_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;

  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
		  
		  
		  wait for clk_period;
		  
		  rst<='1';
		  
		  
		    wait for clk_period;
		  
		    rst<='0';

        -- Add user defined stimulus here
		  
		  
		  
		  

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 
  
  

  END;
