module DECODER_UNIT

(input wire [1:0]            alu_fun,
output reg arith_enable,logic_enable,comp_enable,shift_enable);

 
  
  always@(*)
  begin
    arith_enable = 1'b0;
    logic_enable = 1'b0;
    comp_enable = 1'b0;
    shift_enable = 1'b0;
    case(alu_fun)
      4'b00:arith_enable = 1'b1;
      4'b01:logic_enable = 1'b1;
      4'b10:comp_enable = 1'b1;
      4'b11:shift_enable = 1'b1;
      default: begin
            arith_enable = 1'b0;
            logic_enable = 1'b0;
            comp_enable =1'b 0;
            shift_enable = 1'b0;
        end
      endcase
  end
endmodule



