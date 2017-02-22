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
		-- "selected signal assignment"
		with input select F <=
			not A after 10 ns when "00",
			B after 10 ns when "01", 
			not B after 10 ns  when "10",
			'0' after 10 ns when "11",
			'X' after 10 ns when others;
end four_one_mux_arch;
