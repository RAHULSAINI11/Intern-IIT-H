module dec1(

input  wire w,
input  wire x,
input  wire y,
input  wire z,

output wire a,
output wire b,
output wire c,
output wire d,
output wire cloc,
);

reg[26:0] delay;
wire clk;
reg A,B,C,D,clock; 
        qlal4s3b_cell_macro u_qlal4s3b_cell_macro (
        .Sys_Clk0 (clk),
        );


always @(posedge clk)
begin
W = z;
X = y;
Y = x; 
Z = w;


//Incrementing Decoder
d = (W&X&Y&(!Z))|((!W)&(!X)&(!Y)&Z);//Boolean function for D //
c = ((!Z)&(!Y)&(X)&W)|((!Z)&(Y)&!X&(!W))|((!Z)&Y&(!X)&W)|((!Z)&Y&X&(!W)); //
b = ((!Z)&(!Y)&!X&W)|((!Z)&!Y&(X)&(!W))|((!Z)&Y&(!X)&W)|((!Z)&Y&X&(!W)); //
a = ((!W)&(!X)&(!Y)&(!Z))|((!W)&(X)&(!Y)&(!Z))|((!W)&(!X)&Y&(!Z))|((!W)&X&Y&(!Z))|((!W)&(!X)&(!Y)&(Z)); //



        delay = delay+1; //incrementing the counter.
        if(delay > 20000000) //check delay count
                begin
                        delay=27'b0;
   clock=!clock;
                end //end delay count


end
assign cloc = clock;
endmodule

