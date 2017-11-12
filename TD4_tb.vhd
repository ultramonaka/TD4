library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity TD4_tb is
end entity;





architecture RTL of TD4_tb is


signal	clk_manual	:	std_logic;
signal	clk_sel 	:	std_logic;
signal	clk_50m 	:	std_logic;
signal	rst_n 		:	std_logic;
signal	sw_2bit 	:	std_logic_vector(1 downto 0);
signal	clk_led 	:	std_logic;
signal	led_o 		:	std_logic_vector(3 downto 0);
signal	p_rom_led 	:	std_logic_vector(7 downto 0);


component TD4
	port (
		CLK_MANUAl	:	in	std_logic;								--PUSH SW
		CLK_SEL		:	in	std_logic;								--PUSH SW
		CLK_50M		:	in	std_logic;								--IN CLOCK
		RST_n		:	in	std_logic;
		SW_2bit		:	in	std_logic_vector(1 downto 0);
		LED		:	out	std_logic_vector(7 downto 0)
	);
end component;



begin
	comp : TD4
		port map(
			clk_manual 	=> 	CLK_MANUAl,
			clk_sel 	=> 	CLK_SEL,
			clk_50m 	=> 	CLK_50M,
			rst_n 		=> 	RST_n,
			sw_2bit 	=> 	SW_2bit

		);
	process
	begin
		clk_sel	    <= '1';
        clk_manual  <= '0';
		clk_50m     <= '0';
		rst_n 	    <= '0';
		sw_2bit     <= "00";
        
        wait for 50 ps;
        clk_manual  <= '1';
        rst_n       <= '1';
        wait for 50 ps;
        clk_manual  <= '0';
        rst_n       <= '0';

        wait for 50 ps;
        clk_manual  <= '1';
        wait for 50 ps;
        clk_manual  <= '0';


		wait for 50 ps;
			rst_n   <= '1';

        loop
            wait for 50ps;
                clk_manual <= '1';
            wait for 50ps;
                clk_manual <= '0';
        end loop;
    end process;
        
   

end RTL;
