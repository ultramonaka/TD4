library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY CLK_RST IS
	PORT (
		CLK_MANUAL	:	IN		STD_LOGIC;
		CLK_SEL		:	IN		STD_LOGIC;
		CLK_50M		:	IN		STD_LOGIC;
		CLK_O			:	OUT	STD_LOGIC;
		RST_SW_n		:	IN		STD_LOGIC;
		RST_n			:	OUT	STD_LOGIC
	);
END	CLK_RST;


ARCHITECTURE	RTL	of	CLK_RST	is

signal clk_t	:	std_logic	:='0';
signal cnt		:	std_logic_vector(24 downto 0)	:= "0000000000000000000000000";


BEGIN
	
	PROCESS(CLK_MANUAL, CLK_SEL, CLK_50M, RST_SW_n)
	BEGIN
		if(RST_SW_n = '0') then
			cnt 	<= "0000000000000000000000000";
			clk_t <= '0';
		elsif(RST_SW_n = '1') then
			if(CLK_SEL = '1') then											--Manual count
				clk_t	<=	CLK_MANUAL;
			elsif(CLK_SEL = '0') then										--1s count
				if (CLK_50M'event and CLK_50M = '1')then
					cnt <= cnt + 1;
					if(cnt = "1011111010111100001000000") then
                               
						cnt <= "0000000000000000000000000";
						clk_t <= not clk_t;
					end if;
				end if;
			end if;
		end if;
		CLK_O	<=	clk_t;
	END PROCESS;
	RST_n	<=	RST_SW_n;
	
	

END RTL;

