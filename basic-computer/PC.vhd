----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:16:50 09/16/2020 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
use IEEE.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY PC IS PORT(
    d   : IN STD_LOGIC_vector(3 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
	 inc:  IN std_logic;
    q   : OUT STD_LOGIC_vector(3 downto 0) -- output.
);
END PC;

ARCHITECTURE description OF PC IS
signal temp:std_logic_vector(3 downto 0);


BEGIN
temp<=d;
    process(clk, clr)
    begin
        if clr = '1' then
            q <= (others =>'0');
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
				
				if inc='1' then
					
					q <=std_logic_vector(unsigned(d) + 1);
					
					
        end if;
		  
		end if;
		
		  
		 
    end process;
	 

		
		
END description;

