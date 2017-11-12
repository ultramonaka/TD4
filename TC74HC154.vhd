library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;

entity TC74HC154 is
	port (
		--Input
		G_n		:	in 	std_logic_vector(1 downto 0);
		ADD		:	in		std_logic_vector(3 downto 0);

		Output	:	out 	std_logic_vector(15 downto 0)
	);
end TC74HC154;


architecture RTL of TC74HC154 is

--signal
--signal		Output_t	:	std_logic_vector(15 downto 0);

begin
	process (ADD)
	begin
		if(G_n = "00") then
			case ADD is
				when	"0000"		=>	Output <= 	X"0001";
				when	"0001"		=>	Output <= 	X"0002";
				when	"0010"		=>	Output <= 	X"0004";
				when	"0011"		=>	Output <= 	X"0008";
				when	"0100"		=>	Output <= 	X"0010";
				when	"0101"		=>	Output <= 	X"0020";
				when	"0110"		=>	Output <= 	X"0040";
				when	"0111"		=>	Output <= 	X"0080";
				when	"1000"		=>	Output <= 	X"0100";
				when	"1001"		=>	Output <= 	X"0200";
				when	"1010"		=>	Output <= 	X"0400";
				when	"1011"		=>	Output <= 	X"0800";
				when	"1100"		=>	Output <= 	X"1000";
				when	"1101"		=>	Output <= 	X"2000";
				when	"1110"		=>	Output <= 	X"4000";
				when	"1111"		=>	Output <= 	X"8000";
				when 	others		=> Output <= 	"ZZZZZZZZZZZZZZZZ";
			end case;
		else
			Output <= "ZZZZZZZZZZZZZZZZ";

		end if;
		--Output <= Output_t;
		
	end process;


end RTL;
