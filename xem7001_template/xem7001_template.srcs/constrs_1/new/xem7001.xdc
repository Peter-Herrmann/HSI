############################################################################
# XEM7001 - Xilinx constraints file
#
# Pin mappings for the XEM7001.  Use this as a template and comment out 
# the pins that are not used in your design.  (By default, map will fail
# if this file contains constraints for signals not in your design).
#
# Copyright (c) 2004-2015 Opal Kelly Incorporated
############################################################################
set_property BITSTREAM.GENERAL.COMPRESS True [current_design]

set_property PACKAGE_PIN K12 [get_ports {hi_muxsel}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_muxsel}]

############################################################################
## FrontPanel Host Interface
############################################################################
set_property PACKAGE_PIN N11 [get_ports {hi_in[0]}]
set_property PACKAGE_PIN R13 [get_ports {hi_in[1]}]
set_property PACKAGE_PIN R12 [get_ports {hi_in[2]}]
set_property PACKAGE_PIN P13 [get_ports {hi_in[3]}]
set_property PACKAGE_PIN T13 [get_ports {hi_in[4]}]
set_property PACKAGE_PIN T12 [get_ports {hi_in[5]}]
set_property PACKAGE_PIN P11 [get_ports {hi_in[6]}]
set_property PACKAGE_PIN R10 [get_ports {hi_in[7]}]

set_property SLEW FAST [get_ports {hi_in[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_in[*]}]

set_property PACKAGE_PIN R15 [get_ports {hi_out[0]}]
set_property PACKAGE_PIN N13 [get_ports {hi_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_out[*]}]

set_property PACKAGE_PIN T15 [get_ports {hi_inout[0]}]
set_property PACKAGE_PIN T14 [get_ports {hi_inout[1]}]
set_property PACKAGE_PIN R16 [get_ports {hi_inout[2]}]
set_property PACKAGE_PIN P16 [get_ports {hi_inout[3]}]
set_property PACKAGE_PIN P15 [get_ports {hi_inout[4]}]
set_property PACKAGE_IN N16 [get_ports {hi_inout[5]}]
set_property PACKAGE_PIN M16 [get_ports {hi_inout[6]}]
set_property PACKAGE_PIN M12 [get_ports {hi_inout[7]}]
set_property PACKAGE_PIN L13 [get_ports {hi_inout[8]}]
set_property PACKAGE_PIN K13 [get_ports {hi_inout[9]}]
set_property PACKAGE_PIN M14 [get_ports {hi_inout[10]}]
set_property PACKAGE_PIN L14 [get_ports {hi_inout[11]}]
set_property PACKAGE_PIN K16 [get_ports {hi_inout[12]}]
set_property PACKAGE_PIN K15 [get_ports {hi_inout[13]}]
set_property PACKAGE_PIN J14 [get_ports {hi_inout[14]}]
set_property PACKAGE_PIN J13 [get_ports {hi_inout[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_inout[*]}]

set_property PACKAGE_PIN M15 [get_ports {hi_aa}]
set_property IOSTANDARD LVCMOS33 [get_ports {hi_aa}]


create_clock -name okHostClk -period 20.83 [get_ports {hi_in[0]}]

set_input_delay -add_delay -max -clock [get_clocks {okHostClk}]  11.000 [get_ports {hi_inout[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okHostClk}]  0.000  [get_ports {hi_inout[*]}]
set_multicycle_path -setup -from [get_ports {hi_inout[*]}] 2

set_input_delay -add_delay -max -clock [get_clocks {okHostClk}]  6.700 [get_ports {hi_in[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okHostClk}]  0.000 [get_ports {hi_in[*]}]
set_multicycle_path -setup -from [get_ports {hi_in[*]}] 2

set_output_delay -add_delay -clock [get_clocks {okHostClk}]  8.900 [get_ports {hi_out[*]}]

set_output_delay -add_delay -clock [get_clocks {okHostClk}]  9.200 [get_ports {hi_inout[*]}]

#set_property IOSTANDARD LVCMOS33 [get_ports {clk_100}]
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports {clk}]

#set_property IOSTANDARD LVCMOS33 [get_ports {clk2}]
#set_property PACKAGE_PIN F4 [get_ports {clk2}]
############################################################################
## Expansion Connectors                                                         
############################################################################



##set_property IOSTANDARD LVCMOS33 [get_ports {logic_out[*]}]

set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports {RowIn[3]}]
set_property -dict { PACKAGE_PIN A3 IOSTANDARD LVCMOS33 } [get_ports {RowIn[2]}]
set_property -dict { PACKAGE_PIN B2 IOSTANDARD LVCMOS33 } [get_ports {RowIn[1]}]
set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS33 } [get_ports {RowIn[0]}]

set_property -dict { PACKAGE_PIN D1 IOSTANDARD LVCMOS33 } [get_ports {ColOut[3]}]
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS33 } [get_ports {ColOut[2]}]
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports {ColOut[1]}]
set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports {ColOut[0]}]

