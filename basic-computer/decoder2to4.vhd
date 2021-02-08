library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder2to4 is
Port ( selec : in STD_LOGIC_VECTOR (1 downto 0);
Y : out STD_LOGIC_VECTOR (3 downto 0));
end decoder2to4;

architecture Behavioral of decoder2to4 is
begin
with selec select
Y<="0001" when "00",--D(0)
"0010" when "01",--D(1)
"0100" when "10",--D(2)
"1000" when "11",--D(3)
"0000" when others;--never happen :)
end Behavioral;