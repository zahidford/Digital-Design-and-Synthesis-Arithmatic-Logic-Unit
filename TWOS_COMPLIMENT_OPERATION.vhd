library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity TWOS_COMPLIMENT is
port

( input_a : in std_logic_vector (7 downto 0);
  clk : in std_logic;
  twos_complimented_bit : out std_logic_vector (7 downto 0)
);
end TWOS_COMPLIMENT;

architecture TWOS_COMPLIMENT_ARCHITECTURE of TWOS_COMPLIMENT is

component D_FLIP_FLOP
port(
D,clk : in  STD_LOGIC;

Q,QBAR : out STD_LOGIC);

end component;

component HALF_ADDER
port
(
in_a : in std_logic;
in_b : in std_logic;
carryout : out std_logic;
sum : out std_logic
);
end component;

component TWO_INPUT_XOR_GATE
port
(
 a : in std_logic;
 b : in std_logic;
 c : out std_logic
);
end component;
signal  register_out : std_logic_vector (7 downto 0);
signal  register_out_bar : std_logic_vector (7 downto 0);
signal  ones_compliment : std_logic_vector (6 downto 0);
signal  carry_twos_compliment : std_logic_vector (5 downto 0);

begin

--register_load
LOADING_REGISTER_U1 : D_FLIP_FLOP port map (input_a(0),clk,register_out(0),register_out_bar(0));
LOADING_REGISTER_U2 : D_FLIP_FLOP port map (input_a(1),clk,register_out(1),register_out_bar(1));
LOADING_REGISTER_U3 : D_FLIP_FLOP port map (input_a(2),clk,register_out(2),register_out_bar(2));
LOADING_REGISTER_U4 : D_FLIP_FLOP port map (input_a(3),clk,register_out(3),register_out_bar(3));
LOADING_REGISTER_U5 : D_FLIP_FLOP port map (input_a(4),clk,register_out(4),register_out_bar(4));
LOADING_REGISTER_U6 : D_FLIP_FLOP port map (input_a(5),clk,register_out(5),register_out_bar(5));
LOADING_REGISTER_U7 : D_FLIP_FLOP port map (input_a(6),clk,register_out(6),register_out_bar(6));
LOADING_REGISTER_U8 : D_FLIP_FLOP port map (input_a(7),clk,register_out(7),register_out_bar(7));

--ones compliment
ONES_COMPLIMENT_U1 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(0), ones_compliment(0)); 

ONES_COMPLIMENT_U2 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(1), ones_compliment(1)); 

ONES_COMPLIMENT_U3 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(2), ones_compliment(2)); 

ONES_COMPLIMENT_U4 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(3), ones_compliment(3)); 

ONES_COMPLIMENT_U5 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(4), ones_compliment(4)); 

ONES_COMPLIMENT_U6 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(5), ones_compliment(5)); 

ONES_COMPLIMENT_U7 : TWO_INPUT_XOR_GATE port map (register_out(7), register_out(6), ones_compliment(6)); 


TWOS_COMPLIMENT_U1 : HALF_ADDER port map ( ones_compliment(0),register_out(7),carry_twos_compliment(0),twos_complimented_bit(0));
TWOS_COMPLIMENT_U2 : HALF_ADDER port map ( ones_compliment(1),carry_twos_compliment(0),carry_twos_compliment(1),twos_complimented_bit(1));
TWOS_COMPLIMENT_U3 : HALF_ADDER port map ( ones_compliment(2),carry_twos_compliment(1),carry_twos_compliment(2),twos_complimented_bit(2));
TWOS_COMPLIMENT_U4 : HALF_ADDER port map ( ones_compliment(3),carry_twos_compliment(2),carry_twos_compliment(3),twos_complimented_bit(3));
TWOS_COMPLIMENT_U5 : HALF_ADDER port map ( ones_compliment(4),carry_twos_compliment(3),carry_twos_compliment(4),twos_complimented_bit(4));
TWOS_COMPLIMENT_U6 : HALF_ADDER port map ( ones_compliment(5),carry_twos_compliment(4),carry_twos_compliment(5),twos_complimented_bit(5));
TWOS_COMPLIMENT_U7 : HALF_ADDER port map ( ones_compliment(6),carry_twos_compliment(5),twos_complimented_bit(7),twos_complimented_bit(6));

end TWOS_COMPLIMENT_ARCHITECTURE;
