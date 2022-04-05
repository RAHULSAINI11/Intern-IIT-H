module dec1(


output  a,
output  b,
output  c,
output  d,
output  e,
output  f,
output  g

);
reg W,X,Y,Z,A,B,C,D;

qlal4s3b_cell_macro u_qlal4s3b_cell_macro (
        .Sys_Clk0 (clk),
    );
 reg[26:0] delay;

always@(posedge clk)
begin

delay=delay+1;//incrementing the counter
//counts from 0 to 6000000 in 1 second
if(delay > 6000000) //blink delay in decimal
begin
        delay=27'b0;
//Incrementing Decoder
D = (W&X&Y&(!Z))|((!W)&(!X)&(!Y)&Z);//Boolean function for D
C =((!Z)&(!Y)&(X)&W)|((!Z)&(Y)&!X&(!W))|((!Z)&Y&(!X)&W)|((!Z)&Y&X&(!W));
B =((!Z)&(!Y)&!X&W)|((!Z)&!Y&(X)&(!W))|((!Z)&Y&(!X)&W)|((!Z)&Y&X&(!W));
A = ((!W)&(!X)&(!Y)&(!Z))|((!W)&(X)&(!Y)&(!Z))|((!W)&(!X)&Y&(!Z))|((!W)&X&Y&(!Z))|((!W)&(!X)&(!Y)&(Z));
W =A;
X =B;
Y =C;
Z =D;

end

//Display Decoder
 a=(!D&!C&!B&A)|(!D&C&!B&!A);
 b=(!D&C&!B&A)|(!D&C&B&!A);
 c=(!D&!C&B&!A);
 d=(!D&!C&!B&A)|(!D&C&!B&!A)|(!D&C&B&A);
 e=(!D&!C&!B&A)|(!D&!C&B&A)|(!D&C&!B&!A)|(!D&C&!B&A)|(!D&C&B&A)|(D&!C&!B&A);
 f=(!D&!C&!B&A)|(!D&!C&B&!A)|(!D&!C&B&A)|(!D&C&B&A);
 g=(!D&!C&!B&!A)|(!D&!C&!B&A)|(!D&C&B&A);


end
endmodule
//end of the module









