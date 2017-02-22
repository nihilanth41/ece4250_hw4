library ieee;
use ieee.std_logic_1164.all

  entity ebsr is 
    port(RSD, LSD, S1, S0, CLRb, CLK : in std_logic;
           X	: in std_logic_vector(7 downto 0);
             Y	: out std_logic_vector(7 downto 0));
  end ebsr;

architecture ebsr_arch of ebsr is

  component sn74194
    port(SDR, SDL, S1, S0, CLRb, CLK : in std_logic;
         D			       : in std_logic_vector(3 downto 0);
         Q			       : out std_logic_vector(3 downto 0));
  end component;

-- signal sig : std_logic;
begin
--  sn1: sn74194 port map (a, b);
--  sn2: sn74194 port map (b, a);
end ebsr_arch;
    
    
