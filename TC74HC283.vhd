library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity TC74HC283 is
	port ( 	
		A	: in 	std_logic_vector(3 downto 0);
		B 	: in 	std_logic_vector(3 downto 0);
		S 	: out std_logic_vector(3 downto 0);
		C 	: out std_logic 
	);
end TC74HC283;

architecture RTL of TC74HC283 is

component FULL_ADDER
	port(
		A 		: in 	std_logic;
		B 		: in 	std_logic;
		CIN	: in 	std_logic;
		SUM	: out std_logic;
		COUT 	: out std_logic 
	);
end component;
	
signal C_t	:	std_logic_vector(3 downto 0);
signal LOW	:	std_logic	:='0';
	
begin

	FA0 :	FULL_ADDER	port map ( A(0), B(0), LOW,  	 S(0), C_t(0) );
	FA1 :	FULL_ADDER	port map ( A(1), B(1), C_t(0), S(1), C_t(1) );
	FA2 :	FULL_ADDER	port map ( A(2), B(2), C_t(1), S(2), C_t(2) );
	FA3 :	FULL_ADDER	port map ( A(3), B(3), C_t(2), S(3), C_t(3) );
	
	C <= C_t(0) OR C_t(1) OR C_t(2) OR C_t(3);  



end RTL; 