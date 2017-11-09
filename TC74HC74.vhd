library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC74HC74 is
	port (
		CLR1_n	:	in 	std_logic;
		D1			:	in 	std_logic;
		CK1		:	in 	std_logic;
		PR1_n		:	in 	std_logic;
		Q1			:	out 	std_logic;
		Q1_n		:	out 	std_logic;
		
		CLR2_n	:	in 	std_logic;
		D2			:	in 	std_logic;
		CK2		:	in 	std_logic;
		PR2_n		:	in 	std_logic;
		Q2			:	out 	std_logic;
		Q2_n		:	out	std_logic
	);
end TC74HC74;

architecture RTL of TC74HC74 is

--component
component D_FF
	port (
		CLR_n		:	in 	std_logic;
		D			:	in 	std_logic;
		CK			:	in 	std_logic;
		PR_n		:	in 	std_logic;
		Q			:	out 	std_logic;
		Q_n		:	out 	std_logic
	);
end component;


	
begin

	COMP1	:	D_FF 	port map	(CLR1_n, D1, CK1, PR1_n, Q1, Q1_n);
	COMP2	:	D_FF	port map	(CLR2_n, D2, CK2, PR2_n, Q2, Q2_n);
	
end RTL;