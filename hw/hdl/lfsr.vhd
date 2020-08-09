-- based on https://stackoverflow.com/questions/44809378/how-to-create-a-pseudo-random-sequence-with-a-16-bit-lfsr

library ieee;
use ieee.std_logic_1164.all;

entity lfsr is
   generic (seed : std_logic_vector(15 downto 0) := x"5A5A");
port (
	clk : in std_logic;
	reset_n : in std_logic; 
	rand_out : out std_logic	
);
end lfsr;

architecture behavioral of lfsr is
    signal q:             std_logic_vector(15 downto 0);
    signal n1, n2, n3:    std_logic;
begin
    process (clk)
    begin
        if rising_edge(clk) then
			if reset_n = '0' then 
				q <= seed;
			else
				-- REMOVED intermediary products as flip flops
				q <= q(14 downto 0) & n3;  -- REMOVED after 10 ns;
			end if;
        end if;
    end process;
    -- MOVED intermediary products to concurrent signal assignments:
    n1 <= q(15) xor q(13);
    n2 <= n1 xor q(11); --  REMOVED after 10 ns;
    n3 <= n2 xor q(10); --  REMOVED after 10 ns;

    rand_out <= q(0);
end architecture behavioral;




