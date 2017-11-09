library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC74HC161 is
	port (
		CLR_n		:	in 	std_logic;
		LORD_n	:	in 	std_logic;
		data		:	in 	std_logic_vector(3 downto 0);
		CLK		:	in 	std_logic;
		ENT		:	in 	std_logic;
		ENP		:	in		std_logic;
		CO			:	out	std_logic;
		Q			:	out	std_logic_vector(3 downto 0)
	);
end TC74HC161;

architecture RTL of TC74HC161 is

signal Q_t	:	std_logic_vector(3 downto 0);

begin 
	process (CLK)
	begin
		if (CLK'event and CLK = '1') then
			if(CLR_n = '0') then
				Q_t <= "0000";
				CO <= '0';
			elsif(LORD_n = '0' ) then
				Q_t <= data;
			elsif(LORD_n = '1') then
				if( (ENP = '1') and (ENT = '1') ) then
					Q_t <= Q_t + 1;
					if(Q_t = "1111") then
						Q_t <= "0000";
						CO <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
	Q <= Q_t;
end RTL;
			