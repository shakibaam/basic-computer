library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is port 
(addrs_start:in std_logic_vector(3 downto 0);
clk:in std_logic;
reset:in std_logic;

output:out std_logic_vector(7 downto 0)
);
end data_path;

architecture Behavioral of data_path is

component AC IS PORT(
    d   : IN STD_LOGIC_vector(7 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_vector(7 downto 0) -- output.
);
END component;

component AR IS PORT(
    d   : IN STD_LOGIC_vector(3 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_vector(3 downto 0) -- output.
);
END component;

component decoder2to4 is
Port (
selec : in STD_LOGIC_VECTOR (1 downto 0);
Y : out STD_LOGIC_VECTOR (3 downto 0)
);
end  component decoder2to4;


component DR IS PORT(
    d   : IN STD_LOGIC_vector(7 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
     clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_vector(7 downto 0) -- output.
);
END component;


component IR IS PORT(
    d   : IN STD_LOGIC_vector(7 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_vector(7 downto 0) -- output.
);
END component;


component PC IS PORT(
    d   : IN STD_LOGIC_vector(3 downto 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
  inc:  IN std_logic;
    q   : OUT STD_LOGIC_vector(3 downto 0) -- output.
);
END component;



component dual_RAM is

PORT
   (
      
      data_in:  IN   std_logic_vector  (7 downto 0);
  data_out:  out   std_logic_vector  (7 downto 0);
      wr:  IN  std_logic;
      rd:   IN  std_logic;

  addrs:IN std_logic_vector  (3 downto 0)

     
   );
end component;




component ALU is port (
input1: in std_logic_vector(7 downto 0);
input2: in std_logic_vector(7 downto 0);
output: out std_logic_vector(7 downto 0);
carry: out std_logic);
end component;



component encoder8to3 is
port(
din : in STD_LOGIC_VECTOR(7 downto 0);
dout : out STD_LOGIC_VECTOR(2 downto 0)
);
end component;





component signalcontoller is port
(
clock:in std_logic;
rst:in std_logic;
 T:out std_logic_vector(7 downto 0)
 );
end component;

signal data_addrs_bus:std_logic_vector(7 downto 0) := (others => '0');
signal S:std_logic_vector(2 downto 0) ;
--signal rst:std_logic := '0';
signal T :std_logic_vector(7 downto 0) := (others => '0') ;



signal   clear :  STD_LOGIC := '0';
 
signal  inc_pc:   std_logic := '0';
signal    out_pc   :  STD_LOGIC_vector(3 downto 0) := (others => '0') ;




signal   ld_AR  :  STD_LOGIC := '0'; 
signal    out_AR   :  STD_LOGIC_vector(3 downto 0):= (others => '0') ;





signal   ld_IR  :  STD_LOGIC := '0'; 
signal    out_IR   :  STD_LOGIC_vector(7 downto 0):= (others => '0') ;





signal   ld_DR  :  STD_LOGIC:= '0'; 
signal    out_DR   :  STD_LOGIC_vector(7 downto 0):= (others => '0') ;



signal   ld_AC  :  STD_LOGIC:= '0'; 
signal    out_AC   :  STD_LOGIC_vector(7 downto 0) := (others => '0');
signal    AC_input   :  STD_LOGIC_vector(7 downto 0) := (others => '0');






signal E:std_logic:= '0';


signal D:std_logic_vector (3 downto 0):= (others => '0');

signal read_mem , write_mem: std_logic:= '0';
signal out_memory:std_logic_vector (7 downto 0):= (others => '0');


signal  d1,d2,d3 , d4 , d5 , d6,d7 : std_logic := '0';
signal encoder_input:std_logic_vector(7 downto 0):= (others => '0');
signal test:std_logic_vector(7 downto 0):= (others => '0');

begin
PC_instance:PC port map ( d  => addrs_start , ld => '1', clr => clear, clk => clk, inc => inc_pc, q => out_pc);

AR_instance:AR port map(  d  =>data_addrs_bus(3 downto 0) , ld => ld_AR, clr => clear, clk => clk,q => out_AR);

--

IR_instance:IR port map(  d  => data_addrs_bus, ld => ld_IR, clk => clk, q => out_IR);
--IR_instance:IR port map(  d  => "00000101", ld => ld_IR, clk => clk, q => out_IR);--loading AC
--IR_instance:IR port map(  d  => "00010100", ld => ld_IR, clk => clk, q => out_IR);--adding
--IR_instance:IR port map(  d  => "00100110", ld => ld_IR, clk => clk, q => out_IR);--store and having output

AC_instance:AC port map(  d  => data_addrs_bus, ld => ld_AC, clr => clear, clk => clk, q => out_AC);

DR_instance:DR port map(  d  => data_addrs_bus, ld => ld_DR, clr => clear,clk => clk,  q => out_DR);

ALU_instance :ALU  port map (input1 => out_DR , input2 => out_AC , output =>AC_input , carry => E);

decoder2to4_instance: decoder2to4 port map (selec => out_IR(5 downto 4) , Y => D);

signalcontoller_instance:signalcontoller port map (clock => clk , rst => reset , T => T);

dual_RAM_instance: dual_RAM port map ( data_in => data_addrs_bus , data_out => out_memory ,
             wr => write_mem , rd => read_mem ,addrs => out_AR);
				 
				 
encoder8to3_instance :encoder8to3 port map ( din => encoder_input , dout => S);



d1 <= (T(1) or (T(3) and D(0)) or (T(3) and D(1)));
d2 <= '0';
d3 <= T(0);
d4 <= (T(4) and D(0));
d5 <= (T(3) and D(2));
d6 <= T(2);
d7<=(T(4) and D(1));

encoder_input <= '0' & d1 & d2 & d3 & d4 & d5 & d6 & '0';

--test<=data_addrs_bus when  S="101" ;


data_addrs_bus <= out_memory when S="001" else
("0000" & out_AR)when S="010" else --never happen :)
("0000" & out_pc) when S="011" else
out_DR when S="100" else
out_AC when S="101" else 
out_IR when S="110" else --out_IR
("0000" & out_IR(3 downto 0)) when T(2) = '1' else
AC_input when (T(4) and D(1))='1';

read_mem <= T(1) or (T(3) and D(0)) or (T(3) and D(1));
write_mem <= (T(3) and D(2))   ;
ld_AR <= T(0) or T(2) ;
inc_PC <= T(1);
ld_DR <= (T(3) and D(0)) or ( T(3) and D(1));
ld_AC <= (T(4) and D(0)) or (T(4) and D(1));
ld_IR <= T(1) ;

--clear <= (T(4) and D(0)) or (T(4) and D(1)) or (T(3) and D(2));
clear<='0';

output <= out_memory when write_mem = '1';


end Behavioral;