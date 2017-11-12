library IEEE;
use IEEE.std_logic_1164.all;

entity FULL_ADDER is
	port (
		A		:	in 		std_logic;
		B 		:	in 		std_logic;
		CIN 	: 	in 		std_logic;
		SUM 	:	out 	std_logic;
		COUT 	: 	out 	std_logic 
	);
end FULL_ADDER;


architecture STRUCTURE of FULL_ADDER is

-- HALF_ADDER
component HALF_ADDER
	port (
		A 	: in 	std_logic;
		B 	: in 	std_logic;
		S	: out 	std_logic;
		C 	: out 	std_logic
	);
end component;

signal 	C1_C	: std_logic;
signal	C1_S	: std_logic;
signal	C2_C 	: std_logic;

begin
	COMP1 : HALF_ADDER port map ( A, B, C1_S, C1_C );
	COMP2 : HALF_ADDER port map ( C1_S, CIN, SUM, C2_C );

	COUT <= C1_C or C2_C;
end STRUCTURE;