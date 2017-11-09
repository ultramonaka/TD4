library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC74HC540 is
	port(
		G1_n	:	in		std_logic;
		G2_n	:	in		std_logic;
		A		:	in		std_logic_vector(7 downto 0);
		Y_n	:	out	std_logic_vector(7 downto 0)
	);
end TC74HC540;

architecture RTL of TC74HC540 is

signal Yt	:	std_logic_vector(7 downto 0);

begin
	process(G1_n, G2_n, A)
	begin
		if(G1_n = '1' or  G2_n = '1') then
			Yt <= "ZZZZZZZZ";
		elsif(G1_n = '0' and G2_n = '0') then
			Yt <= not A;
		else 
			Yt <= "ZZZZZZZZ";
		end if;
		Y_n <= Yt;
	end process;
end RTL;