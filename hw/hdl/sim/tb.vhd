-- based on https://stackoverflow.com/questions/44809378/how-to-create-a-pseudo-random-sequence-with-a-16-bit-lfsr

library ieee;
use ieee.std_logic_1164.all;

entity rng_tb is
end entity;

architecture foo of rng_tb is
    signal sys_clk: std_logic := '1';
    signal reset_n: std_logic;
    signal lfsr_o : std_logic;
begin

    dut: entity work.lfsr
    generic map(
        SEED => x"A5A5"
    )
    port map(
        clk      => sys_clk,
        reset_n  => reset_n,
        rand_out => lfsr_o
    );  

    process
    begin
        sys_clk <= not sys_clk;
        wait for 5 ns;
    end process;

    reset_n <= '0' , '1' after 200 ns;

end architecture;