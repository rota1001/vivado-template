module main_tb();
    wire [7:0] led;
    reg clk_reg;
    reg rst_reg;

    wire clk;
    wire rst;

    initial begin
        clk_reg = 0;
        rst_reg = 0;
        #10
        rst_reg = 1;
        #10000000;
        $finish;
    end

    always #1 clk_reg = ~clk_reg;
    
    assign clk = clk_reg;
    assign rst = rst_reg;

    main #(
        .FREQ(1000000)
    ) main1 (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

endmodule
