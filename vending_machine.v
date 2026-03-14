module vending_machine(input clk, rst, input [1:0] in, output reg out,output reg[1:0] change);
  parameter s0 = 2'b00, s5 = 2'b01, s10 = 2'b10;
  reg [1:0] ps, ns;
  
  always @(posedge clk) begin
    if (rst == 1)
    	begin
          ps = s0;
          ns = s0;
          change  = 2'b00;
        end
    else
        ps = ns;

    case (ps)
        s0: 
          if (in == 2'b00) begin
                ns = s0;
                out = 0;
                change = 2'b00;
          end
          else if (in == 2'b01) begin
                ns = s5;
                out = 0;
                change = 2'b00;
          end
          else if (in == 2'b10) begin
                ns = s10;
                out = 0;
                change = 2'b00;
          end

        s5: 
          if (in == 2'b00) begin
                ns = s0;
                out = 0;
                change = 2'b01;
          end
          else if (in == 2'b01) begin
                ns = s10;
                out = 0;
                change = 2'b00;
          end
          else if (in == 2'b10) begin
                ns = s0;
                out = 1;
                change = 2'b00;
          end

        s10: 
          if (in == 2'b00) begin
                ns = s0;
                out = 0;
                change = 2'b10;
          end
          else if (in == 2'b01) begin
                ns = s0;
                out = 1;
                change = 2'b00;
          end
          else if (in == 2'b10) begin
                ns = s0;
                out = 1;
                change = 2'b01; 
          end

    endcase
end
endmodule
