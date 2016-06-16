-- VHDL netlist generated by SCUBA Diamond_1.4_Production (87)
-- Module  Version: 1.0

-- Tue May 08 13:20:29 2012
--
-- Copyright (c) 2012  te
--
-----------------------------------------------------------------------

library ieee;                 use ieee.std_logic_1164.all;
library work;                 use work.defs.all;
library MACHXO2;              use MACHXO2.components.all;

entity efbx is
    port (
        wb_clk_i  : in    std_logic;
        wb_rst_i  : in    std_logic;
        wb_cyc_i  : in    std_logic;
        wb_stb_i  : in    std_logic;
        wb_we_i   : in    std_logic;
        wb_adr_i  : in    std_logic_vector(7 downto 0);
        wb_dat_i  : in    std_logic_vector(7 downto 0);
        wb_dat_o  : out   std_logic_vector(7 downto 0);
        wb_ack_o  : out   std_logic;
        i2c1_scl  : inout std_logic;
        i2c1_sda  : inout std_logic;
        i2c1_irqo : out   std_logic       );
end efbx;

architecture struct of efbx is

  signal scuba_vhi, scuba_vlo,
         i2c1_sdao, i2c1_sdaoen,
         i2c1_sclo, i2c1_scloen,
         i2c1_sdai, i2c1_scli     : std_logic;

  -------------------------------------------------
  component VHI
      port (Z: out  std_logic);
  end component;

  -------------------------------------------------
  component VLO
      port (Z: out  std_logic);
  end component;

  -------------------------------------------------
  component BB
    port (I: in  std_logic; T: in  std_logic; O: out  std_logic;
          B: inout  std_logic);
  end component;

