library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity THREE_INPUT_NAND_GATE is
   port( A, B ,C : in std_logic;
            D : out std_logic);
end THREE_INPUT_NAND_GATE;


architecture THREE_INPUT_NAND_GATE_ARCHITECTURE of THREE_INPUT_NAND_GATE is 


begin
   D <= NOT(A AND B AND C);
end THREE_INPUT_NAND_GATE_ARCHITECTURE;
