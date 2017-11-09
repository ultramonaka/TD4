library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC74HC154_tb is
end TC74HC154_tb;


architecture RTL of TC74HC154_tb is

signal g_n	:	std_logic_vector(1 downto 0);
signal add	:	std_logic_vector(3 downto 0);

component TC74HC154
	port (
		--Input
		G_n		:	in 	std_logic_vector(1 downto 0);
		ADD		:	in		std_logic_vector(3 downto 0);

		Output	:	out 	std_logic_vector(15 downto 0)
	);
end component;

begin 
	cmp	:	TC74HC154
		port map (
			g_n	=>		G_n,
			add	=>		ADD
		);
	process
	begin
		g_n 	<= 	"00";
		add	<=		"0000";
		wait for 50ps;
		
		loop
			wait for 50ps;
			add	<=		add + 1;

			--wait for 50ps;
		end loop;
	end process;

end;