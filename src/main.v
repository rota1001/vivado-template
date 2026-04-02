module main(
    output reg [7:0] led,
    input clk,
    input rst
);
    reg [31:0] cnt;
    parameter FREQ = 50000000;
    parameter PERIOD = FREQ / 2 - 1;
    reg [2:0] state;

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            cnt <= 32'd0;
            state <= 3'd0;
        end
        else begin
            if (cnt == PERIOD) begin
                state <= state + 1;
                cnt <= 0;
            end
            else begin
                cnt <= cnt + 1;
            end
        end
    end

    always @(*) begin
        case (state)
        0: led <= 8'b00000001;
        1: led <= 8'b00000011;
        2: led <= 8'b00000111;
        3: led <= 8'b00001111;
        4: led <= 8'b00011111;
        5: led <= 8'b00111111;
        6: led <= 8'b01111111;
        7: led <= 8'b11111111;
        default:
        ;
        endcase
    end
endmodule
