library ieee;
use ieee.std_logic_1164.all;

entity four_one_mux is
	port(A, B, C, D : in std_logic;
	     F		: out std_logic);
end four_one_mux;

architecture four_one_mux_arch of four_one_mux is
	-- 2-bit signal to hold concatenated C&D
	signal input : std_logic_vector(1 downto 0) := "00";
	begin
	input <= C&D;
	-- "process + case statement"
	process(input)
		begin
			case input is
				when "00" => F <= not A after 10 ns;
				when "01" => F <= B after 10 ns;
				when "10" => F <= not B after 10 ns;
				when "11" => F <= '0' after 10 ns;
				when others => F <= 'X' after 10 ns;
				-- when others => report "unreachable" severity failure;
			end case;
	end process;
end four_one_mux_arch;

