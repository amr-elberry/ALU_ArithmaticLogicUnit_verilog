
module comparsion_unit#(parameter alu_width =16)
(
  input wire [alu_width-1:0]  A,B,
  input wire                  clk,rst,
  input wire comp_enable,
  input wire [1:0]            alu_fun,
  output reg                  comp_flag,
  output reg [alu_width-1:0]  comp_out);

reg comp_out_reg ;
reg  comp_flag_reg ;

always @ (posedge clk or negedge rst)
 begin 
   if (!rst)
     begin
      comp_out  <= 'b0 ;
      comp_flag <= 'b0 ;	
	 end
   else
     begin   
      comp_out  <= comp_out_reg ;
      comp_flag <= comp_flag_reg ;
	 end
 end
 
always@(*)
    begin
      comp_out_reg = 1'b0;
      comp_flag_reg = 1'b0;
      
      if(comp_enable)
        begin
  case(alu_fun)
    
      4'b00:begin
      comp_out_reg = 1'b0;
      comp_flag_reg = 1'b1;
      end 
      4'b01:begin
        comp_flag_reg  = 1'b1;
        if(A==B)
           begin
    comp_out_reg = 1'b1;
    
          end
       else
          begin
    comp_out_reg   = 1'b0;
          end
        end
          
    4'b10:begin
      comp_flag_reg  = 1'b1 ;
      if(A > B)
        begin
    comp_out_reg   = 1'b1;
    
        end
    else
        begin
    comp_out_reg   = 1'b0;
        end
        end
  
          
    4'b11:begin
      comp_flag_reg  = 1'b1;
      if(A < B)
          begin
    comp_out_reg   = 16'b1;
          end
    else
          begin
    comp_out_reg   = 1'b0;

          end
      end
   endcase
          end
    //no need else on sequantion if
   end

  endmodule
  
          
