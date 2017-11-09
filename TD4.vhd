library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

---------------------------
--  |   3   |   2   |   1   |   0   |
--  |CLK_SEL| RST_n |  SW_2bit      |
--  SW_SEl_add  
entity TD4 is
	port (
		CLK_MANUAl	:	in		std_logic;								--PUSH SW
		CLK_SEL		:	in		std_logic;								--PUSH SW
		CLK_50M		:	in		std_logic;								--IN CLOCK
		RST_n			:	in 	std_logic;								
		SW_2bit		:	in		std_logic_vector(1 downto 0);
		LED			:	out	std_logic_vector(7 downto 0)
	);
end TD4;

architecture RTL of TD4 is

component TC74HC153
	port (
		--Input
		G0_n	:	in 	std_logic;
		G1_n	:	in 	std_logic;
		G2_n	:	in 	std_logic;
		G3_n	:	in 	std_logic;	
		
		CA		:	in		std_logic_vector(3 downto 0);
		CB		:	in		std_logic_vector(3 downto 0);
		CC		:	in		std_logic_vector(3 downto 0);
		CD		:	in		std_logic_vector(3 downto 0);
		
		--selector
		SEL	    :	in 	std_logic_vector(1 downto 0);

		--Output
		Output	:	out 	std_logic_vector(3 downto 0)
	);
end component;

component TC74HC154
	port (
		--Input
		G_n		:	in 	std_logic_vector(1 downto 0);
		ADD		:	in		std_logic_vector(3 downto 0);

		Output	:	out 	std_logic_vector(15 downto 0)

	);
end component;

component TC74HC161
	port (
		CLR_n	:	in 	std_logic;
		LORD_n	:	in 	std_logic;
		data	:	in 	std_logic_vector(3 downto 0);
		CLK		:	in 	std_logic;
		ENT		:	in 	std_logic;
		ENP		:	in		std_logic;
		CO		:	out	std_logic;
		Q		:	out	std_logic_vector(3 downto 0)
	);
end component;

component CLK_RST
	port (
		CLK_MANUAL	    :	IN		STD_LOGIC;
		CLK_SEL		    :	IN		STD_LOGIC;
		CLK_50M		    :	IN		STD_LOGIC;
		CLK_O			:	OUT	STD_LOGIC;
		RST_SW_n		:	IN		STD_LOGIC;
		RST_n			:	OUT	STD_LOGIC
	);
end component;

component TC74HC74
	port (
		CLR1_n	    :	in 	std_logic;
		D1			:	in 	std_logic;
		CK1		    :	in 	std_logic;
		PR1_n		:	in 	std_logic;
		Q1			:	out 	std_logic;
		Q1_n		:	out 	std_logic;
		
		CLR2_n	    :	in 	std_logic;
		D2			:	in 	std_logic;
		CK2		    :	in 	std_logic;
		PR2_n		:	in 	std_logic;
		Q2			:	out 	std_logic;
		Q2_n		:	out	std_logic
	);
end component;

component TC74HC283
	port(
		A	: in 	std_logic_vector(3 downto 0);
		B 	: in 	std_logic_vector(3 downto 0);
		S 	: out std_logic_vector(3 downto 0);
		C 	: out std_logic 
	);
end component;

component TC74HC540
	port(
		G1_n	:	in		std_logic;
		G2_n	:	in		std_logic;
		A		:	in		std_logic_vector(7 downto 0);
		Y_n	    :	out	std_logic_vector(7 downto 0)
	);
end component;

component TRC
	port (
		D4			:	in		std_logic;
		D5			:	in		std_logic;
		D6			:	in		std_logic;
		D7			:	in		std_logic;
		Q_n		    :	in		std_logic;
		LOAD_n	    :	out	std_logic_vector(3 downto 0);
		DATA_SEL	:	out	std_logic_vector(1 downto 0)
	);
end component;

component ROM
	port (
		Addres	    :	in		std_logic_vector(15 downto 0);
		ROM_O		:	out 	std_logic_vector(7 downto 0)
	);
