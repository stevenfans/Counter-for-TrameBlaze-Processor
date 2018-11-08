module tramelBlaze_tb;

reg CLK;
reg     RESET;
reg     [15:0] IN_PORT;
reg     INTERRUPT;

wire    [15:0] OUT_PORT;
wire    [15:0] PORT_ID;
wire           READ_STROBE;
wire           WRITE_STROBE;
wire           INTERRUPT_ACK;

tramelblaze_top    tbt(
                        .CLK(CLK),  
                        .RESET(RESET),
                        .IN_PORT(IN_PORT),
                        .INTERRUPT(INTERRUPT),
                        
                        .OUT_PORT(OUT_PORT),
                        .PORT_ID(PORT_ID),
                        .READ_STROBE(READ_STROBE),
                        .WRITE_STROBE(WRITE_STROBE),
                        .INTERRUPT_ACK(INTERRUPT_ACK)
                        );
                        
always #5 CLK = ~CLK;

initial
    begin
    CLK = 0; 
    IN_PORT = 0; 
    INTERRUPT = 0; 
    RESET = 1; 
    #100; 
    RESET = 0; 
    repeat (10)
        begin
        #1000
        @(posedge CLK)
        INTERRUPT = 1;
        @(posedge INTERRUPT_ACK)
        INTERRUPT = 0; 
        end
      end
 endmodule