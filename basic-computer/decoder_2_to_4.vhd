----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:06 09/17/2020 
-- Design Name: 
-- Module Name:    decoder_2_to_4 - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity decoder2to4 is
Port ( selec : in STD_LOGIC_VECTOR (1 downto 0);
Y : out STD_LOGIC_VECTOR (3 downto 0));
end decoder2to4;

architecture Behavioral of decoder2to4 is
begin
with selec select
Y<="0001" when "00",
"0010" when "01",
"0100" when "10",
"1000" when "11",

"0000" when others;
end Behavioral;

