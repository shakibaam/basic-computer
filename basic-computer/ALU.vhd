----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:42 09/16/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is port (
input1: in std_logic_vector(7 downto 0);
input2: in std_logic_vector(7 downto 0);
output: out std_logic_vector(7 downto 0);
carry: out std_logic);
end ALU;

architecture Behavioral of ALU is

signal c1,c2,c3,c4,c5,c6,c7:std_logic;

component full_adder is  Port(    i0, i1, cin: in std_logic;  s, cout   : out std_logic     );  
end component; 


begin
FA1:full_adder port map (i0=>input1(0) , i1=>input2(0) , cin=>'0' , s=>output(0) ,cout=>c1);
FA2:full_adder port map (i0=>input1(1) , i1=>input2(1) , cin=>c1, s=>output(1) ,cout=>c2);
FA3:full_adder port map (i0=>input1(2) , i1=>input2(2) , cin=>c2 , s=>output(2) ,cout=>c3);
FA4:full_adder port map (i0=>input1(3) , i1=>input2(3) , cin=>c3,  s=>output(3) ,cout=>c4);
FA5:full_adder port map (i0=>input1(4) , i1=>input2(4) , cin=>c4 , s=>output(4) ,cout=>c5);
FA6:full_adder port map (i0=>input1(5) , i1=>input2(5) , cin=>c5 , s=>output(5) ,cout=>c6);
FA7:full_adder port map (i0=>input1(6) , i1=>input2(6) , cin=>c6 , s=>output(6),cout=>c7);
FA8:full_adder port map (i0=>input1(7) , i1=>input2(7) , cin=>c7 , s=>output(7) ,cout=>carry);




end Behavioral;