begin

    scuba_vhi_inst: VHI port map (Z=>scuba_vhi);
    scuba_vlo_inst: VLO port map (Z=>scuba_vlo);

    BB1_sda: BB port map (I=>i2c1_sdao, T=>i2c1_sdaoen, O=>i2c1_sdai,
                          B=>i2c1_sda);

    BB1_scl: BB port map (I=>i2c1_sclo, T=>i2c1_scloen, O=>i2c1_scli,
                          B=>i2c1_scl);

    EFBInst_0: EFB
      generic map (
        EFB_I2C1              => "ENABLED",
        EFB_I2C2              => "DISABLED",
        EFB_SPI               => "DISABLED",
        EFB_TC                => "ENABLED",
        EFB_TC_PORTMODE       => "WB",
        EFB_UFM               => "ENABLED",
        EFB_WB_CLK_FREQ       => "27.0",

        UFM_INIT_FILE_FORMAT  => "HEX",
        UFM_INIT_FILE_NAME    => "NONE",
        UFM_INIT_ALL_ZEROS    => "ENABLED",
        UFM_INIT_START_PAGE   =>  0,
        UFM_INIT_PAGES        =>  0,
        DEV_DENSITY           => DEVICE_DENSITY,  -- in defs

        GSR                   => "ENABLED",
        TC_ICAPTURE           => "DISABLED",
        TC_OVERFLOW           => "DISABLED",
        TC_ICR_INT            => "OFF",
        TC_OCR_INT            => "OFF",
        TC_OV_INT             => "OFF",
        TC_TOP_SEL            => "ON",
        TC_RESETN             => "ENABLED",         -- used in debug mode only
        TC_OC_MODE            => "WAVE_GENERATOR",
        TC_OCR_SET            =>  27,               -- 28-1
        TC_TOP_SET            =>  65,               -- 66-1.....
        TC_CCLK_SEL           =>  1,
        TC_MODE               => "FASTPWM",
        TC_SCLK_SEL           => "PCLOCK",

        SPI_WAKEUP            => "DISABLED",
        SPI_INTR_RXOVR        => "DISABLED",
        SPI_INTR_TXOVR        => "DISABLED",
        SPI_INTR_RXRDY        => "DISABLED",
        SPI_INTR_TXRDY        => "DISABLED",
        SPI_SLAVE_HANDSHAKE   => "DISABLED",
        SPI_PHASE_ADJ         => "DISABLED",
        SPI_CLK_INV           => "DISABLED",
        SPI_LSB_FIRST         => "DISABLED",
        SPI_CLK_DIVIDER       =>  1,
        SPI_MODE              => "MASTER",

        I2C2_WAKEUP           => "DISABLED",
        I2C2_GEN_CALL         => "DISABLED",
        I2C2_CLK_DIVIDER      =>  1,
        I2C2_BUS_PERF         => "100kHz",
        I2C2_SLAVE_ADDR       => "0b0011001",
        I2C2_ADDRESSING       => "7BIT",

        I2C1_WAKEUP           => "DISABLED",
        I2C1_GEN_CALL         => "DISABLED",
        I2C1_CLK_DIVIDER      =>  17,
        I2C1_BUS_PERF         => "400kHz",
        I2C1_SLAVE_ADDR       => "0b1000001",
        I2C1_ADDRESSING       => "7BIT"       )
      port map (
        WBCLKI      => wb_clk_i,
        WBRSTI      => wb_rst_i,
        WBCYCI      => wb_cyc_i,
        WBSTBI      => wb_stb_i,
        WBWEI       => wb_we_i,
        WBADRI7     => wb_adr_i(7),
        WBADRI6     => wb_adr_i(6),
        WBADRI5     => wb_adr_i(5),
        WBADRI4     => wb_adr_i(4),
        WBADRI3     => wb_adr_i(3),
        WBADRI2     => wb_adr_i(2),
        WBADRI1     => wb_adr_i(1),
        WBADRI0     => wb_adr_i(0),
        WBDATI7     => wb_dat_i(7),
        WBDATI6     => wb_dat_i(6),
        WBDATI5     => wb_dat_i(5),
        WBDATI4     => wb_dat_i(4),
        WBDATI3     => wb_dat_i(3),
        WBDATI2     => wb_dat_i(2),
        WBDATI1     => wb_dat_i(1),
        WBDATI0     => wb_dat_i(0),
        PLL0DATI7   => scuba_vlo,
        PLL0DATI6   => scuba_vlo,
        PLL0DATI5   => scuba_vlo,
        PLL0DATI4   => scuba_vlo,
        PLL0DATI3   => scuba_vlo,
        PLL0DATI2   => scuba_vlo,
        PLL0DATI1   => scuba_vlo,
        PLL0DATI0   => scuba_vlo,
        PLL0ACKI    => scuba_vlo,
        PLL1DATI7   => scuba_vlo,
        PLL1DATI6   => scuba_vlo,
        PLL1DATI5   => scuba_vlo,
        PLL1DATI4   => scuba_vlo,
        PLL1DATI3   => scuba_vlo,
        PLL1DATI2   => scuba_vlo,
        PLL1DATI1   => scuba_vlo,
        PLL1DATI0   => scuba_vlo,
        PLL1ACKI    => scuba_vlo,
        I2C1SCLI    => i2c1_scli,
        I2C1SDAI    => i2c1_sdai,
        I2C2SCLI    => scuba_vlo,
        I2C2SDAI    => scuba_vlo,
        SPISCKI     => scuba_vlo,
        SPIMISOI    => scuba_vlo,
        SPIMOSII    => scuba_vlo,
        SPISCSN     => scuba_vlo,

        TCCLKI      => wb_clk_i,
        TCRSTN      => "not"(wb_rst_i),   -- resets internal 16-bit clock
        TCIC        => '0',               -- input capture trigger event

        UFMSN       => scuba_vhi,
        WBDATO7     => wb_dat_o(7),
        WBDATO6     => wb_dat_o(6),
        WBDATO5     => wb_dat_o(5),
        WBDATO4     => wb_dat_o(4),
        WBDATO3     => wb_dat_o(3),
        WBDATO2     => wb_dat_o(2),
        WBDATO1     => wb_dat_o(1),
        WBDATO0     => wb_dat_o(0),
        WBACKO      => wb_ack_o,
        PLLCLKO     => open,
        PLLRSTO     => open,
        PLL0STBO    => open,
        PLL1STBO    => open,
        PLLWEO      => open,
        PLLADRO4    => open,
        PLLADRO3    => open,
        PLLADRO2    => open,
        PLLADRO1    => open,
        PLLADRO0    => open,
        PLLDATO7    => open,
        PLLDATO6    => open,
        PLLDATO5    => open,
        PLLDATO4    => open,
        PLLDATO3    => open,
        PLLDATO2    => open,
        PLLDATO1    => open,
        PLLDATO0    => open,
        I2C1SCLO    => i2c1_sclo,
        I2C1SCLOEN  => i2c1_scloen,
        I2C1SDAO    => i2c1_sdao,
        I2C1SDAOEN  => i2c1_sdaoen,
        I2C2SCLO    => open,
        I2C2SCLOEN  => open,
        I2C2SDAO    => open,
        I2C2SDAOEN  => open,
        I2C1IRQO    => i2c1_irqo,
        I2C2IRQO    => open,
        SPISCKO     => open,
        SPISCKEN    => open,
        SPIMISOO    => open,
        SPIMISOEN   => open,
        SPIMOSIO    => open,
        SPIMOSIEN   => open,
        SPIMCSN7    => open,
        SPIMCSN6    => open,
        SPIMCSN5    => open,
        SPIMCSN4    => open,
        SPIMCSN3    => open,
        SPIMCSN2    => open,
        SPIMCSN1    => open,
        SPIMCSN0    => open,
        SPICSNEN    => open,
        SPIIRQO     => open,

        TCINT       => open,
        TCOC        => open,

        WBCUFMIRQ   => open,
        CFGWAKE     => open,
        CFGSTDBY    => open  );

end struct;
