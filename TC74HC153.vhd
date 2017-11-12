library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TC74HC153 is
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
		SEL	:	in 	std_logic_vector(1 downto 0);

		--Output
		Output	:	out 	std_logic_vector(3 downto 0)
	);
end TC74HC153;



architecture RTL of TC74HC153 is

--component
component multiplexer
	port (
		G_n		:	in 	std_logic;
		DATA	:	in 	std_logic_vector(3 downto 0);
		SEL		:	in 	std_logic_vector(1 downto 0);
		Y		:	out	std_logic
	);
end component;

--signal

signal		G0_n_t	:	std_logic;
signal		G1_n_t	:	std_logic;
signal		G2_n_t	:	std_logic;
signal		G3_n_t	:	std_logic;							

signal		C0_t	:	std_logic_vector(3 downto 0);
signal		C1_t	:	std_logic_vector(3 downto 0);
signal		C2_t	:	std_logic_vector(3 downto 0);
signal		C3_t	:	std_logic_vector(3 downto 0);

		--selector
signal		SEL_t	:	std_logic_vector(1 downto 0);

		--Output
signal		Y0_t	:	std_logic;
signal		Y1_t	:	std_logic;
signal		Y2_t	:	std_logic;
signal		Y3_t	:	std_logic;


begin
	C0_t <= CA(0) & CB(0) & CC(0) & CD(0);
	C1_t <= CA(1) & CB(1) & CC(1) & CD(1);
	C2_t <= CA(2) & CB(2) & CC(2) & CD(2);
	C3_t <= CA(3) & CB(3) & CC(3) & CD(3);
    
   SEL_t <= SEL;
	
	COMP0 : multiplexer port map(G0_n, C0_t, SEL_t, Y0_t);
	COMP1 : multiplexer port map(G1_n, C1_t, SEL_t, Y1_t);
	COMP2 : multiplexer port map(G2_n, C2_t, SEL_t, Y2_t);
	COMP3 : multiplexer port map(G3_n, C3_t, SEL_t, Y3_t);
    
   Output <= Y3_t & Y2_t & Y1_t& Y0_t;   


end RTL;




