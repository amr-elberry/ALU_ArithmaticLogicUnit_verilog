//time scale
`timescale 1us/1ns


//declare test bench signal
module ALU_16bitLast44_TB#(parameter alu_width =16)();
 reg [alu_width-1:0]    A_tb;
 reg [alu_width-1:0]    B_tb;
 reg                    clk_tb;
 reg                    rst_tb;
 reg [3:0]              alu_fun_tb;

 wire                   arith_flag_tb;
 wire                   logic_flag_tb;
 wire                   carry_out;
 wire                   comp_flag_tb;
 wire                   shift_flag_tb;
 wire [alu_width-1:0]   logic_out_tb;
 wire [alu_width-1:0]   comp_out_tb;
 wire [alu_width-1:0]   shift_out_tb;
 wire [alu_width-1:0]   arith_out_tb;
 // instantiation
 TOP_VIEW DUT(
  .A(A_tb),
  .B(B_tb),
  .clk(clk_tb),
  .rst(rst_tb),
  .alu_fun(alu_fun_tb),
  .arith_out(arith_out_tb),
  .carry_out(carry_out_tb),
  .arith_flag(arith_flag_tb),
  .logic_out(logic_out_tb),
  .logic_flag(logic_flag_tb),
  .comp_out(comp_out_tb),
  .comp_flag(comp_flag_tb),
  .shift_out(shift_out_tb),
  .shift_flag(shift_flag_tb)

  
 );
 
   //clock generator
always begin
  #4
  clk_tb=1'b1;
  #6
  clk_tb=1'b0;
end
//intial block
initial
begin
  $dumpfile("ALU_16bit");
  $dumpvars;
A_tb =  16'b1111 ;
B_tb = 16'b0 ;
rst_tb = 1'b1;
alu_fun_tb = 4'b0000;
clk_tb  = 1'b0 ;

/*************tests**************************************/
$display("test cases_1");
#3
A_tb =   16'b1111;
B_tb = 16'b0;
alu_fun_tb = 4'b0000;


#7
if(arith_flag_tb== 1'b1 && arith_out_tb==16'b1111)
  $display("test 1 pass");
else
  $display("test 1 failed");
/*************************************************************/
$display("test cases_2");
#3
A_tb =   16'b1111;
B_tb = 16'b0;
alu_fun_tb = 4'b0001;

#7
if(arith_flag_tb== 1'b1 && arith_out_tb==16'b1111)
  $display("test 2 pass");
else
  $display("test 2 failed");
  /****************************************************************/
  $display("test cases_3");
#3
A_tb =   16'b1111;
B_tb = 16'b0;
alu_fun_tb = 4'b0010;

#7
if(arith_flag_tb== 1'b1 && arith_out_tb==16'b0)
  $display("test 3 pass");
else
  $display("test 3 failed"); 
   /****************************************************************/
   $display("test cases_4");
 
#3
A_tb =   16'b1111;
B_tb = 16'b1;
alu_fun_tb = 4'b0011;

#7
if(arith_flag_tb== 1'b1 && arith_out_tb==16'b1111)
  $display("test 4 pass");
else
  $display("test 4 failed");
  /******************************************************************/

  /******************************************************************/
    $display("test cases_5");
#3
A_tb = 16'b010101;
B_tb = 16'b110110;
alu_fun_tb = 4'b0111;

#7
if(logic_out_tb== 16'b1000 && logic_flag_tb==1'b1)
  $display("test 5 pass");
else
  $display("test 5 failed");
      /******************************************************************/
    $display("test cases_6");
#3
A_tb =   16'b1101;
B_tb = 16'b1001;
alu_fun_tb = 4'b1000;

#7
if(comp_out_tb== 16'b0 && comp_flag_tb==1'b1)
  $display("test 6 pass");
else
  $display("test 6 failed");
        /******************************************************************/
    $display("test cases_7");
#3
A_tb =   16'b1111;
B_tb = 16'b1111;
alu_fun_tb = 4'b1001;

#7
if(comp_out_tb== 16'b1 && comp_flag_tb==1'b1)
  $display("test 7 pass");
else
  $display("test 7 failed");
        /******************************************************************/
    $display("test cases_8");
#3
A_tb =   16'b0111;
B_tb = 16'b1111;
alu_fun_tb = 4'b1011;
#7
if(comp_out_tb== 16'b1 && comp_flag_tb==1'b1)
  $display("test 8 pass");
else
  $display("test 8 failed");
  /*******************************************************************************/
  $display("test cases_9");
#3
A_tb =   16'b1010; 
B_tb =   16'b0;
alu_fun_tb = 4'b1101; //A << 1

#7
if(shift_flag_tb == 16'b1 && shift_out_tb==16'b10100) 
  $display("test 9 pass");
else
  $display("test 9 failed");
  /*******************************************************************************/
  $display("test cases_10");
#3
A_tb =   16'b0; 
B_tb =   16'b100;
alu_fun_tb = 4'b1111; //B << 1

#7
if(shift_flag_tb== 1'b1 && shift_out_tb==16'b1000) //
  $display("test 10 pass");
else
  $display("test 10 failed");
    /*******************************************************************************/
  $display("test cases_11");
#3
A_tb =   16'b0; 
B_tb =   16'b1000; //10
alu_fun_tb = 4'b1110; //B >> 1

#7
if(shift_flag_tb== 1'b1 && shift_out_tb == 16'b100) // 5
  $display("test 11 pass");
else
  $display("test 11 failed");
  /***************************************************************************************/
  $display("test cases_12");
#3
A_tb =   16'hffff;
B_tb = 16'hffff;
alu_fun_tb = 4'b0010;


#7
if(carry_out == 1'b1)
  $display("test 12 pass");
else
  $display("test 12 failed");
#200;
$finish;

end 
endmodule



