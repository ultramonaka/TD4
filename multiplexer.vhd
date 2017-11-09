library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;




entity multiplexer is
	port (
		G_n		:	in 	std_logic;
		data		:	in 	std_logic_vector(3 downto 0);
		SEL		:	in 	std_logic_vector(1 downto 0);
		Y			:	out 	std_logic
	);
end multiplexer;



architecture RTL of multiplexer is
--signal
begin
	process (SEL)
	begin
		if(G_n = '1') then
			Y <= '0';
		else
			case SEL is
				when	"00"		=>	Y <= 	data(0);
				when	"01"		=>	Y <= 	data(1);
				when	"10"		=>	Y <= 	data(2);
				when	"11"		=>	Y <= 	data(3);
				when 	others	=> Y <= 	'X';
			end case;
		end if;
		
	end process;

end RTL;