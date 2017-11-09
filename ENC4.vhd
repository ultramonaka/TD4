library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ENC4 is
	port (
		Addres	:	in		std_logic_vector(15 downto 0);
		ENC_out	:	out 	std_logic_vector(3 downto 0)
	);
end ENC4;


architecture RTL of ENC4 is 

begin 
	process(Addres)
	begin
		case Addres is 
			when	X"0001"		=>	ENC_out <= 	X"0";
			when	X"0002"		=>	ENC_out <= 	X"1";
			when	X"0004"		=>	ENC_out <= 	X"2";
			when	X"0008"		=>	ENC_out <= 	X"3";
			when	X"0010"		=>	ENC_out <= 	X"4";
			when	X"0020"		=>	ENC_out <= 	X"5";
			when	X"0040"		=>	ENC_out <= 	X"6";
			when	X"0080"		=>	ENC_out <= 	X"7";
			when	X"0100"		=>	ENC_out <= 	X"8";
			when	X"0200"		=>	ENC_out <= 	X"9";
			when	X"0400"		=>	ENC_out <= 	X"A";
			when	X"0800"		=>	ENC_out <= 	X"B";
			when	X"1000"		=>	ENC_out <= 	X"C";
			when	X"2000"		=>	ENC_out <= 	X"D";
			when	X"4000"		=>	ENC_out <= 	X"E";
			when	X"8000"		=>	ENC_out <= 	X"F";
			when 	others		=> ENC_out <= 	X"0";
		end case;
	end process;
end RTL;