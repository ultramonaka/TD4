begin
	process(Addres)
	begin 
		case Addres is
			when	X"0001"		=>	ROM_O <= 	X"B3";
			when	X"0002"		=>	ROM_O <= 	X"B6";
			when	X"0004"		=>	ROM_O <= 	X"B0";
			when	X"0008"		=>	ROM_O <= 	X"B8";
			when	X"0010"		=>	ROM_O <= 	X"B8";
			when	X"0020"		=>	ROM_O <= 	X"BC";
			when	X"0040"		=>	ROM_O <= 	X"B6";
			when	X"0080"		=>	ROM_O <= 	X"B3";
			when	X"0100"		=>	ROM_O <= 	X"B1";
			when	X"0200"		=>	ROM_O <= 	X"F0";
			when	X"0400"		=>	ROM_O <= 	X"FF";
			when	X"0800"		=>	ROM_O <= 	X"FF";
			when	X"1000"		=>	ROM_O <= 	X"FF";
			when	X"2000"		=>	ROM_O <= 	X"FF";
			when	X"4000"		=>	ROM_O <= 	X"FF";
			when	X"8000"		=>	ROM_O <= 	X"FF";
			when 	others		=> ROM_O <= 	X"FF"; 
		end case;
	end process;
end RTL;