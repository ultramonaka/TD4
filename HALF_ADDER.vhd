library IEEE;
use IEEE.std_logic_1164.all;

entity HALF_ADDER is
	port ( 	
		A	: in 	std_logic;
		B 	: in 	std_logic;
		S 	: out std_logic;
		C 	: out std_logic 
	);
end HALF_ADDER;

architecture STRUCTURE of HALF_ADDER is
begin

	S <= A xor B;
	C <= A and B;

end STRUCTURE;