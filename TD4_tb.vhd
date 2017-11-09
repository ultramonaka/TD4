library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TD4_tb is
end entity;





architecture RTL of TD4_tb is

	
signal	clk_manual	:	std_logic;
signal	clk_sel 		:	std_logic;
signal	clk_50m 		:	std_logic;
signal	rst_n 		:	std_logic;
signal	sw_4bit 		:	std_logic_vector(3 downto 0);
signal	clk_led 		:	std_logic;
signal	led_o 		:	std_logic_vector(3 downto 0);
signal	p_rom_led 	:	std_logic_vector(7 downto 0);
	
	
component TD4
	port (
		CLK_MANUAl	:	in		std_logic;								--PUSH SW
		CLK_SEL		:	in		std_logic;								--PUSH SW
		CLK_50M		:	in		std_logic;								--IN CLOCK
		RST_n			:	in 	std_logic;								
		SW_4bit		:	in		std_logic_vector(3 downto 0);
		CLK_LED		:	out	std_logic;
		LED_o			:	out	std_logic_vector(3 downto 0);
		P_ROM_LED	:	out	std_logic_vector(7 downto 0)
	);
end component;


	
	
begin 
	comp : TD4 
		port map(
			clk_manual 	=> 	CLK_MANUAl,
			clk_sel 		=> 	CLK_SEL,		
			clk_50m 		=> 	CLK_50M,		
			rst_n 		=> 	RST_n,			
			sw_4bit 		=> 	SW_4bit,	
			clk_led 		=> 	CLK_LED,
			led_o 		=> 	LED_o,		
			p_rom_led 	=> 	P_ROM_LED
		);
	process
	begin
		--clk_sel	<=  	
		--clk_50m 	
		--rst_n 	
		--sw_4bit 	
		

		
	
		wait for 100 ps;
	
	end process;
	
	
	
end RTL;