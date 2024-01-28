module ARITHMATIC_UNIT#(parameter alu_width =16)

(
  input wire [alu_width-1:0]  A,B,
  input wire                  clk,rst,
  input wire arith_enable,
  input wire [1:0]            alu_fun,
  output reg                  arith_carry,
  output reg                  arith_flag,carry_out,
  output reg [alu_width-1:0]  arith_out);
  
reg [alu_width-1:0] arith_out_reg;
wire carry_out_reg;
reg arith_flag_reg;  

always@(posedge clk or negedge rst)
begin
  if(!rst)
    begin
    arith_out <= 16'b0;
    carry_out <= 16'b0;
    arith_flag <= 16'b0;
    end
  else
   begin
    arith_out <= arith_out_reg;
    carry_out <= carry_out_reg;
    arith_flag <= arith_flag_reg;
   end 
      
end

always@(*)
  begin
    arith_out_reg   = 1'b0  ;
    arith_flag_reg  = 1'b0 ;
      if(arith_enable)
        begin
    case(alu_fun)  
    4'b00:begin
    arith_out_reg   = A+B  ;
    arith_flag_reg  = 1'b1 ;
            end
            
    4'b01:begin
    arith_out_reg   = A-B  ;
    arith_flag_reg  = 1'b1 ;
           end
    4'b10:begin
    arith_out_reg   = A*B  ;
    arith_flag_reg  = 1'b1 ;
            end
    4'b11:begin
    arith_out_reg   = A/B  ;
    arith_flag_reg  = 1'b1 ;
           end
          endcase
          end   //in combinational if no need else 
end
assign carry_out_reg = arith_out_reg[alu_width] ;
endmodule


