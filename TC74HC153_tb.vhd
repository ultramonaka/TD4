library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity TC74HC153_tb is
end TC74HC153_tb; 

architecture RTL of TC74HC153_tb is
        
--signal
signal  g0_n   :   std_logic;
signal  g1_n   :   std_logic;
signal  g2_n   :   std_logic;
signal  g3_n   :   std_logic;
signal  ca    :   std_logic_vector(3 downto 0);
signal  cb    :   std_logic_vector(3 downto 0);
signal  cc    :   std_logic_vector(3 downto 0);
signal  cd    :   std_logic_vector(3 downto 0);
signal  sel   :   std_logic_vector(1 downto 0);

       

component TC74HC153
    port (
        --Input
		G0_n		:	in 	std_logic;
		G1_n		:	in 	std_logic;
		G2_n		:	in 	std_logic;
		G3_n		:	in 	std_logic;	
		CA			:	in		std_logic_vector(3 downto 0);
		CB			:	in		std_logic_vector(3 downto 0);
		CC			:	in		std_logic_vector(3 downto 0);
		CD			:	in		std_logic_vector(3 downto 0);
		SEL		:	in 	std_logic_vector(1 downto 0);
		Output	:	out 	std_logic_vector(3 downto 0)
	);     
end component;



begin 
    COMP : TC74HC153 
		port map (
        g0_n   =>  G0_n,
        g1_n   =>  G1_n,
        g2_n   =>  G2_n,
        g3_n   =>  G3_n,
        ca	   =>  CA,
        cb    	=>  CB,
        cc    	=>  CC,
        cd    	=>  CD,
        sel	   =>  SEL
		);
    
    process
    begin
        g0_n   <= '0';
        g1_n   <= '0';
        g2_n   <= '0';
        g3_n   <= '0';
            
        ca    	<= "0001";
        cb    	<= "0010";
        cc    	<= "0100";
        cd		<= "1000";
    
        wait for 100 ps;
            sel <= "00";
		  wait for 100 ps;
            sel <= "01";
		  wait for 100 ps;
            sel <= "10";
		  wait for 100 ps;
            sel <= "11";
    end process;
end;
    
