library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ROM is
	port (
		Addres	:	in		std_logic_vector(15 downto 0);
		ROM_O		:	out 	std_logic_vector(7 downto 0)
	);
end ROM;


architecture RTL of ROM is 


--begin
--	process(Addres)
--	begin 
--		case Addres is
--			--when	X"0000"		=>	ROM_O <= 	X"B7";
--			when	X"0001"		=>	ROM_O <= 	X"B7";
--			when	X"0002"		=>	ROM_O <= 	X"01";
--			when	X"0004"		=>	ROM_O <= 	X"E1";
--			when	X"0008"		=>	ROM_O <= 	X"01";
--			when	X"0010"		=>	ROM_O <= 	X"E3";
--			when	X"0020"		=>	ROM_O <= 	X"B6";
--			when	X"0040"		=>	ROM_O <= 	X"01";
--			when	X"0080"		=>	ROM_O <= 	X"E6";
--			when	X"0100"		=>	ROM_O <= 	X"01";
--			when	X"0200"		=>	ROM_O <= 	X"E8";
--			when	X"0400"		=>	ROM_O <= 	X"B0";
--			when	X"0800"		=>	ROM_O <= 	X"B4";
--			when	X"1000"		=>	ROM_O <= 	X"01";
--			when	X"2000"		=>	ROM_O <= 	X"EA";
--			when	X"4000"		=>	ROM_O <= 	X"B8";
--			when	X"8000"		=>	ROM_O <= 	X"FF";
--			when 	others		=> ROM_O <= 	X"00"; 
--		end case;
--	end process;
--end RTL;

begin
	process(Addres)
	begin 
		case Addres is
			when	X"0001"		=>	ROM_O <= 	"10110011";  	--0000
			when	X"0002"		=>	ROM_O <= 	"10110110";		--0001
			when	X"0004"		=>	ROM_O <= 	"10111100";		--0010
			when	X"0008"		=>	ROM_O <= 	"10111000";		--0011
			when	X"0010"		=>	ROM_O <= 	"10111000";		--0100
			when	X"0020"		=>	ROM_O <= 	"10111100";		--0101
			when	X"0040"		=>	ROM_O <= 	"10110110";		--0110
			when	X"0080"		=>	ROM_O <= 	"10110011";		--0111
			when	X"0100"		=>	ROM_O <= 	"10110001";		--1000
			when	X"0200"		=>	ROM_O <= 	"11110000";		--1001
			when	X"0400"		=>	ROM_O <= 	"11111111";		--1010
			when	X"0800"		=>	ROM_O <= 	"11111111";		--1011
			when	X"1000"		=>	ROM_O <= 	"11111111";		--1100
			when	X"2000"		=>	ROM_O <= 	"11111111";		--1101
			when	X"4000"		=>	ROM_O <= 	"11111111";		--1110
			when	X"8000"		=>	ROM_O <= 	"11111111";		--1111
			when 	others		=> 	ROM_O <= 	"ZZZZZZZZ";
		end case;
	end process;
end RTL;

--BRINK LED
