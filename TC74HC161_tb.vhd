library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC74HC161_tb is
end TC74HC161_tb;

architecture RTL of TC74HC161_tb is

signal Q_t	:	std_logic_vector(3 downto 0);

signal clr_n	:	std_logic;
signal lord_n	:	std_logic;
signal data		:	std_logic_vector(3 downto 0);
signal ent		:	std_logic;
signal enp		:	std_logic;
signal clk		:	std_logic;

	component TC74HC161
		port (
			CLR_n		:	in		std_logic;
			LORD_n	:	in		std_logic;
			data		:	in		std_logic_vector(3 downto 0);
			CLK		:	in		std_logic;
			ENT		:	in		std_logic;
			ENP		:	in		std_logic;
			CO			:	out	std_logic;
			Q			:	out	std_logic_vector(3 downto 0)
		);
	end component;

begin 
	cmp : TC74HC161
		port map (
			clr_n 	=> 	CLR_n,
			lord_n 	=>		LORD_n,
			data 		=>		data,
			clk		=> 	CLK,
			ent		=> 	ENT,
			enp		=>		ENP
		);
	process
		begin
			clr_n		<= '1';
			clk		<= '0';
			enp		<= '0';
			ent 		<= '0';
			lord_n	<= '0';
			Q_t		<= "0000";
			data 		<= "0100";
		wait for 100ps;
			clk	<= '1';
		wait for 100ps;
			clk	<= '0';
			clr_n	<= '0';
		wait for 100ps;
			clk	<= '1';
		wait for 100ps;
		
			clr_n	<= '1';
			clk	<= '0';
			enp	<= '0';
			ent 	<= '0';
			lord_n	<= '0';

		
		loop
			wait for 50ps;
				clk	<= '1';
			wait for 50ps;
				clk	<=	'0';
				data <= data +1;
		end loop;
			
			
	end process;


end;