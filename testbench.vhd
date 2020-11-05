  
-- ** Eduardo Pereira e Hêndrick Gonçalves 
-- ** VLSI 1 -- TP2
-- ** 2020/2

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity reg_bank_tb is

end reg_bank_tb;

architecture reg_bank_tb_architecture of reg_bank_tb is

signal clk_tb : std_logic := '0';
signal rst_tb : std_logic := '0';
signal wr_en_tb : std_logic := '0';
signal wr_address_tb : std_logic_vector(3 downto 0) := "0000";
signal wr_data_tb : std_logic_vector(7 downto 0) := x"00";
signal rd_en_tb : std_logic := '0';
signal rd_address_tb : std_logic_vector(3 downto 0) := "0000";
signal rd_data_tb : std_logic_vector(7 downto 0) := x"00";

signal delay_flag : std_logic := '0';
signal cnt_addr : std_logic_vector(3 downto 0) := "0000";

signal default_value_0 : std_logic_vector(7 downto 0) := x"32";
signal default_value_1 : std_logic_vector(7 downto 0) := x"30";
signal default_value_2 : std_logic_vector(7 downto 0) := x"31";
signal default_value_3 : std_logic_vector(7 downto 0) := x"37";
signal default_value_4 : std_logic_vector(7 downto 0) := x"30";
signal default_value_5 : std_logic_vector(7 downto 0) := x"39";
signal default_value_6 : std_logic_vector(7 downto 0) := x"06";
signal default_value_7 : std_logic_vector(7 downto 0) := x"07";
signal default_value_8 : std_logic_vector(7 downto 0) := x"08";
signal default_value_9 : std_logic_vector(7 downto 0) := x"09";
signal default_value_10 : std_logic_vector(7 downto 0) := x"0A";
signal default_value_11 : std_logic_vector(7 downto 0) := x"FF";

begin

    cuv: entity work.reg_bank
        port map (clk => clk_tb, rst => rst_tb, wr_en => wr_en_tb, wr_address => wr_address_tb, wr_data => wr_data_tb,
                rd_en => rd_en_tb, rd_address => rd_address_tb, rd_data => rd_data_tb);


	clk_tb <= not clk_tb after 10 ns;

    in_generator: process
    begin

        case(cnt_addr) is

            when "0000" => -- read only address
                if delay_flag = '0' then
                    wait for 100 ns;
                    delay_flag <= '1';
                end if;

                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test read only access 
                wr_data_tb <= x"00";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return the same value 
                wait for 20 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

                --assert(rd_data_tb = default_value_0) report "ERROR! Wrong default value.";
                assert(rd_data_tb /= wr_data_tb) report "ERROR! Not read only!"; -- if equal 

                wait for 20 ns;

            when "0001" => -- read only address
                
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test read only access 
                wr_data_tb <= x"01";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return the same value 
                wait for 20 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

                --assert(rd_data_tb = default_value_1) report "ERROR! Wrong default value.";
                assert(rd_data_tb /= wr_data_tb) report "ERROR! Not read only!"; -- if equal 

				wait for 20 ns;

            when "0010" => -- read only address

                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test read only access 
                wr_data_tb <= x"02";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return the same value 
                wait for 20 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

                --assert(rd_data_tb = default_value_2) report "ERROR! Wrong default value.";
                assert(rd_data_tb /= wr_data_tb) report "ERROR! Not read only!"; -- if equal 
                
                wait for 20 ns;

            when "0011" => -- read only address
            
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test read only access 
                wr_data_tb <= x"03";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return the same value 
                wait for 20 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

                --assert(rd_data_tb = default_value_3) report "ERROR! Wrong default value.";
                assert(rd_data_tb /= wr_data_tb) report "ERROR! Not read only!"; -- if equal 
            
				wait for 20 ns;
            
            when "0100" => -- read only address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test read only access 
                wr_data_tb <= x"04";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return the same value 
                wait for 20 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

                --assert(rd_data_tb = default_value_4) report "ERROR! Wrong default value.";
                assert(rd_data_tb /= wr_data_tb) report "ERROR! Not read only!"; -- if equal 
                
                wait for 20 ns;

            when "0101" => -- read only address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test read only access 
                wr_data_tb <= x"05";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return the same value 
                wait for 20 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

                --assert(rd_data_tb = default_value_5) report "ERROR! Wrong default value.";
                assert(rd_data_tb /= wr_data_tb) report "ERROR! Not read only!"; -- if equal 

				wait for 20 ns;

            when "0110" => -- r/w address

                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"A6";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_6)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_6)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_6) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;

				wait for 20 ns;

            when "0111" => -- r/w address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"A7";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_7)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_7)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 25 ns;
                assert(rd_data_tb = default_value_7) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1000" => -- r/w address

                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"A8";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_8)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_8)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 25 ns;
                assert(rd_data_tb = default_value_8) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;
                

            when "1001" => -- r/w address

                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"A9";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_9)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_9)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_9) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1010" => -- r/w address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"AA";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_10)) report "ERROR! Write not enable!"; -- se nao for igual ao valor de write e se for igual ao default value, não escreveu nada
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_10)) report "ERROR! Writing wrong value!";  -- se nao for igual ao valor de write e se for diferente ao default value, escreveu algo errado
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value
                wait for 15 ns; 
                assert(rd_data_tb = default_value_10) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1011" => -- r/w address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"AB";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_11)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_11)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_11) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1100" => -- r/w address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"AC";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_11)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_11)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_11) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1101" => -- r/w address 
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"AD";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
				wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_11)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_11)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_11) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1110" => -- r/w address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"AE";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value 
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_11)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_11)) report "ERROR! Writing wrong value!"; 
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_11) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= cnt_addr + 1;
                
                wait for 20 ns;

            when "1111" => -- r/w address
                rd_address_tb <= cnt_addr;
                rd_en_tb <= '1'; 
                wait for 20 ns;
                rd_en_tb <= '0'; 
                wait for 20 ns;

                wr_address_tb <= cnt_addr; -- test r/w access 
                wr_data_tb <= x"AF";
                wr_en_tb <= '1';
                wait for 20 ns;
                wr_en_tb <= '0';
                wait for 20 ns;

                rd_en_tb <= '1'; -- should return a different value
                wait for 20 ns;
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb /= default_value_11)) report "ERROR! Write not enable!"; 
                assert((rd_data_tb = wr_data_tb) or (rd_data_tb = default_value_11)) report "ERROR! Writing wrong value!";  
                wait for 5 ns;
                rd_en_tb <= '0'; 

                rst_tb <= '1';
                wait for 20 ns;
                rst_tb <= '0';
                rd_en_tb <= '1'; -- should return the default value 
                wait for 15 ns;
                assert(rd_data_tb = default_value_11) report "ERROR! Reset error!";
                wait for 5 ns;
                rd_en_tb <= '0'; 

                cnt_addr <= "0000";
                
                wait for 20 ns;
            when others =>
                cnt_addr <= "0000";
                rd_en_tb <= '0'; 
                rst_tb <= '0';
                wr_en_tb <= '0';

        end case;

    end process in_generator;



end reg_bank_tb_architecture;
