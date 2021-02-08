----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:58:32 09/16/2020 
-- Design Name: 
-- Module Name:    memory - Behavioral 
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

entity dual_RAM is

PORT
   (
      
      data_in:  IN   std_logic_vector  (7 downto 0);
    data_out:  out   std_logic_vector  (7 downto 0);
      wr:  IN  std_logic;
      rd:   IN  std_logic;

  addrs:IN std_logic_vector  (3 downto 0)

     
   );
end dual_RAM;

architecture Behavioral of dual_RAM is
type dual_ram_memory is array ( 0 to (2**4)-1) of std_logic_vector (7 downto 0);
signal dual_ram_mem:dual_ram_memory;



begin
 PROCESS (rd,wr)
   BEGIN
    
  
      

      if(wr='1') then
  
    
      dual_ram_mem(to_integer(unsigned(addrs)))<=data_in;
        
        
       end if;
      
      if(rd='1') then
      data_out<=dual_ram_mem(to_integer(unsigned(addrs)));
      end if;

    
    
      
      
      
      
end  PROCESS;



end Behavioral;