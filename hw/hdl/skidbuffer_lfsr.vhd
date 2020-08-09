-- sikdbuffer with an LFSR for gating the slave port

library ieee;
use ieee.std_logic_1164.all;

entity skidbuffer_lfsr is
  generic (
    DW         : natural := 32;
    OPT_OUTREG : boolean := True;
    -- LFSR enablers
    S_LFSR : boolean := True;
    -- LFSR seeds
    S_SEED : std_logic_vector(15 downto 0) := x"ABCD"
    );
  port (
     clock     : in  std_logic;
     reset_n   : in  std_logic;

     s_valid_i : in  std_logic;
     s_last_i  : in  std_logic;
     s_ready_o : out std_logic;
     s_data_i  : in  std_logic_vector(DW - 1 downto 0);

     m_valid_o : out std_logic;
     m_last_o  : out std_logic;
     m_ready_i : in  std_logic;
     m_data_o  : out std_logic_vector(DW - 1 downto 0));
end skidbuffer_lfsr;

architecture skidbuffer_lfsr of skidbuffer_lfsr is
  signal s_valid_s, s_ready_s, s_last_s, s_lfsr_o : std_logic;
begin

  -- logic to generete the LFSR for the slave port
  not_s_lfsr_block : if not S_LFSR generate
    s_valid_s <= s_valid_i;
    s_ready_o <= s_ready_s;
    s_last_s  <= s_last_i ;
  end generate not_s_lfsr_block;  

  s_lfsr_block : if S_LFSR generate
    slave_lfsr: entity work.lfsr
    generic map(
      SEED => S_SEED
    )
    port map(
      clk      => clock,
      reset_n  => reset_n,
      rand_out => s_lfsr_o
    );

    s_valid_s <= s_valid_i and s_lfsr_o;
    s_ready_o <= s_ready_s and s_lfsr_o;
    s_last_s  <= s_last_i  and s_lfsr_o;
  end generate s_lfsr_block;  

  skid: entity work.skidbuffer
  generic map(
    DW => DW,
    OPT_OUTREG => OPT_OUTREG
  )
  port map ( 
    clock     => clock,
    reset_n   => reset_n,
    -- axi slave streaming interface
    s_valid_i => s_valid_s,
    s_ready_o => s_ready_s,
    s_last_i  => s_last_s,
    s_data_i  => s_data_i,
    -- axi master streaming interface
    m_valid_o => m_valid_o,
    m_ready_i => m_ready_i,
    m_last_o  => m_last_o,
    m_data_o  => m_data_o
  );

end skidbuffer_lfsr;
