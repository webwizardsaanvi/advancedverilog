`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();


  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_saanvi_counter dut (
      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

initial clk = 0;
always #5 clk = ~clk;

initial begin
    ui_in = 8'd0;
    uio_in = 8'd0;
    ena = 1'b1;
    rst_n = 1'b0;
    #12 rst_n = 1'b1; // release reset after 12ns
    #200 $finish;
end
 // run for 200ns
// Dump the signals to a VCD file. You can view it with gtkwave or surfer.
  initial begin
     $dumpfile("tb.vcd");
    $dumpvars(0, tb_tt_um_saanvi_counter);
    #1;
  end

endmodule
