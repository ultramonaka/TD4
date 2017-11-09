library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TRC is
	port (
		D4			:	in		std_logic;
		D5			:	in		std_logic;
		D6			:	in		std_logic;
		D7			:	in		std_logic;
		Q_n		:	in		std_logic;
		LOAD_n	:	out	std_logic_vector(3 downto 0);
		DATA_SEL	:	out	std_logic_vector(1 downto 0)
	);
end TRC;

architecture RTL of TRC is

begin
	
	DATA_SEL(0)	<= D4 or D7;
	DATA_SEL(1)	<= D5;
	
	LOAD_n(0)	<= D6 or D7;
	LOAD_n(1)	<= not D7 or D7;
	LOAD_n(2)	<= not (not D7 and D7);
	LOAD_n(3)	<= (Q_n or D4) and D6 and D7;


end RTL;