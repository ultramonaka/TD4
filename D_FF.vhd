library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity D_FF is
	port (
		CLR_n		:	in 	std_logic;
		D			:	in 	std_logic;
		CK			:	in 	std_logic;
		PR_n		:	in 	std_logic;
		Q			:	out 	std_logic;
		Q_n		:	out 	std_logic
	);
end D_FF;

architecture RTL of D_FF is

signal q_t		:	std_logic;
signal q_n_t	:	std_logic;

begin
	process (CK, CLR_n, PR_n, D)
	begin
		--non sync
		if (CLR_n = '0') then
			if (PR_n = '1') then						--(CLR_n, PR_n) = (0, 1) Clear
				q_t	<=		'0';
				q_n_t	<=		'1';
			elsif(PR_n = '0') then					--(CLR_n, PR_n) = (0, 0) Out H
				q_t	<=		'1';
				q_n_t	<=		'1';
			end if;
		elsif (CLR_n = '1') then
			if (PR_n = '0') then						--(CLR_n, PR_n) = (1, 0) Preset
				q_t	<=		'1';
				q_n_t	<=		'0';
			elsif(CK'event and CK = '1' ) then	--(CLR_n, PR_n) = (1, 1) Data input
				if (PR_n ='1') then
					q_t	<=		D;
					q_n_t	<=		not D;
				end if;
			end if;
		end if;
		
		Q		<=	q_t;
		Q_n	<=	q_n_t;
		
	end process;

end;
