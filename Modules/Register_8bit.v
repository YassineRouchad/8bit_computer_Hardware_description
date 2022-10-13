module Register_8bit(Data,Direction,outEnable,Q,Load,Clr,clk);
input [7:0] Data;
input Direction,Load,Clr,clk;
output outEnable;
output [7:0] outEnable;
reg [7:0] preQ;

always@(posedge clk)begin
    if(Clr) preQ <= 8'b00000000;
    else if (!Load) preQ <= Data;
    else preQ <= preQ;
end
assign Q = preQ;
TriState_buffer Tri(Data ,Q,Direction,outEnable)

endmodule

module TriState_buffer(A,B,Direction,Enable);
    inout reg [7:0] A,B;
    input Direction,Enable;
    

    always@(*)begin
        if(Enable)begin
            A = 8'bzzzzzzzz;
            B = 8'bzzzzzzzz;
        end
        else begin
            case (Direction)
            1'b0:B = A;
            1'b1:A = B;
        endcase
        end
        end
endmodule
