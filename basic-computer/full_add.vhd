----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:38 09/16/2020 
-- Design Name: 
-- Module Name:    full_add - Behavioral 
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


ENTITY add2 IS
    PORT( a, b  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
          cin   : IN  STD_LOGIC;
          ans   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
          cout  : OUT STD_LOGIC
    );
END add2;

ARCHITECTURE STRUCTURE OF add2 IS

    COMPONENT BIT_ADDER
        PORT( a, b, cin  : IN  STD_LOGIC;
                sum, cout  : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL c1 : STD_LOGIC;

BEGIN

    b_adder0: BIT_ADDER PORT MAP (a(0), b(0), cin, ans(0), c1);
    b_adder1: BIT_ADDER PORT MAP (a(1), b(1), c1, ans(1), cout);

END STRUCTURE;
