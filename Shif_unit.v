module shift_unit#(parameter alu_width =16)

(
  input wire [alu_width-1:0]  A,B,
  input wire                  clk,rst,
  input wire                shift_enable,
  input wire [1:0]            alu_fun,
  output reg                  shift_flag,
  output reg [alu_width-1:0]  shift_out);
reg [alu_width-1:0]  shift_out_reg ;
reg shift_flag_reg ;
 
always @ (posedge clk or negedge rst)
 begin 
   if (!rst)
     begin
      shift_out  <= 'b0 ;
      shift_flag <= 'b0 ;	
	 end
   else
     begin   
      shift_out  <= shift_out_reg ;
      shift_flag <= shift_flag_reg ;
	 end
 end
 
   always@(*)
begin
        shift_out_reg = 1'b0;
        shift_flag_reg = 1'b0;
      if(shift_enable)
        begin
      case(alu_fun)  
        4'b00:begin
        shift_flag_reg = 1'b1;
        shift_out_reg = A >> 1;
        end
        4'b01:begin
        shift_out_reg = A << 1;
        shift_flag_reg = 1'b1;
        end
        4'b10:begin
        shift_flag_reg = 1'b1;
        shift_out_reg = B >> 1;
         end
        4'b11:begin
        shift_flag_reg = 1'b1;
        shift_out_reg = B << 1;
        end
      endcase
end
end 

endmodule