end component;

component LED_SEL
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
end component;

--for clock reset
signal clr_n		:	std_logic;
signal clk_t		:	std_logic;

-- for GND;
signal GND			:	std_logic	:='0';
signal HIGH			:	std_logic	:='1';
signal opn			:	std_logic	:='1';

--for Register
signal a_load_n	    :	std_logic;
signal b_load_n	    :	std_logic;
signal c_load_n	    :	std_logic;
signal d_load_n	    :	std_logic;
signal a_reg_out	:	std_logic_vector(3 downto 0);
signal b_reg_out	:	std_logic_vector(3 downto 0);
signal c_reg_out	:	std_logic_vector(3 downto 0);
signal d_reg_out	:	std_logic_vector(3 downto 0);
signal ent			:	std_logic:='0';
signal enp			:	std_logic:='0';
signal co			:	std_logic;

--for Data Selector
signal g_n			:	std_logic:='0';
signal d_sel		:	std_logic_vector(1 downto 0);
signal manual_in	:	std_logic_vector(3 downto 0);
signal c3_t			:	std_logic_vector(3 downto 0);
signal sel_out		:	std_logic_vector(3 downto 0);

--for addless decoder 
signal add_dec_out	:	std_logic_vector(15 downto 0);

--for D_FF
signal fowrd_com	:	std_logic;

--for adder
signal adder_c		:	std_logic;
signal adder_sum	:	std_logic_vector(3 downto 0);
signal imd_data	    :	std_logic_vector(3 downto 0);

--for baffer 
signal rom_in 		:	std_logic_vector(7 downto 0);
signal cmd_data	    :	std_logic_vector(7 downto 4);
signal baf_out		:	std_logic_vector(7 downto 0);

--for load_n
signal load_n		:	std_logic_vector(3 downto 0);

begin
	
	imd_data	<= baf_out(3 downto 0);
	cmd_data	<=	baf_out(7 downto 4);
	
	a_load_n 	<=	load_n(0);
	b_load_n 	<=	load_n(1);
	c_load_n 	<=	load_n(2);
	d_load_n 	<=	load_n(3);
	


	
	
	REG_A		:	TC74HC161 	port map(clr_n, a_load_n, adder_sum, clk_t, ent, enp, co, a_reg_out);
	REG_B		:	TC74HC161 	port map(clr_n, b_load_n, adder_sum, clk_t, ent, enp, co, b_reg_out);
	REG_C		:	TC74HC161 	port map(clr_n, c_load_n, adder_sum, clk_t, ent, enp, co, c_reg_out);
	REG_D		:	TC74HC161 	port map(clr_n, d_load_n, adder_sum, clk_t, ent, enp, co, d_reg_out);
	DATA_SEL	:	TC74HC153 	port map(g_n, g_n, g_n, g_n, a_reg_out, b_reg_out, manual_in, c3_t, d_sel, sel_out);
	ADD_DEC	:	TC74HC154 	port map((g_n & g_n), d_reg_out, add_dec_out);
	CLKRST	:	CLK_RST		port map(CLK_MANUAl, CLK_SEL, CLK_50M,	clk_t, RST_n, clr_n);
	D_FF		:	TC74HC74		port map(clr_n, adder_c, clk_t, High, opn, fowrd_com, GND, GND, GND, GND, opn, opn);
	FA			:	TC74HC283	port map(sel_out, imd_data, adder_sum, adder_c);
	BAFF		:	TC74HC540	port map(GND, GND, rom_in, baf_out);
	CMD_DEC	:	TRC			port map(cmd_data(4), cmd_data(5), cmd_data(6), cmd_data(7), fowrd_com, load_n, d_sel );
	P_ROM		:	ROM			port map(add_dec_out, rom_in);
	OUT_SEL	:	LED_SEL		port map(SW_2bit, clk_t, CLK_MANUAl, d_sel, c3_t, d_reg_out, load_n, d_reg_out, rom_in, "ZZZZ", LED );


	
	
end;
