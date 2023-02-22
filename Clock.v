`timescale 1ns / 1ps
module Clock(cock);
output reg clock;

initial begin
	clock = 1;
end

always
	begin 
		#100 clock = 0;
		#100 clock = 1;
  	end
endmodule
