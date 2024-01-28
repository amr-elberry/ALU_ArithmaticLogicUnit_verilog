module LOGIC_UNIT#(parameter alu_width =16)

(
  input wire [alu_width-1:0]  A,B,
  input wire                  clk,rst,
  input wire logic_enable,
  input wire [1:0]            alu_fun,
  output reg                  logic_flag,
  output reg [alu_width-1:0]  logic_out);
  
reg logic_out_reg;
reg logic_flag_reg;
always @ (posedge clk or negedge rst)
 begin 
   if (!rst)
     begin
      logic_out  <= 'b0 ;
      logic_flag <= 'b0 ;	
	 end
   else
     begin   
      logic_out  <= logic_out_reg ;
      logic_flag <= logic_flag_reg ;
	 end
 end	
 
always@(*)
begin
    logic_out_reg  = 1'b0  ;
    logic_flag_reg = 1'b0 ;
    if(logic_enable)
        begin
    case(alu_fun)  
    4'b00:begin
    logic_out_reg   = A&&B  ;
    logic_flag_reg  = 1'b1 ;
            end
            
    4'b01:begin
    logic_out_reg   = A||B  ;
    logic_flag_reg  = 1'b1 ;
           end
    4'b10:begin
    logic_out_reg   = !(A&&B) ;
    logic_flag_reg  = 1'b1 ;
            end
    4'b11:begin
    logic_out_reg   = !(A||B) ;
    logic_flag_reg  = 1'b1 ;
           end
          endcase
          end           //in combinational if no need else
end 

endmodule


