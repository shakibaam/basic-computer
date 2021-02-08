----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:42 09/16/2020 
-- Design Name: 
-- Module Name:    IR - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY IR IS PORT(
    d   : IN STD_LOGIC_vector(7 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
   
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_vector(7 downto 0) -- output.
);
END IR;

ARCHITECTURE description OF IR IS

BEGIN
    process(clk)
    begin
      
        if rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;

