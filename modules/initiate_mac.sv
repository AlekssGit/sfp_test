`include "mac_defines.sv"

module initiate_mac
(
	input  logic clk        ,
	input  logic reset      ,
	//Control avalon module signals
    output  logic wr_rq		,
    output  logic rd_rq		,
    input   logic rd_valid	,
    output  logic [31:0] wr_adr		,
    output  logic [31:0] rd_adr		,
    output  logic [31:0] wr_data    ,
    input   logic [31:0] rd_data    ,
    input   logic action_done,

    output  logic mac_inited,

    input   logic   led_link
);

logic need_init_mac;
logic action_done_l;

logic [2:0] count_channels_inited;

always @(posedge clk) 
begin
    action_done_l <= action_done;    
end

enum int unsigned {
    IDLE_init, 
    //PHY init using MDIO
    PHY_INIT,
    //PCS configuration registers
    LINK_TIMER_1,
    LINK_TIMER_2,
    REV_PCS,
    SCRATCH_PCS,    SCRATCH_PCS_WAIT,
    SGMII_CONF,     SGMII_CONF_WAIT,
    AN_ENABLE,
    PCS_RESET,      PCS_RESET_WAIT,

    WAIT_LINK,
    //MAC configuration registers
    DISABLE_TX_RX,  DISABLE_TX_RX_WAIT,  
    TX_SECTION_EMPTY,
    TX_ALMOST_FULL,
    TX_ALMOST_EMPTY,
    
    RX_SECTION_EMPTY,
    RX_ALMOST_FULL,
    RX_ALMOST_EMPTY,

    TX_SECTION_FULL,
    RX_SECTION_FULL,

    MAC_0,
    MAC_1,

    FRAME_LENGTH,
    TX_IPG_LENGTH,
    PAUSE_QUANT,

    COMMAND_CONFIG_REG,

    MAC_RESET,          MAC_RESET_WAIT,

    ENABLE_TX_RX,       ENABLE_TX_RX_WAIT,

    END_INITIATION

   } init_state, init_state_next;

assign need_init_mac = (reset) ? 1'b1 : (init_state == END_INITIATION & count_channels_inited == 3'd1) ? 1'b0 : need_init_mac;
assign mac_inited = ~need_init_mac;

logic allow_add_channel;

always @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        count_channels_inited = 3'd0;
        allow_add_channel = 1'b0;
    end
    else
    begin
        if(init_state == END_INITIATION & count_channels_inited < 3'd1 & allow_add_channel)
        begin
            allow_add_channel = 1'b0;
            count_channels_inited++ ;
        end
        else if(init_state != END_INITIATION)
        begin
            allow_add_channel = 1'b1;
        end
    end
end

always @(posedge clk, posedge reset)
begin
    if(reset)
    begin
        init_state = IDLE_init;
    end
    else
    begin
        init_state = init_state_next;
    end
end

always_comb
begin
    case (init_state)
        IDLE_init:              init_state_next = (need_init_mac) ? (led_link) ? PCS_RESET : /*LINK_TIMER_1*/ REV_PCS : IDLE_init;

        LINK_TIMER_1:           init_state_next = (action_done) ? LINK_TIMER_2 : LINK_TIMER_1;
        LINK_TIMER_2:           init_state_next = (action_done) ? REV_PCS : LINK_TIMER_2;

        REV_PCS:                init_state_next = (action_done) ? SCRATCH_PCS : REV_PCS;

        SCRATCH_PCS:            init_state_next = (action_done) ? SCRATCH_PCS_WAIT : SCRATCH_PCS;
        SCRATCH_PCS_WAIT:       init_state_next = (action_done) ? SGMII_CONF : SCRATCH_PCS_WAIT;
        
        SGMII_CONF:             init_state_next = (action_done) ? SGMII_CONF_WAIT : SGMII_CONF;
        SGMII_CONF_WAIT:        init_state_next = (action_done) ? WAIT_LINK : SGMII_CONF_WAIT;
        
        WAIT_LINK:              init_state_next =   (led_link) ? PCS_RESET : WAIT_LINK;

        PCS_RESET:              init_state_next = (action_done) ? PCS_RESET_WAIT : PCS_RESET;
        PCS_RESET_WAIT:         init_state_next = (action_done & (rd_data[15] == 1'b0)) ? DISABLE_TX_RX : PCS_RESET_WAIT;

        DISABLE_TX_RX:          init_state_next = (action_done) ? DISABLE_TX_RX_WAIT : DISABLE_TX_RX;
        DISABLE_TX_RX_WAIT:     init_state_next = (action_done & (rd_data[0] == 1'b0 & rd_data[1] == 1'b0)) ? TX_SECTION_EMPTY : DISABLE_TX_RX_WAIT;
        
        TX_SECTION_EMPTY:       init_state_next = (action_done) ? TX_ALMOST_FULL    : TX_SECTION_EMPTY;
        TX_ALMOST_FULL:         init_state_next = (action_done) ? TX_ALMOST_EMPTY   : TX_ALMOST_FULL;
        TX_ALMOST_EMPTY:        init_state_next = (action_done) ? TX_SECTION_FULL   : TX_ALMOST_EMPTY;
        TX_SECTION_FULL:        init_state_next = (action_done) ? RX_SECTION_EMPTY  : TX_SECTION_FULL;

        RX_SECTION_EMPTY:       init_state_next = (action_done) ? RX_ALMOST_FULL    : RX_SECTION_EMPTY;
        RX_ALMOST_FULL:         init_state_next = (action_done) ? RX_ALMOST_EMPTY   : RX_ALMOST_FULL;
        RX_ALMOST_EMPTY:        init_state_next = (action_done) ? RX_SECTION_FULL   : RX_ALMOST_EMPTY;
        RX_SECTION_FULL:        init_state_next = (action_done) ? MAC_0             : RX_SECTION_FULL;

        MAC_0:                  init_state_next = (action_done) ? MAC_1    : MAC_0;
        MAC_1:                  init_state_next = (action_done) ? FRAME_LENGTH   : MAC_1;

        FRAME_LENGTH:           init_state_next = (action_done) ? TX_IPG_LENGTH    : FRAME_LENGTH;
        TX_IPG_LENGTH:          init_state_next = (action_done) ? PAUSE_QUANT    : TX_IPG_LENGTH;
        PAUSE_QUANT:            init_state_next = (action_done) ? COMMAND_CONFIG_REG    : PAUSE_QUANT;

        COMMAND_CONFIG_REG:     init_state_next = (action_done) ? MAC_RESET    : COMMAND_CONFIG_REG;

        MAC_RESET:              init_state_next = (action_done) ? MAC_RESET_WAIT : MAC_RESET;     
        MAC_RESET_WAIT:         init_state_next = (action_done & (rd_data[13] == 1'b0)) ? ENABLE_TX_RX : MAC_RESET_WAIT;

        ENABLE_TX_RX:           init_state_next = (action_done) ? ENABLE_TX_RX_WAIT : ENABLE_TX_RX;
        ENABLE_TX_RX_WAIT:      init_state_next = (action_done & (rd_data[1:0] == 2'b11)) ? END_INITIATION : ENABLE_TX_RX_WAIT;

        END_INITIATION:         init_state_next = (count_channels_inited == 3'd1) ? END_INITIATION : IDLE_init ; //init_state_next = (need_init_mac) ? END_INITIATION : IDLE_init;
    default: ;
    endcase
end

always @(posedge clk, posedge reset) 
begin
    if(reset)
    begin
        wr_rq   = 1'b0;
        rd_rq   = 1'b0;
        wr_adr  = 32'd0;
        wr_data = 32'd0;
        rd_adr  = 32'd0;
    end 
    else if(action_done)
    begin
        rd_rq = 1'b0;
        wr_rq = 1'b0;
    end   
    else
    begin
        case (init_state)
            IDLE_init:
            begin
                wr_rq   = 1'b0;
                rd_rq   = 1'b0;
                wr_adr  = 32'd0;
                wr_data = 32'd0;
                rd_adr  = 32'd0;
            end 
            LINK_TIMER_1:
            begin
                wr_rq   = 1'b1;
                wr_adr  = {24'd0, `LINK_TIMER_0_ADDR}; //{22'd0, count_channels_inited[1:0], `LINK_TIMER_0_ADDR};
                wr_data = `LINK_TIMER_0;
                
                rd_rq   = 1'b0;
                rd_adr  = 32'd0; 
            end
            LINK_TIMER_2:
            begin
                wr_rq   = 1'b1;
                wr_adr  = {24'd0, `LINK_TIMER_1_ADDR}; //{22'd0, count_channels_inited[1:0],`LINK_TIMER_1_ADDR};
                wr_data = `LINK_TIMER_1;
                
                rd_rq   = 1'b0;
                rd_adr  = 32'd0; 
            end
            //10'h91
            REV_PCS:
            begin
                wr_rq   = 1'b0;
                wr_adr  = 32'd0; // {24'd0, `REV_PCS_ADDR};
                wr_data = 32'd0;
                
                rd_rq   = 1'b1;
                rd_adr  = {24'd0, `REV_PCS_ADDR}; 
            end
            //10'h90
            SCRATCH_PCS:
            begin
                wr_rq   = 1'b1;
                wr_adr  = {24'd0, `SCRATCH_PCS_ADDR};
                wr_data = 32'h0000aaaa;
                
                rd_rq   = 1'b0;
                rd_adr  = 32'd0; 
            end
            //10'h90
            SCRATCH_PCS_WAIT:
            begin
                wr_rq   = 1'b0;
                wr_adr  = 32'd0;
                wr_data = 32'd0;
                
                rd_rq   = 1'b1;
                rd_adr  = {24'd0, `SCRATCH_PCS_ADDR};; 
            end            
            //10'h94
            SGMII_CONF:
            begin
                wr_rq   = 1'b1;
                wr_adr  = {24'd0, `IF_MODE_ADDR}; //{22'd0, count_channels_inited[1:0], `IF_MODE_ADDR};
                wr_data = `IF_MODE;
                
                rd_rq   = 1'b0;
                rd_adr  = 32'd0; 
            end
            //10'h94
            SGMII_CONF_WAIT:
            begin
                wr_rq   = 1'b0;
                wr_adr  = 32'd0; //{22'd0, count_channels_inited[1:0], `IF_MODE_ADDR};
                wr_data = 32'd0; //`IF_MODE;
                
                rd_rq   = 1'b1;
                rd_adr  = {24'd0, `IF_MODE_ADDR};; 
            end            
            PCS_RESET:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `CONTROL_ADDR};
                wr_data = `PCS_CONTROL_INIT + `PCS_RESET;
                rd_adr  = 32'd0;
            end
            PCS_RESET_WAIT:
            begin
                wr_rq   = 1'b0;
                rd_rq   = 1'b1;
                wr_adr  = 32'd0;
                wr_data = 32'd0;
                rd_adr  = {22'd0, count_channels_inited[1:0], `CONTROL_ADDR};
            end
            DISABLE_TX_RX:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
                wr_data = `DISABLE_TX_RX;
                rd_adr  = 32'd0;
            end
            DISABLE_TX_RX_WAIT:
            begin
                wr_rq   = 1'b0;
                rd_rq   = 1'b1;
                wr_adr  = 32'd0;
                wr_data = 32'd0;
                rd_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
            end
            TX_SECTION_EMPTY:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `TX_SECTION_EMPTY_ADDR};
                wr_data = `TX_SECTION_EMPTY;
                rd_adr  = 32'd0;
            end
            TX_ALMOST_FULL:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `TX_ALMOST_FULL_ADDR};
                wr_data = `TX_ALMOST_FULL;
                rd_adr  = 32'd0;
            end
            TX_ALMOST_EMPTY:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `TX_ALMOST_EMPTY_ADDR};
                wr_data = `TX_ALMOST_EMPTY;
                rd_adr  = 32'd0;
            end 
            TX_SECTION_FULL:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `TX_SECTION_FULL_ADDR};
                wr_data = `TX_SECTION_FULL;
                rd_adr  = 32'd0;
            end  
            RX_SECTION_EMPTY:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `RX_SECTION_EMPTY_ADDR};
                wr_data = `RX_SECTION_EMPTY;
                rd_adr  = 32'd0;
            end
            RX_ALMOST_FULL:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `RX_ALMOST_FULL_ADDR};
                wr_data = `RX_ALMOST_FULL;
                rd_adr  = 32'd0;
            end
            RX_ALMOST_EMPTY:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `RX_ALMOST_EMPTY_ADDR};
                wr_data = `RX_ALMOST_EMPTY;
                rd_adr  = 32'd0;
            end 
            RX_SECTION_FULL:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `RX_SECTION_FULL_ADDR};
                wr_data = `RX_SECTION_FULL;
                rd_adr  = 32'd0;
            end 
            MAC_0:  
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `MAC_0_ADDR};
                wr_data = `MAC_0;
                rd_adr  = 32'd0;
            end            
            MAC_1:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `MAC_1_ADDR};
                wr_data = `MAC_1;
                rd_adr  = 32'd0;
            end              
            FRAME_LENGTH:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `FRM_LENGTH_ADDR};
                wr_data = `FRM_LENGTH;
                rd_adr  = 32'd0;
            end       
            TX_IPG_LENGTH:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `TX_IPG_LENGTH_ADDR};
                wr_data = `TX_IPG_LENGTH;
                rd_adr  = 32'd0;
            end      
            PAUSE_QUANT:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `PAUSE_QUANT_ADDR};
                wr_data = `PAUSE_QUANT;
                rd_adr  = 32'd0;
            end        
            COMMAND_CONFIG_REG:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
                wr_data = `DISABLE_TX_RX;
                rd_adr  = 32'd0;
            end 
            MAC_RESET: 
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
                wr_data = `DISABLE_TX_RX + `MAC_RESET;
                rd_adr  = 32'd0;
            end         
            MAC_RESET_WAIT:
            begin
                wr_rq   = 1'b0;
                rd_rq   = 1'b1;
                wr_adr  = 32'd0;
                wr_data = 32'd0;
                rd_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
            end     
            ENABLE_TX_RX:
            begin
                wr_rq   = 1'b1;
                rd_rq   = 1'b0;
                wr_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
                wr_data = `ENABLE_TX_RX;
                rd_adr  = 32'd0;
            end       
            ENABLE_TX_RX_WAIT:
            begin
                wr_rq   = 1'b0;
                rd_rq   = 1'b1;
                wr_adr  = 32'd0;
                wr_data = 32'd0;
                rd_adr  = {22'd0, count_channels_inited[1:0], `COMMAND_CONFIG_ADDR};
            end  
            default: ;
        endcase
    end
end
endmodule