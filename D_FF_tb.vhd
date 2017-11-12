library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity D_FF_tb is
end D_FF_tb;

architecture RTL of D_FF_tb is

signal clr_n	:	std_logic;
signal d			:	std_logic;
signal ck		:	std_logic;
signal pr_n		:	std_logic;


component D_FF
	port (
		CLR_n		:	in 	std_logic;
		D			:	in 	std_logic;
		CK			:	in 	std_logic;
		PR_n		:	in 	std_logic;
		Q			:	out 	std_logic;
		Q_n			:	out 	std_logic
	);
end component;

begin 
	comp : D_FF port map(clr_n, d, ck, pr_n);

	process
	begin
		clr_n	<=	'1';
		d		<=	'0';
		ck	<=	'0';
		pr_n	<=	'1';

		wait for 50 ps;

		d		<= '1';
		wait for 50 ps;
		ck 	<=	'1';
		wait for 50ps; 


	end process;
end;