set_property -dict { PACKAGE_PIN A14 IOSTANDARD LVCMOS33 } [get_ports {led0[0]}]
set_property -dict { PACKAGE_PIN B14 IOSTANDARD LVCMOS33 } [get_ports {led0[1]}]
set_property -dict { PACKAGE_PIN A15 IOSTANDARD LVCMOS33 } [get_ports {led0[2]}]
set_property -dict { PACKAGE_PIN C11 IOSTANDARD LVCMOS33 } [get_ports {led0[3]}]
set_property -dict { PACKAGE_PIN A10 IOSTANDARD LVCMOS33 } [get_ports {led0[4]}]
set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports {led0[5]}]
set_property -dict { PACKAGE_PIN A12 IOSTANDARD LVCMOS33 } [get_ports {led0[6]}]
set_property -dict { PACKAGE_PIN B16 IOSTANDARD LVCMOS33 } [get_ports {led0_dp}]


set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports {led1[0]}]
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports {led1[1]}]
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS33 } [get_ports {led1[2]}]
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports {led1[3]}]
set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 } [get_ports {led1[4]}]
set_property -dict { PACKAGE_PIN F14 IOSTANDARD LVCMOS33 } [get_ports {led1[5]}]
set_property -dict { PACKAGE_PIN E15 IOSTANDARD LVCMOS33 } [get_ports {led1[6]}]
set_property -dict { PACKAGE_PIN K2 IOSTANDARD LVCMOS33 } [get_ports {led1_dp}]

set_property -dict { PACKAGE_PIN N2 IOSTANDARD LVCMOS33 } [get_ports {led2[0]}]
set_property -dict { PACKAGE_PIN P1 IOSTANDARD LVCMOS33 } [get_ports {led2[1]}]
set_property -dict { PACKAGE_PIN R2 IOSTANDARD LVCMOS33 } [get_ports {led2[2]}]
set_property -dict { PACKAGE_PIN L3 IOSTANDARD LVCMOS33 } [get_ports {led2[3]}]
set_property -dict { PACKAGE_PIN L2 IOSTANDARD LVCMOS33 } [get_ports {led2[4]}]
set_property -dict { PACKAGE_PIN M4 IOSTANDARD LVCMOS33 } [get_ports {led2[5]}]
set_property -dict { PACKAGE_PIN M2 IOSTANDARD LVCMOS33 } [get_ports {led2[6]}]
set_property -dict { PACKAGE_PIN T2 IOSTANDARD LVCMOS33 } [get_ports {led2_dp}]

##LED3
set_property -dict { PACKAGE_PIN T5 IOSTANDARD LVCMOS33 } [get_ports {led3[0]}]
set_property -dict { PACKAGE_PIN T9 IOSTANDARD LVCMOS33 } [get_ports {led3[1]}]
set_property -dict { PACKAGE_PIN T7 IOSTANDARD LVCMOS33 } [get_ports {led3[2]}]
set_property -dict { PACKAGE_PIN P4 IOSTANDARD LVCMOS33 } [get_ports {led3[3]}]
set_property -dict { PACKAGE_PIN T3 IOSTANDARD LVCMOS33 } [get_ports {led3[4]}]
set_property -dict { PACKAGE_PIN R5 IOSTANDARD LVCMOS33 } [get_ports {led3[5]}]
set_property -dict { PACKAGE_PIN P5 IOSTANDARD LVCMOS33 } [get_ports {led3[6]}]
set_property -dict { PACKAGE_PIN T8 IOSTANDARD LVCMOS33 } [get_ports {led3_dp}]

## Reset
set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS33 } [get_ports {rst}]

set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS33 } [get_ports {btn_test}]
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports {led_test[0]}]
set_property -dict { PACKAGE_PIN F3 IOSTANDARD LVCMOS33 } [get_ports {led_test[1]}]
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports {led_test[2]}]
set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports {led_test[3]}]
set_property -dict { PACKAGE_PIN D3 IOSTANDARD LVCMOS33 } [get_ports {led_test[4]}]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS33 } [get_ports {led_test[5]}]
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS33 } [get_ports {led_test[6]}]
set_property -dict { PACKAGE_PIN A4 IOSTANDARD LVCMOS33 } [get_ports {led_test[7]}]







### Trigger, JP3-Pin45, F15 ###
set_property PACKAGE_PIN F15 [get_ports {trigger}]
set_property IOSTANDARD LVCMOS33 [get_ports {trigger}]

# LEDs #####################################################################
set_property PACKAGE_PIN H5 [get_ports {led[0]}]
set_property PACKAGE_PIN F3 [get_ports {led[1]}]
set_property PACKAGE_PIN E3 [get_ports {led[2]}]
set_property PACKAGE_PIN H4 [get_ports {led[3]}]
set_property PACKAGE_PIN D3 [get_ports {led[4]}]
set_property PACKAGE_PIN C3 [get_ports {led[5]}]
set_property PACKAGE_PIN H3 [get_ports {led[6]}]
set_property PACKAGE_PIN A4 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]

# Buttons ##################################################################
#set_property PACKAGE_PIN A5 [get_ports {button[0]}]
#set_property PACKAGE_PIN B4 [get_ports {button[1]}]
#set_property PACKAGE_PIN B7 [get_ports {button[2]}]
#set_property PACKAGE_PIN A7 [get_ports {button[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {button[*]}]