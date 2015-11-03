module memory(address,in,out,write,read,clk, proc_rst);
	
	input [15:0] in;
	input clk,write,read, proc_rst;
	input [5:0] address;
	output reg [15:0] out;
	reg [15:0] mem [0:63];

	/*initial
		begin
			mem[0] <= 16'b0000001011110000;
			mem[1] <= 16'b0010001011101000;
		end*/
	
	always @(negedge clk)
		begin
		if(proc_rst==0) begin

				// Test 1
				
				mem[0] <= 16'b0000001011110000; // ADD
				mem[1] <= 16'b0010001011101000;	// NDU
				mem[2] <= 16'b0000001011100010;	// ADC
				mem[3] <= 16'b0010001011010001;	// NDZ
				mem[4] <= 16'b0001001011110000;	// ADI
				
				
				//Test 2
				/*
				mem[0] <= 16'b1100001011000010;	// BEQ
				mem[1] <= 16'b0011001101101001; // LHI
				mem[2] <= 16'b0101001011000011;	// SW
				mem[3] <= 16'b0100010011000011;	// LW
				*/

				//Test 3
				/*
				mem[0] <= 16'b1000000000000011; // JAL
				mem[1] <= 16'b0000001011100010;	// ADC
				mem[2] <= 16'b0010001011101000;	// NDU
				mem[3] <= 16'b0010001011010001;	// NDZ
				mem[4] <= 16'b0001001011110000;	// ADI        
				*/

				//Test 4
				
				// mem[0] <= 16'b1001000010000000; // JLR
				// mem[1] <= 16'b0000001011100010;	// ADC
				// mem[2] <= 16'b0010001011101000;	// NDU
				// mem[3] <= 16'b0010001011010001;	// NDZ
				// mem[4] <= 16'b0001001011110000;	// ADI 
				
				//Test 5
				/*
				mem[0] <= 16'b0110000001100100; // LM
				mem[1] <= 16'b0000001011100000;	// ADD
				
				mem[2] <= 16'b0000000000000010;	// NDU
				mem[3] <= 16'b0000000000000011;	// NDZ
				mem[4] <= 16'b0000000000000100;	// ADI
				mem[5] <= 16'b0000000000000101;	// ADC
				mem[6] <= 16'b0000000000000110;	// NDU
				mem[7] <= 16'b0000000000000111;	// NDZ
				mem[8] <= 16'b0000000000001000;	// ADI
				mem[9] <= 16'b0000000000001001;	// ADI
				*/

				//Test 6
				/*
				mem[0] <= 16'b0111000001100100; // SM
				mem[1] <= 16'b0000001011100000;	// ADD
				*/

				// Lab TestBench 
				/*
				mem[0]	<=		16'b1000000000011101;
				mem[1]	<=		16'b0100100110000101;
				mem[2]	<=		16'b0100110110000101;
				mem[3]	<=		16'b0100000101010100;
				mem[4]	<=		16'b0100001101010101;
				mem[5]	<=		16'b0001000010000000;
				mem[6]	<=		16'b0010000001011000;
				mem[7]	<=		16'b0010011011011000;
				mem[8]	<=		16'b0001011011000000;
				mem[9]	<=		16'b0000100010100001;
				mem[10]	<=		16'b0000000000000000;
				mem[11]	<=		16'b0010110110110010;
				mem[12]	<=		16'b1100110101111010;
				mem[13]	<=		16'b0101100101010110;
				*/

			end
		if(write ==1'b0)
			begin
				mem[address] <= in;
			end
		if(read == 1'b0)
			begin
				out <= mem[address];
			end 
		end	

endmodule

// module mem16(address, write,clk, in, out,ir14);
// 	input [15:0] in;
// 	input [15:0] address;
// 	input write,clk,ir14;
// 	output reg [15:0] out;
// 	reg wreven,wrodd;
// 	reg[15:0] addreg;
	
// 	always @(*)
// 		begin
// 			addreg<= address;
// 		end

// 	reg [7:0] outeven,outodd,ineven,inodd;
// 	memory even(.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wreven));
// 	memory odd (.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wrodd));
// 	//for in signals of individual memories
// 	always @(*)
// 		begin
// 		if(ir14==0)
// 			begin
// 				ineven<=in;
// 				inodd<=in;
// 			end
// 		else 
// 			begin
// 				ineven<= in[7:0];
// 				inodd<=in[15:8];
// 			end
// 		end
// 	//-----------------------------------------------

// 	//for out signals of indicidual memories
// 	always @(*)
// 		begin
// 			if(ir14 ==1'b1)
// 				begin
// 					out[15:8]<=outodd;
// 					out[7:0]<=outeven;
// 				end
// 			else 
// 				if(addreg[0]==0)
// 					begin
// 						out<= {{8{outeven[7]}},outeven[7:0]};
// 					end
// 				else 
// 					begin
// 						out<= {{8{outodd[7]}},outodd[7:0]};
// 					end
// 		end

// 	//-------------------------------------------------

// 	//for write signal

// 	always @(*)
// 	begin
// 		if(ir14==0&&addreg[0]==1'b1)
// 			begin
// 				wreven<=1'b1;
// 			end
// 		else
// 			begin
// 				wreven<=write;
// 			end
// 	end

// 	always @(*)
// 	begin
// 		if(ir14==0&&addreg[0]==1'b0)
// 			begin
// 				wrodd<=1'b1;
// 			end
// 		else
// 			begin
// 				wrodd<=write;
// 			end
// 	end
// endmodule
