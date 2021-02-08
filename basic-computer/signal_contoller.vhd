----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:29 09/16/2020 
-- Design Name: 
-- Module Name:    signal_contoller - Behavioral 
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

entity signalcontoller is port
(clock:in std_logic;
rst:in std_logic;
 T:out std_logic_vector(7 downto 0)
 );
end signalcontoller;

architecture Behavioral of signalcontoller is

component decoder is
Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component UP_COUNTER is
    Port ( clk: in std_logic; -- clock input
           reset: in std_logic; -- reset input 
           counter: out std_logic_vector(2 downto 0) -- output 4-bit counter
     );
end component;

signal count:std_logic_vector(2 downto 0);



begin

up_counter1: UP_COUNTER port map(clk=>clock , reset=>rst ,counter=>count);

decoder1:decoder port map(sel=>count ,y =>T);


end Behavioral;

