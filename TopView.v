
module TOP_VIEW#(parameter alu_width =16)

(
  input wire [alu_width-1:0]    A,B,
  input wire                    clk,rst,
  input wire [3:0]              alu_fun,
  output wire                   arith_flag,carry_out,logic_flag,comp_flag,shift_flag,
  output wire [alu_width-1:0]   arith_out,logic_out,comp_out,shift_out
  );
  // internal connection
wire                  comp_enable ;
wire                  shift_enable ;
wire                  logic_enable ;
wire                  arith_enable ;
 
  DECODER_UNIT U_decoder(
  .alu_fun(alu_fun[3:2]),
  
  .arith_enable(arith_enable),
  .logic_enable(logic_enable),
  .shift_enable(shift_enable),
  .comp_enable(comp_enable)
  );
  
  ARITHMATIC_UNIT U_arithmatic(
  .A(A),
  .arith_enable(arith_enable),
  .B(B),
  .clk(clk),
  .rst(rst),
  .alu_fun(alu_fun[1:0]),
  .arith_out(arith_out),
  .arith_flag(arith_flag),
  .carry_out(carry_out),
  .arith_carry(arith_carry)
  );
  
   LOGIC_UNIT U_logic(
  .A(A),
  .logic_enable(logic_enable),
  .B(B),
  .clk(clk),
  .rst(rst),
  .alu_fun(alu_fun[1:0]),
  .logic_out(logic_out),
  .logic_flag(logic_flag)
   );
   
   comparsion_unit U_comp (
  .A(A),
  .comp_enable(comp_enable),
  .B(B),
  .clk(clk),
  .rst(rst),
  .alu_fun(alu_fun[1:0]),
  .comp_out(comp_out),
  .comp_flag(comp_flag)
  );
  
  shift_unit U_shift(
  .A(A),
  .shift_enable(shift_enable),
  .B(B),
  .clk(clk),
  .rst(rst),
  .alu_fun(alu_fun[1:0]),
  .shift_out(shift_out),
  .shift_flag(shift_flag)
  );
endmodule

