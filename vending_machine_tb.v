module vending_machine_TB;
  reg clk, rst;
  reg [1:0] in;
  wire out;
  wire [1:0] change;

  vending_machine dut (.clk(clk), .rst(rst), .in(in), .out(out), .change(change));
  
  always 
    #5 clk = ~clk;
  
  initial begin

    // Case 1: Rs 5 + 5 + 5
    rst = 1; clk = 0;
    #6 rst = 0; in = 1;
    #50 $finish;  

    // Case 2: Rs 5 + 10
    /* rst = 1; clk = 0;
    #6 rst = 0; in = 1;
    #14 in = 2;
    #25 $finish;*/

    // Case 3: Rs 10 + 10
    /* rst = 1; clk = 0;
    #6 rst = 0; in = 2;
    #50 $finish;*/

    // Case 4: Rs 10 + x
    /* rst = 1; clk = 0;
    #6 rst = 0; in = 2;
    #14 in = 0;
    #25 $finish; */
    
  end 
  
  initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0, clk, rst, in,out,change);
  end

endmodule
