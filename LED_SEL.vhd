library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity LED_SEL is
	port (
		SW_SEL		:	in		std_logic_vector(1 downto 0);
		CLK			:	in		std_logic;
		MANUAL		:	in		std_logic;
		REG_SEL		:	in  	std_logic_vector(1 downto 0);
		PORT_IN		:	in		std_logic_vector(3 downto 0);
		PORT_OUT		:	in		std_logic_vector(3 downto 0);
		LOAD			:	in		std_logic_vector(3 downto 0);
		ADDRES_REG	:	in		std_logic_vector(3 downto 0);
		ROM			:	in		std_logic_vector(7 downto 0);
		ADD_DEC		:	in		std_logic_vector(3 downto 0);
		LED			:	out 	std_logic_vector(7 downto 0)
	);
end LED_SEL;


-- dip sw sel
--
--    ---------------------------------------------------------------------
--   |     |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
--   ----------------------------------------------------------------------
--	  | 00  |       OUT                     |    reg sel    |manual |   CLK |
--   ----------------------------------------------------------------------
--	  | 01  |                             R O M                             |  
--   ----------------------------------------------------------------------
--   | 10  |      LORD                     |          ADD_Dreg_out         |                    
--   ----------------------------------------------------------------------   
--	  | 11  |      Addres_decoder out       |          IN                   |
--    ---------------------------------------------------------------------



architecture RTL of LED_SEL is

signal LED_TMP : std_logic_vector(7 downto 0);

begin
	process(SW_SEL, CLK, MANUAL, REG_SEl, PORT_IN, PORT_OUT, LOAD, ADDRES_REG, ROM, ADD_DEC)
	begin
		if		(SW_SEL = "00") then
			LED_TMP <= PORT_OUT & REG_SEL & MANUAL & CLK;
		elsif	(SW_SEL = "01") then
			LED_TMP <= ROM;
		elsif	(SW_SEL = "10") then
			LED_TMP <= LOAD & "0000";
		elsif	(SW_SEL = "11") then
			LED_TMP <= ADD_DEC & PORT_IN;
		else
			LED_TMP <= "ZZZZZZZZ";
		end if;
	
	end process;
	
	LED <= LED_TMP;

end RTL; 