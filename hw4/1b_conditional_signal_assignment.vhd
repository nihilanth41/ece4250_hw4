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
		-- "conditional signal assignment"
		F <= not A after 10 ns when input = "00" else
			 B after 10 ns when input = "01" else
			 not B	after 10 ns when input = "10" else
			 '0' after 10 ns when input = "11" else
			 'X' after 10 ns;
end four_one_mux_arch;
