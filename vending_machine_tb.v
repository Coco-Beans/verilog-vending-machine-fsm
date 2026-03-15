module vending_machine_TB;
  reg clk, rst;
  reg [1:0] in;
  wire out;
  wire [1:0] change;

  vending_machine dut (.clk(clk), .rst(rst), .in(in), .out(out), .change(change));
  
  always 
    #5 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    in  = 0;

    // Initial reset 
    #6 rst = 0;

    // Case 1 : 5 + 5 + 5 
    in = 1;
    #10 in = 1;
    #10 in = 1;

    wait(out == 1);   // dispensed 
    #2 rst = 1;
    #6 rst = 0;
    in = 0;

    // Case 2 : 5 + 10 
    #10 in = 1;
    #10 in = 2;

    wait(out == 1);   // dispensed 
    #2 rst = 1;
    #6 rst = 0;
    in = 0;

    // Case 3 : 10 + 10 
    #10 in = 2;
    #10 in = 2;

    wait(out == 1);  // dispensed 
    #2 rst = 1;
    #6 rst = 0;
    in = 0;

    // Case 4 : 10 + x 
    #10 in = 2;
    #10 in = 0;   // no coin 

    #30; $finish;
end

  
  initial begin
    $dumpfile("vending_machine.vcd");
    $dumpvars(0, clk, rst, in, out, change);
  end

endmodule
