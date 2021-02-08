----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:18:20 09/16/2020 
-- Design Name: 
-- Module Name:    UP_COUNTER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
entity UP_COUNTER is
    Port ( clk: in std_logic; -- clock input
           reset: in std_logic; -- reset input 
           counter: out std_logic_vector(2 downto 0) -- output 4-bit counter
     );
end UP_COUNTER;

architecture Behavioral of UP_COUNTER is
signal counter_up: std_logic_vector(2 downto 0);
begin
-- up counter
process(clk,reset)
begin


			 
if(rising_edge(clk)) then

if(reset='1') then
         counter_up <= "000";
			 
    else
			
counter_up  <= counter_up + 1;
 end if;
 end if;
end process;
 counter <= counter_up;

end Behavioral;

