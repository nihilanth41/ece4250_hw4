library ieee;
use ieee.std_logic_1164.all;

entity sn74194 is
  port(SDR, SDL, S1, S0, CLRb, CLK : in std_logic;
       D			       : in std_logic_vector(3 downto 0);
       Q			       : out std_logic_vector(3 downto 0));
end sn74194;

architecture sn74194_arch of sn74194 is
  -- 2-bit signal to hold concatenated: (S1,S0)
  signal control : std_logic_vector(1 downto 0) := "00";
  signal qint   : std_logic_vector(3 downto 0) := "0000";
begin
  control <= S1&S0;
  -- Everything except CLRb is synchronous
  process(CLK)
  begin
    if(CLRb='0') then
      qint <= "0000";
    end if;
    if(CLK'EVENT and CLK='1') then
      case control is
        when "11" => qint <= D;
        when "10" => qint <= (SDR & qint(3 downto 1));
        when "01" => qint <= (qint(2 downto 0) & SDL);
        when others => null;
      end case;	
    end if;			
  end process;
  Q <= qint;
end sn74194_arch;
