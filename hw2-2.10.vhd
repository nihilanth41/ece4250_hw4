-- Problem 2.10
-- Zachary Rump
library ieee;
use ieee.std_logic_1164.all;

entity MNFF is
  port(clk, clr_in, m, n : in std_logic;
       q, qn : out std_logic);
end MNFF;

architecture MNFF_A of MNFF is
  -- internal signal for output (q_internal)
  signal q_int : std_logic := '0';
    begin -- concurrent statements
    q <= q_int;
    qn <= not(q_int);
    process(clk, clr_in) -- anything that should cause the process to be re-eval'd
    begin
        if(clr_in = '0') then q_int <= '0'; -- clr_in is async.
        elsif (clk = '0' and clk'event) then -- falling edge
            if( m='0' and n='0' ) then q_int <= not q_int; -- change state
            elsif( m='0' and n='1' ) then q_int <= '1'; --set output
            -- elsif( m='1' and n='1' ) -- no change in state
            end if;
        end if;
    end process
end MNFF_A; 
      
      
      
      
      

      
