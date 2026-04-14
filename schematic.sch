# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new top_fpga work:top_fpga:NOFILE -nosplit
load symbol RTL_ADD2 work RTL(+) pin I1 input.left pinBus I0 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_INV1 work INV pinBus I0 input [31:0] pinBus O output [31:0] fillcolor 1
load symbol RTL_MUX2 work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_ROM44 work GEN pinBus A input.left [2:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_MOD work RTL(%) pinBus I0 input.left [31:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD0 work RTL(%) pinBus I0 input.left [28:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD1 work RTL(%) pinBus I0 input.left [25:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD2 work RTL(%) pinBus I0 input.left [22:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD3 work RTL(%) pinBus I0 input.left [18:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD4 work RTL(%) pinBus I0 input.left [15:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD5 work RTL(%) pinBus I0 input.left [12:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MOD6 work RTL(%) pinBus I0 input.left [8:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_DIV work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [3:0] pinBus O output.right [28:0] fillcolor 1
load symbol RTL_DIV0 work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [6:0] pinBus O output.right [25:0] fillcolor 1
load symbol RTL_DIV1 work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [9:0] pinBus O output.right [22:0] fillcolor 1
load symbol RTL_DIV2 work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [13:0] pinBus O output.right [18:0] fillcolor 1
load symbol RTL_DIV3 work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [16:0] pinBus O output.right [15:0] fillcolor 1
load symbol RTL_DIV4 work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [19:0] pinBus O output.right [12:0] fillcolor 1
load symbol RTL_DIV5 work RTL(/) pinBus I0 input.left [31:0] pinBus I1 input.left [23:0] pinBus O output.right [8:0] fillcolor 1
load symbol RTL_MUX183 work MUX pin S input.bot pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load symbol RTL_MUX248 work MUX pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus I2 input.left [3:0] pinBus I3 input.left [3:0] pinBus I4 input.left [3:0] pinBus I5 input.left [3:0] pinBus I6 input.left [3:0] pinBus I7 input.left [3:0] pinBus O output.right [3:0] pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_MUX247 work MUX pin I0 input.left pin I1 input.left pin I2 input.left pin I3 input.left pin I4 input.left pin I5 input.left pin I6 input.left pin I7 input.left pin O output.right pinBus S input.bot [2:0] fillcolor 1
load symbol RTL_ADD17 work RTL(+) pin I1 input.left pinBus I0 input.left [16:0] pinBus O output.right [16:0] fillcolor 1
load symbol RTL_MUX251 work MUX pinBus I0 input.left [16:0] pinBus I1 input.left [16:0] pinBus O output.right [16:0] pinBus S input.bot [16:0] fillcolor 1
load symbol RTL_MUX0 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_ADD18 work RTL(+) pin I1 input.left pinBus I0 input.left [2:0] pinBus O output.right [2:0] fillcolor 1
load symbol RTL_ROM46 work GEN pin O output.right pinBus A input.left [16:0] fillcolor 1
load symbol RTL_ROM45 work GEN pinBus A input.left [3:0] pinBus O output.right [6:0] fillcolor 1
load symbol RTL_MUX246 work MUX pin S input.bot pinBus I0 input.left [6:0] pinBus I1 input.left [6:0] pinBus O output.right [6:0] fillcolor 1
load symbol clock_divider work:clock_divider:NOFILE HIERBOX pin clk input.left pin clk_en output.right pin reset input.left boxcolor 1 fillcolor 2 minwidth 13%
load symbol pipe work:pipe:NOFILE HIERBOX pin clk input.left pin exception output.right pin reset input.left pin stall input.left pinBus pc_out output.right [31:0] pinBus wb_data_out output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_REG_SYNC__BREG_2 work[2:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [2:0] pinBus Q output.right [2:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 3
load symbol RTL_REG_SYNC__BREG_1 work[16:0]swws GEN pin C input.clk.left pinBus D input.left [16:0] pinBus Q output.right [16:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 17
load port clk input -pg 1 -lvl 0 -x 0 -y 910
load port dp output -pg 1 -lvl 10 -x 2980 -y 680
load port reset input -pg 1 -lvl 0 -x 0 -y 1050
load portBus an output [7:0] -attr @name an[7:0] -pg 1 -lvl 10 -x 2980 -y 480
load portBus led output [15:0] -attr @name led[15:0] -pg 1 -lvl 10 -x 2980 -y 710
load portBus seg output [6:0] -attr @name seg[6:0] -pg 1 -lvl 10 -x 2980 -y 590
load inst abs_value0_i RTL_ADD2 work -attr @cell(#000000) RTL_ADD -pinAttr I1 @attr FO=65 -pinBusAttr I0 @name I0[31:0] -pinBusAttr O @name O[31:0] -pg 1 -lvl 2 -x 300 -y 610
load inst abs_value1_i RTL_INV1 work -attr @cell(#000000) RTL_INV -pinBusAttr I0 @name I0[31:0] -pinBusAttr O @name O[31:0] -pg 1 -lvl 1 -x 100 -y 700
load inst abs_value_i RTL_MUX2 work -attr @cell(#000000) RTL_MUX -pinAttr S @attr FO=5 -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 3 -x 680 -y 620
load inst an_i RTL_ROM44 work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[2:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 9 -x 2740 -y 480
load inst cur_digit0_i RTL_MOD work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 570
load inst cur_digit0_i__0 RTL_MOD0 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[28:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 70
load inst cur_digit0_i__1 RTL_MOD1 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[25:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 160
load inst cur_digit0_i__2 RTL_MOD2 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[22:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 250
load inst cur_digit0_i__3 RTL_MOD3 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[18:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 340
load inst cur_digit0_i__4 RTL_MOD4 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 660
load inst cur_digit0_i__5 RTL_MOD5 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[12:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 760
load inst cur_digit0_i__6 RTL_MOD6 work -attr @cell(#000000) RTL_MOD -pinBusAttr I0 @name I0[8:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[3:0] -pg 1 -lvl 5 -x 1410 -y 450
load inst cur_digit1_i RTL_DIV work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"1010\" -pinBusAttr O @name O[28:0] -pg 1 -lvl 5 -x 1410 -y 60
load inst cur_digit1_i__0 RTL_DIV0 work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[6:0] -pinBusAttr I1 @attr V=B\"1100100\" -pinBusAttr O @name O[25:0] -pg 1 -lvl 5 -x 1410 -y 150
load inst cur_digit1_i__1 RTL_DIV1 work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[9:0] -pinBusAttr I1 @attr V=B\"1111101000\" -pinBusAttr O @name O[22:0] -pg 1 -lvl 5 -x 1410 -y 240
load inst cur_digit1_i__2 RTL_DIV2 work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[13:0] -pinBusAttr I1 @attr V=B\"10011100010000\" -pinBusAttr O @name O[18:0] -pg 1 -lvl 5 -x 1410 -y 330
load inst cur_digit1_i__3 RTL_DIV3 work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[16:0] -pinBusAttr I1 @attr V=X\"186A0\" -pinBusAttr O @name O[15:0] -pg 1 -lvl 5 -x 1410 -y 630
load inst cur_digit1_i__4 RTL_DIV4 work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[19:0] -pinBusAttr I1 @attr V=X\"F4240\" -pinBusAttr O @name O[12:0] -pg 1 -lvl 5 -x 1410 -y 750
load inst cur_digit1_i__5 RTL_DIV5 work -attr @cell(#000000) RTL_DIV -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[23:0] -pinBusAttr I1 @attr V=X\"989680\" -pinBusAttr O @name O[8:0] -pg 1 -lvl 4 -x 970 -y 440
load inst cur_digit_i RTL_MUX183 work -attr @cell(#000000) RTL_MUX -pinAttr S @attr FO=5 -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 6 -x 1740 -y 440
load inst cur_digit_i__0 RTL_MUX248 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=3'b000 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=3'b001 -pinBusAttr I2 @name I2[3:0] -pinBusAttr I2 @attr S=3'b010 -pinBusAttr I3 @name I3[3:0] -pinBusAttr I3 @attr S=3'b011 -pinBusAttr I4 @name I4[3:0] -pinBusAttr I4 @attr S=3'b100 -pinBusAttr I5 @name I5[3:0] -pinBusAttr I5 @attr S=3'b101 -pinBusAttr I6 @name I6[3:0] -pinBusAttr I6 @attr S=3'b110 -pinBusAttr I7 @name I7[3:0] -pinBusAttr I7 @attr S=3'b111 -pinBusAttr O @name O[3:0] -pinBusAttr S @name S[2:0] -pg 1 -lvl 7 -x 2150 -y 360
load inst cur_minus_i RTL_MUX247 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr {FO=117, S=3'b000} -pinAttr I1 @attr {FO=117, S=3'b001} -pinAttr I2 @attr {FO=117, S=3'b010} -pinAttr I3 @attr {FO=117, S=3'b011} -pinAttr I4 @attr {FO=117, S=3'b100} -pinAttr I5 @attr {FO=117, S=3'b101} -pinAttr I6 @attr {FO=117, S=3'b110} -pinAttr I7 @attr {FO=5, S=3'b111} -pinAttr O @attr FO=1 -pinBusAttr S @name S[2:0] -pg 1 -lvl 8 -x 2410 -y 360
load inst scan_counter0_i RTL_ADD17 work -attr @cell(#000000) RTL_ADD -pinAttr I1 @attr FO=65 -pinBusAttr I0 @name I0[16:0] -pinBusAttr O @name O[16:0] -pg 1 -lvl 2 -x 300 -y 830
load inst scan_counter_i RTL_MUX251 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[16:0] -pinBusAttr I0 @attr S=17'b11000011010011111 -pinBusAttr I1 @name I1[16:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[16:0] -pinBusAttr S @name S[16:0] -pg 1 -lvl 3 -x 680 -y 820
load inst scan_counter_i__0 RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr {FO=65, S=1'b0} -pinAttr I1 @attr {FO=117, S=default} -pinAttr O @attr FO=17 -pinAttr S @attr FO=1871 -pg 1 -lvl 3 -x 680 -y 990
load inst scan_sel0_i RTL_ADD18 work -attr @cell(#000000) RTL_ADD -pinAttr I1 @attr FO=65 -pinBusAttr I0 @name I0[2:0] -pinBusAttr O @name O[2:0] -pg 1 -lvl 5 -x 1410 -y 970
load inst scan_sel_i RTL_ROM46 work -attr @cell(#000000) RTL_ROM -pinAttr O @attr FO=3 -pinBusAttr A @name A[16:0] -pg 1 -lvl 5 -x 1410 -y 850
load inst scan_sel_i__0 RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr {FO=65, S=1'b0} -pinAttr I1 @attr {FO=117, S=default} -pinAttr O @attr FO=3 -pinAttr S @attr FO=1871 -pg 1 -lvl 5 -x 1410 -y 1080
load inst seg0_i RTL_ROM45 work -attr @cell(#000000) RTL_ROM -pinBusAttr A @name A[3:0] -pinBusAttr O @name O[6:0] -pg 1 -lvl 8 -x 2410 -y 600
load inst seg_i RTL_MUX246 work -attr @cell(#000000) RTL_MUX -pinAttr S @attr FO=1 -pinBusAttr I0 @name I0[6:0] -pinBusAttr I0 @attr V=B\"1111110\",\ S=1'b1 -pinBusAttr I1 @name I1[6:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[6:0] -pg 1 -lvl 9 -x 2740 -y 590
load inst u_clk_div clock_divider work:clock_divider:NOFILE -autohide -attr @cell(#000000) clock_divider -pg 1 -lvl 8 -x 2410 -y 990
load inst u_pipe pipe work:pipe:NOFILE -autohide -attr @cell(#000000) pipe -pinAttr exception @attr n/c -pinBusAttr pc_out @name pc_out[31:0] -pinBusAttr pc_out @attr n/c -pinBusAttr wb_data_out @name wb_data_out[31:0] -pg 1 -lvl 9 -x 2740 -y 990
load inst scan_sel_reg[2:0] RTL_REG_SYNC__BREG_2 work[2:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pinAttr C @attr FO=48 -pinAttr CE @attr FO=3 -pinBusAttr D @attr FO=1 -pinBusAttr Q @attr FO=4 -pinAttr RST @attr FO=3 -pg 1 -lvl 6 -x 1740 -y 920
load inst scan_counter_reg[16:0] RTL_REG_SYNC__BREG_1 work[16:0]swws -attr @cell(#000000) RTL_REG_SYNC -pinAttr C @attr FO=48 -pinBusAttr D @attr FO=1 -pinBusAttr Q @attr FO=3 -pinAttr RST @attr FO=17 -pg 1 -lvl 4 -x 970 -y 810
load net <const0> -ground -pin cur_digit0_i I1[2] -pin cur_digit0_i I1[0] -pin cur_digit0_i__0 I1[2] -pin cur_digit0_i__0 I1[0] -pin cur_digit0_i__1 I1[2] -pin cur_digit0_i__1 I1[0] -pin cur_digit0_i__2 I1[2] -pin cur_digit0_i__2 I1[0] -pin cur_digit0_i__3 I1[2] -pin cur_digit0_i__3 I1[0] -pin cur_digit0_i__4 I1[2] -pin cur_digit0_i__4 I1[0] -pin cur_digit0_i__5 I1[2] -pin cur_digit0_i__5 I1[0] -pin cur_digit0_i__6 I1[2] -pin cur_digit0_i__6 I1[0] -pin cur_digit1_i I1[2] -pin cur_digit1_i I1[0] -pin cur_digit1_i__0 I1[4] -pin cur_digit1_i__0 I1[3] -pin cur_digit1_i__0 I1[1] -pin cur_digit1_i__0 I1[0] -pin cur_digit1_i__1 I1[4] -pin cur_digit1_i__1 I1[2] -pin cur_digit1_i__1 I1[1] -pin cur_digit1_i__1 I1[0] -pin cur_digit1_i__2 I1[12] -pin cur_digit1_i__2 I1[11] -pin cur_digit1_i__2 I1[7] -pin cur_digit1_i__2 I1[6] -pin cur_digit1_i__2 I1[5] -pin cur_digit1_i__2 I1[3] -pin cur_digit1_i__2 I1[2] -pin cur_digit1_i__2 I1[1] -pin cur_digit1_i__2 I1[0] -pin cur_digit1_i__3 I1[14] -pin cur_digit1_i__3 I1[13] -pin cur_digit1_i__3 I1[12] -pin cur_digit1_i__3 I1[11] -pin cur_digit1_i__3 I1[8] -pin cur_digit1_i__3 I1[6] -pin cur_digit1_i__3 I1[4] -pin cur_digit1_i__3 I1[3] -pin cur_digit1_i__3 I1[2] -pin cur_digit1_i__3 I1[1] -pin cur_digit1_i__3 I1[0] -pin cur_digit1_i__4 I1[15] -pin cur_digit1_i__4 I1[13] -pin cur_digit1_i__4 I1[12] -pin cur_digit1_i__4 I1[11] -pin cur_digit1_i__4 I1[10] -pin cur_digit1_i__4 I1[8] -pin cur_digit1_i__4 I1[7] -pin cur_digit1_i__4 I1[5] -pin cur_digit1_i__4 I1[4] -pin cur_digit1_i__4 I1[3] -pin cur_digit1_i__4 I1[2] -pin cur_digit1_i__4 I1[1] -pin cur_digit1_i__4 I1[0] -pin cur_digit1_i__5 I1[22] -pin cur_digit1_i__5 I1[21] -pin cur_digit1_i__5 I1[18] -pin cur_digit1_i__5 I1[17] -pin cur_digit1_i__5 I1[16] -pin cur_digit1_i__5 I1[14] -pin cur_digit1_i__5 I1[13] -pin cur_digit1_i__5 I1[11] -pin cur_digit1_i__5 I1[8] -pin cur_digit1_i__5 I1[6] -pin cur_digit1_i__5 I1[5] -pin cur_digit1_i__5 I1[4] -pin cur_digit1_i__5 I1[3] -pin cur_digit1_i__5 I1[2] -pin cur_digit1_i__5 I1[1] -pin cur_digit1_i__5 I1[0] -pin cur_digit_i I0[3] -pin cur_digit_i I0[2] -pin cur_digit_i I0[1] -pin cur_digit_i I0[0] -pin cur_minus_i I0 -pin cur_minus_i I1 -pin cur_minus_i I2 -pin cur_minus_i I3 -pin cur_minus_i I4 -pin cur_minus_i I5 -pin cur_minus_i I6 -pin scan_counter_i I0[16] -pin scan_counter_i I0[15] -pin scan_counter_i I0[14] -pin scan_counter_i I0[13] -pin scan_counter_i I0[12] -pin scan_counter_i I0[11] -pin scan_counter_i I0[10] -pin scan_counter_i I0[9] -pin scan_counter_i I0[8] -pin scan_counter_i I0[7] -pin scan_counter_i I0[6] -pin scan_counter_i I0[5] -pin scan_counter_i I0[4] -pin scan_counter_i I0[3] -pin scan_counter_i I0[2] -pin scan_counter_i I0[1] -pin scan_counter_i I0[0] -pin scan_counter_i__0 I1 -pin scan_sel_i__0 I1 -pin seg_i I0[0] -pin u_pipe stall
load net <const1> -power -pin abs_value0_i I1 -pin cur_digit0_i I1[3] -pin cur_digit0_i I1[1] -pin cur_digit0_i__0 I1[3] -pin cur_digit0_i__0 I1[1] -pin cur_digit0_i__1 I1[3] -pin cur_digit0_i__1 I1[1] -pin cur_digit0_i__2 I1[3] -pin cur_digit0_i__2 I1[1] -pin cur_digit0_i__3 I1[3] -pin cur_digit0_i__3 I1[1] -pin cur_digit0_i__4 I1[3] -pin cur_digit0_i__4 I1[1] -pin cur_digit0_i__5 I1[3] -pin cur_digit0_i__5 I1[1] -pin cur_digit0_i__6 I1[3] -pin cur_digit0_i__6 I1[1] -pin cur_digit1_i I1[3] -pin cur_digit1_i I1[1] -pin cur_digit1_i__0 I1[6] -pin cur_digit1_i__0 I1[5] -pin cur_digit1_i__0 I1[2] -pin cur_digit1_i__1 I1[9] -pin cur_digit1_i__1 I1[8] -pin cur_digit1_i__1 I1[7] -pin cur_digit1_i__1 I1[6] -pin cur_digit1_i__1 I1[5] -pin cur_digit1_i__1 I1[3] -pin cur_digit1_i__2 I1[13] -pin cur_digit1_i__2 I1[10] -pin cur_digit1_i__2 I1[9] -pin cur_digit1_i__2 I1[8] -pin cur_digit1_i__2 I1[4] -pin cur_digit1_i__3 I1[16] -pin cur_digit1_i__3 I1[15] -pin cur_digit1_i__3 I1[10] -pin cur_digit1_i__3 I1[9] -pin cur_digit1_i__3 I1[7] -pin cur_digit1_i__3 I1[5] -pin cur_digit1_i__4 I1[19] -pin cur_digit1_i__4 I1[18] -pin cur_digit1_i__4 I1[17] -pin cur_digit1_i__4 I1[16] -pin cur_digit1_i__4 I1[14] -pin cur_digit1_i__4 I1[9] -pin cur_digit1_i__4 I1[6] -pin cur_digit1_i__5 I1[23] -pin cur_digit1_i__5 I1[20] -pin cur_digit1_i__5 I1[19] -pin cur_digit1_i__5 I1[15] -pin cur_digit1_i__5 I1[12] -pin cur_digit1_i__5 I1[10] -pin cur_digit1_i__5 I1[9] -pin cur_digit1_i__5 I1[7] -port dp -pin scan_counter0_i I1 -pin scan_counter_i__0 I0 -pin scan_sel0_i I1 -pin scan_sel_i__0 I0 -pin seg_i I0[6] -pin seg_i I0[5] -pin seg_i I0[4] -pin seg_i I0[3] -pin seg_i I0[2] -pin seg_i I0[1]
load net abs_value0[0] -attr @rip O[0] -pin abs_value0_i O[0] -pin abs_value_i I0[0]
load net abs_value0[10] -attr @rip O[10] -pin abs_value0_i O[10] -pin abs_value_i I0[10]
load net abs_value0[11] -attr @rip O[11] -pin abs_value0_i O[11] -pin abs_value_i I0[11]
load net abs_value0[12] -attr @rip O[12] -pin abs_value0_i O[12] -pin abs_value_i I0[12]
load net abs_value0[13] -attr @rip O[13] -pin abs_value0_i O[13] -pin abs_value_i I0[13]
load net abs_value0[14] -attr @rip O[14] -pin abs_value0_i O[14] -pin abs_value_i I0[14]
load net abs_value0[15] -attr @rip O[15] -pin abs_value0_i O[15] -pin abs_value_i I0[15]
load net abs_value0[16] -attr @rip O[16] -pin abs_value0_i O[16] -pin abs_value_i I0[16]
load net abs_value0[17] -attr @rip O[17] -pin abs_value0_i O[17] -pin abs_value_i I0[17]
load net abs_value0[18] -attr @rip O[18] -pin abs_value0_i O[18] -pin abs_value_i I0[18]
load net abs_value0[19] -attr @rip O[19] -pin abs_value0_i O[19] -pin abs_value_i I0[19]
load net abs_value0[1] -attr @rip O[1] -pin abs_value0_i O[1] -pin abs_value_i I0[1]
load net abs_value0[20] -attr @rip O[20] -pin abs_value0_i O[20] -pin abs_value_i I0[20]
load net abs_value0[21] -attr @rip O[21] -pin abs_value0_i O[21] -pin abs_value_i I0[21]
load net abs_value0[22] -attr @rip O[22] -pin abs_value0_i O[22] -pin abs_value_i I0[22]
load net abs_value0[23] -attr @rip O[23] -pin abs_value0_i O[23] -pin abs_value_i I0[23]
load net abs_value0[24] -attr @rip O[24] -pin abs_value0_i O[24] -pin abs_value_i I0[24]
load net abs_value0[25] -attr @rip O[25] -pin abs_value0_i O[25] -pin abs_value_i I0[25]
load net abs_value0[26] -attr @rip O[26] -pin abs_value0_i O[26] -pin abs_value_i I0[26]
load net abs_value0[27] -attr @rip O[27] -pin abs_value0_i O[27] -pin abs_value_i I0[27]
load net abs_value0[28] -attr @rip O[28] -pin abs_value0_i O[28] -pin abs_value_i I0[28]
load net abs_value0[29] -attr @rip O[29] -pin abs_value0_i O[29] -pin abs_value_i I0[29]
load net abs_value0[2] -attr @rip O[2] -pin abs_value0_i O[2] -pin abs_value_i I0[2]
load net abs_value0[30] -attr @rip O[30] -pin abs_value0_i O[30] -pin abs_value_i I0[30]
load net abs_value0[31] -attr @rip O[31] -pin abs_value0_i O[31] -pin abs_value_i I0[31]
load net abs_value0[3] -attr @rip O[3] -pin abs_value0_i O[3] -pin abs_value_i I0[3]
load net abs_value0[4] -attr @rip O[4] -pin abs_value0_i O[4] -pin abs_value_i I0[4]
load net abs_value0[5] -attr @rip O[5] -pin abs_value0_i O[5] -pin abs_value_i I0[5]
load net abs_value0[6] -attr @rip O[6] -pin abs_value0_i O[6] -pin abs_value_i I0[6]
load net abs_value0[7] -attr @rip O[7] -pin abs_value0_i O[7] -pin abs_value_i I0[7]
load net abs_value0[8] -attr @rip O[8] -pin abs_value0_i O[8] -pin abs_value_i I0[8]
load net abs_value0[9] -attr @rip O[9] -pin abs_value0_i O[9] -pin abs_value_i I0[9]
load net abs_value1[0] -attr @rip O[0] -pin abs_value0_i I0[0] -pin abs_value1_i O[0]
load net abs_value1[10] -attr @rip O[10] -pin abs_value0_i I0[10] -pin abs_value1_i O[10]
load net abs_value1[11] -attr @rip O[11] -pin abs_value0_i I0[11] -pin abs_value1_i O[11]
load net abs_value1[12] -attr @rip O[12] -pin abs_value0_i I0[12] -pin abs_value1_i O[12]
load net abs_value1[13] -attr @rip O[13] -pin abs_value0_i I0[13] -pin abs_value1_i O[13]
load net abs_value1[14] -attr @rip O[14] -pin abs_value0_i I0[14] -pin abs_value1_i O[14]
load net abs_value1[15] -attr @rip O[15] -pin abs_value0_i I0[15] -pin abs_value1_i O[15]
load net abs_value1[16] -attr @rip O[16] -pin abs_value0_i I0[16] -pin abs_value1_i O[16]
load net abs_value1[17] -attr @rip O[17] -pin abs_value0_i I0[17] -pin abs_value1_i O[17]
load net abs_value1[18] -attr @rip O[18] -pin abs_value0_i I0[18] -pin abs_value1_i O[18]
load net abs_value1[19] -attr @rip O[19] -pin abs_value0_i I0[19] -pin abs_value1_i O[19]
load net abs_value1[1] -attr @rip O[1] -pin abs_value0_i I0[1] -pin abs_value1_i O[1]
load net abs_value1[20] -attr @rip O[20] -pin abs_value0_i I0[20] -pin abs_value1_i O[20]
load net abs_value1[21] -attr @rip O[21] -pin abs_value0_i I0[21] -pin abs_value1_i O[21]
load net abs_value1[22] -attr @rip O[22] -pin abs_value0_i I0[22] -pin abs_value1_i O[22]
load net abs_value1[23] -attr @rip O[23] -pin abs_value0_i I0[23] -pin abs_value1_i O[23]
load net abs_value1[24] -attr @rip O[24] -pin abs_value0_i I0[24] -pin abs_value1_i O[24]
load net abs_value1[25] -attr @rip O[25] -pin abs_value0_i I0[25] -pin abs_value1_i O[25]
load net abs_value1[26] -attr @rip O[26] -pin abs_value0_i I0[26] -pin abs_value1_i O[26]
load net abs_value1[27] -attr @rip O[27] -pin abs_value0_i I0[27] -pin abs_value1_i O[27]
load net abs_value1[28] -attr @rip O[28] -pin abs_value0_i I0[28] -pin abs_value1_i O[28]
load net abs_value1[29] -attr @rip O[29] -pin abs_value0_i I0[29] -pin abs_value1_i O[29]
load net abs_value1[2] -attr @rip O[2] -pin abs_value0_i I0[2] -pin abs_value1_i O[2]
load net abs_value1[30] -attr @rip O[30] -pin abs_value0_i I0[30] -pin abs_value1_i O[30]
load net abs_value1[31] -attr @rip O[31] -pin abs_value0_i I0[31] -pin abs_value1_i O[31]
load net abs_value1[3] -attr @rip O[3] -pin abs_value0_i I0[3] -pin abs_value1_i O[3]
load net abs_value1[4] -attr @rip O[4] -pin abs_value0_i I0[4] -pin abs_value1_i O[4]
load net abs_value1[5] -attr @rip O[5] -pin abs_value0_i I0[5] -pin abs_value1_i O[5]
load net abs_value1[6] -attr @rip O[6] -pin abs_value0_i I0[6] -pin abs_value1_i O[6]
load net abs_value1[7] -attr @rip O[7] -pin abs_value0_i I0[7] -pin abs_value1_i O[7]
load net abs_value1[8] -attr @rip O[8] -pin abs_value0_i I0[8] -pin abs_value1_i O[8]
load net abs_value1[9] -attr @rip O[9] -pin abs_value0_i I0[9] -pin abs_value1_i O[9]
load net abs_value[0] -attr @rip O[0] -pin abs_value_i O[0] -pin cur_digit0_i I0[0] -pin cur_digit1_i I0[0] -pin cur_digit1_i__0 I0[0] -pin cur_digit1_i__1 I0[0] -pin cur_digit1_i__2 I0[0] -pin cur_digit1_i__3 I0[0] -pin cur_digit1_i__4 I0[0] -pin cur_digit1_i__5 I0[0]
load net abs_value[10] -attr @rip O[10] -pin abs_value_i O[10] -pin cur_digit0_i I0[10] -pin cur_digit1_i I0[10] -pin cur_digit1_i__0 I0[10] -pin cur_digit1_i__1 I0[10] -pin cur_digit1_i__2 I0[10] -pin cur_digit1_i__3 I0[10] -pin cur_digit1_i__4 I0[10] -pin cur_digit1_i__5 I0[10]
load net abs_value[11] -attr @rip O[11] -pin abs_value_i O[11] -pin cur_digit0_i I0[11] -pin cur_digit1_i I0[11] -pin cur_digit1_i__0 I0[11] -pin cur_digit1_i__1 I0[11] -pin cur_digit1_i__2 I0[11] -pin cur_digit1_i__3 I0[11] -pin cur_digit1_i__4 I0[11] -pin cur_digit1_i__5 I0[11]
load net abs_value[12] -attr @rip O[12] -pin abs_value_i O[12] -pin cur_digit0_i I0[12] -pin cur_digit1_i I0[12] -pin cur_digit1_i__0 I0[12] -pin cur_digit1_i__1 I0[12] -pin cur_digit1_i__2 I0[12] -pin cur_digit1_i__3 I0[12] -pin cur_digit1_i__4 I0[12] -pin cur_digit1_i__5 I0[12]
load net abs_value[13] -attr @rip O[13] -pin abs_value_i O[13] -pin cur_digit0_i I0[13] -pin cur_digit1_i I0[13] -pin cur_digit1_i__0 I0[13] -pin cur_digit1_i__1 I0[13] -pin cur_digit1_i__2 I0[13] -pin cur_digit1_i__3 I0[13] -pin cur_digit1_i__4 I0[13] -pin cur_digit1_i__5 I0[13]
load net abs_value[14] -attr @rip O[14] -pin abs_value_i O[14] -pin cur_digit0_i I0[14] -pin cur_digit1_i I0[14] -pin cur_digit1_i__0 I0[14] -pin cur_digit1_i__1 I0[14] -pin cur_digit1_i__2 I0[14] -pin cur_digit1_i__3 I0[14] -pin cur_digit1_i__4 I0[14] -pin cur_digit1_i__5 I0[14]
load net abs_value[15] -attr @rip O[15] -pin abs_value_i O[15] -pin cur_digit0_i I0[15] -pin cur_digit1_i I0[15] -pin cur_digit1_i__0 I0[15] -pin cur_digit1_i__1 I0[15] -pin cur_digit1_i__2 I0[15] -pin cur_digit1_i__3 I0[15] -pin cur_digit1_i__4 I0[15] -pin cur_digit1_i__5 I0[15]
load net abs_value[16] -attr @rip O[16] -pin abs_value_i O[16] -pin cur_digit0_i I0[16] -pin cur_digit1_i I0[16] -pin cur_digit1_i__0 I0[16] -pin cur_digit1_i__1 I0[16] -pin cur_digit1_i__2 I0[16] -pin cur_digit1_i__3 I0[16] -pin cur_digit1_i__4 I0[16] -pin cur_digit1_i__5 I0[16]
load net abs_value[17] -attr @rip O[17] -pin abs_value_i O[17] -pin cur_digit0_i I0[17] -pin cur_digit1_i I0[17] -pin cur_digit1_i__0 I0[17] -pin cur_digit1_i__1 I0[17] -pin cur_digit1_i__2 I0[17] -pin cur_digit1_i__3 I0[17] -pin cur_digit1_i__4 I0[17] -pin cur_digit1_i__5 I0[17]
load net abs_value[18] -attr @rip O[18] -pin abs_value_i O[18] -pin cur_digit0_i I0[18] -pin cur_digit1_i I0[18] -pin cur_digit1_i__0 I0[18] -pin cur_digit1_i__1 I0[18] -pin cur_digit1_i__2 I0[18] -pin cur_digit1_i__3 I0[18] -pin cur_digit1_i__4 I0[18] -pin cur_digit1_i__5 I0[18]
load net abs_value[19] -attr @rip O[19] -pin abs_value_i O[19] -pin cur_digit0_i I0[19] -pin cur_digit1_i I0[19] -pin cur_digit1_i__0 I0[19] -pin cur_digit1_i__1 I0[19] -pin cur_digit1_i__2 I0[19] -pin cur_digit1_i__3 I0[19] -pin cur_digit1_i__4 I0[19] -pin cur_digit1_i__5 I0[19]
load net abs_value[1] -attr @rip O[1] -pin abs_value_i O[1] -pin cur_digit0_i I0[1] -pin cur_digit1_i I0[1] -pin cur_digit1_i__0 I0[1] -pin cur_digit1_i__1 I0[1] -pin cur_digit1_i__2 I0[1] -pin cur_digit1_i__3 I0[1] -pin cur_digit1_i__4 I0[1] -pin cur_digit1_i__5 I0[1]
load net abs_value[20] -attr @rip O[20] -pin abs_value_i O[20] -pin cur_digit0_i I0[20] -pin cur_digit1_i I0[20] -pin cur_digit1_i__0 I0[20] -pin cur_digit1_i__1 I0[20] -pin cur_digit1_i__2 I0[20] -pin cur_digit1_i__3 I0[20] -pin cur_digit1_i__4 I0[20] -pin cur_digit1_i__5 I0[20]
load net abs_value[21] -attr @rip O[21] -pin abs_value_i O[21] -pin cur_digit0_i I0[21] -pin cur_digit1_i I0[21] -pin cur_digit1_i__0 I0[21] -pin cur_digit1_i__1 I0[21] -pin cur_digit1_i__2 I0[21] -pin cur_digit1_i__3 I0[21] -pin cur_digit1_i__4 I0[21] -pin cur_digit1_i__5 I0[21]
load net abs_value[22] -attr @rip O[22] -pin abs_value_i O[22] -pin cur_digit0_i I0[22] -pin cur_digit1_i I0[22] -pin cur_digit1_i__0 I0[22] -pin cur_digit1_i__1 I0[22] -pin cur_digit1_i__2 I0[22] -pin cur_digit1_i__3 I0[22] -pin cur_digit1_i__4 I0[22] -pin cur_digit1_i__5 I0[22]
load net abs_value[23] -attr @rip O[23] -pin abs_value_i O[23] -pin cur_digit0_i I0[23] -pin cur_digit1_i I0[23] -pin cur_digit1_i__0 I0[23] -pin cur_digit1_i__1 I0[23] -pin cur_digit1_i__2 I0[23] -pin cur_digit1_i__3 I0[23] -pin cur_digit1_i__4 I0[23] -pin cur_digit1_i__5 I0[23]
load net abs_value[24] -attr @rip O[24] -pin abs_value_i O[24] -pin cur_digit0_i I0[24] -pin cur_digit1_i I0[24] -pin cur_digit1_i__0 I0[24] -pin cur_digit1_i__1 I0[24] -pin cur_digit1_i__2 I0[24] -pin cur_digit1_i__3 I0[24] -pin cur_digit1_i__4 I0[24] -pin cur_digit1_i__5 I0[24]
load net abs_value[25] -attr @rip O[25] -pin abs_value_i O[25] -pin cur_digit0_i I0[25] -pin cur_digit1_i I0[25] -pin cur_digit1_i__0 I0[25] -pin cur_digit1_i__1 I0[25] -pin cur_digit1_i__2 I0[25] -pin cur_digit1_i__3 I0[25] -pin cur_digit1_i__4 I0[25] -pin cur_digit1_i__5 I0[25]
load net abs_value[26] -attr @rip O[26] -pin abs_value_i O[26] -pin cur_digit0_i I0[26] -pin cur_digit1_i I0[26] -pin cur_digit1_i__0 I0[26] -pin cur_digit1_i__1 I0[26] -pin cur_digit1_i__2 I0[26] -pin cur_digit1_i__3 I0[26] -pin cur_digit1_i__4 I0[26] -pin cur_digit1_i__5 I0[26]
load net abs_value[27] -attr @rip O[27] -pin abs_value_i O[27] -pin cur_digit0_i I0[27] -pin cur_digit1_i I0[27] -pin cur_digit1_i__0 I0[27] -pin cur_digit1_i__1 I0[27] -pin cur_digit1_i__2 I0[27] -pin cur_digit1_i__3 I0[27] -pin cur_digit1_i__4 I0[27] -pin cur_digit1_i__5 I0[27]
load net abs_value[28] -attr @rip O[28] -pin abs_value_i O[28] -pin cur_digit0_i I0[28] -pin cur_digit1_i I0[28] -pin cur_digit1_i__0 I0[28] -pin cur_digit1_i__1 I0[28] -pin cur_digit1_i__2 I0[28] -pin cur_digit1_i__3 I0[28] -pin cur_digit1_i__4 I0[28] -pin cur_digit1_i__5 I0[28]
load net abs_value[29] -attr @rip O[29] -pin abs_value_i O[29] -pin cur_digit0_i I0[29] -pin cur_digit1_i I0[29] -pin cur_digit1_i__0 I0[29] -pin cur_digit1_i__1 I0[29] -pin cur_digit1_i__2 I0[29] -pin cur_digit1_i__3 I0[29] -pin cur_digit1_i__4 I0[29] -pin cur_digit1_i__5 I0[29]
load net abs_value[2] -attr @rip O[2] -pin abs_value_i O[2] -pin cur_digit0_i I0[2] -pin cur_digit1_i I0[2] -pin cur_digit1_i__0 I0[2] -pin cur_digit1_i__1 I0[2] -pin cur_digit1_i__2 I0[2] -pin cur_digit1_i__3 I0[2] -pin cur_digit1_i__4 I0[2] -pin cur_digit1_i__5 I0[2]
load net abs_value[30] -attr @rip O[30] -pin abs_value_i O[30] -pin cur_digit0_i I0[30] -pin cur_digit1_i I0[30] -pin cur_digit1_i__0 I0[30] -pin cur_digit1_i__1 I0[30] -pin cur_digit1_i__2 I0[30] -pin cur_digit1_i__3 I0[30] -pin cur_digit1_i__4 I0[30] -pin cur_digit1_i__5 I0[30]
load net abs_value[31] -attr @rip O[31] -pin abs_value_i O[31] -pin cur_digit0_i I0[31] -pin cur_digit1_i I0[31] -pin cur_digit1_i__0 I0[31] -pin cur_digit1_i__1 I0[31] -pin cur_digit1_i__2 I0[31] -pin cur_digit1_i__3 I0[31] -pin cur_digit1_i__4 I0[31] -pin cur_digit1_i__5 I0[31]
load net abs_value[3] -attr @rip O[3] -pin abs_value_i O[3] -pin cur_digit0_i I0[3] -pin cur_digit1_i I0[3] -pin cur_digit1_i__0 I0[3] -pin cur_digit1_i__1 I0[3] -pin cur_digit1_i__2 I0[3] -pin cur_digit1_i__3 I0[3] -pin cur_digit1_i__4 I0[3] -pin cur_digit1_i__5 I0[3]
load net abs_value[4] -attr @rip O[4] -pin abs_value_i O[4] -pin cur_digit0_i I0[4] -pin cur_digit1_i I0[4] -pin cur_digit1_i__0 I0[4] -pin cur_digit1_i__1 I0[4] -pin cur_digit1_i__2 I0[4] -pin cur_digit1_i__3 I0[4] -pin cur_digit1_i__4 I0[4] -pin cur_digit1_i__5 I0[4]
load net abs_value[5] -attr @rip O[5] -pin abs_value_i O[5] -pin cur_digit0_i I0[5] -pin cur_digit1_i I0[5] -pin cur_digit1_i__0 I0[5] -pin cur_digit1_i__1 I0[5] -pin cur_digit1_i__2 I0[5] -pin cur_digit1_i__3 I0[5] -pin cur_digit1_i__4 I0[5] -pin cur_digit1_i__5 I0[5]
load net abs_value[6] -attr @rip O[6] -pin abs_value_i O[6] -pin cur_digit0_i I0[6] -pin cur_digit1_i I0[6] -pin cur_digit1_i__0 I0[6] -pin cur_digit1_i__1 I0[6] -pin cur_digit1_i__2 I0[6] -pin cur_digit1_i__3 I0[6] -pin cur_digit1_i__4 I0[6] -pin cur_digit1_i__5 I0[6]
load net abs_value[7] -attr @rip O[7] -pin abs_value_i O[7] -pin cur_digit0_i I0[7] -pin cur_digit1_i I0[7] -pin cur_digit1_i__0 I0[7] -pin cur_digit1_i__1 I0[7] -pin cur_digit1_i__2 I0[7] -pin cur_digit1_i__3 I0[7] -pin cur_digit1_i__4 I0[7] -pin cur_digit1_i__5 I0[7]
load net abs_value[8] -attr @rip O[8] -pin abs_value_i O[8] -pin cur_digit0_i I0[8] -pin cur_digit1_i I0[8] -pin cur_digit1_i__0 I0[8] -pin cur_digit1_i__1 I0[8] -pin cur_digit1_i__2 I0[8] -pin cur_digit1_i__3 I0[8] -pin cur_digit1_i__4 I0[8] -pin cur_digit1_i__5 I0[8]
load net abs_value[9] -attr @rip O[9] -pin abs_value_i O[9] -pin cur_digit0_i I0[9] -pin cur_digit1_i I0[9] -pin cur_digit1_i__0 I0[9] -pin cur_digit1_i__1 I0[9] -pin cur_digit1_i__2 I0[9] -pin cur_digit1_i__3 I0[9] -pin cur_digit1_i__4 I0[9] -pin cur_digit1_i__5 I0[9]
load net an[0] -attr @rip O[0] -port an[0] -pin an_i O[0]
load net an[1] -attr @rip O[1] -port an[1] -pin an_i O[1]
load net an[2] -attr @rip O[2] -port an[2] -pin an_i O[2]
load net an[3] -attr @rip O[3] -port an[3] -pin an_i O[3]
load net an[4] -attr @rip O[4] -port an[4] -pin an_i O[4]
load net an[5] -attr @rip O[5] -port an[5] -pin an_i O[5]
load net an[6] -attr @rip O[6] -port an[6] -pin an_i O[6]
load net an[7] -attr @rip O[7] -port an[7] -pin an_i O[7]
load net clk -port clk -pin scan_counter_reg[16:0] C -pin scan_sel_reg[2:0] C -pin u_clk_div clk
netloc clk 1 0 8 NJ 910 NJ 910 NJ 910 820 900 NJ 900 1570 1000 NJ 1000 N
load net cpu_clk -pin u_clk_div clk_en -pin u_pipe clk
netloc cpu_clk 1 8 1 N 1000
load net cur_digit0[0] -attr @rip O[0] -pin cur_digit0_i O[0] -pin cur_digit_i__0 I0[0]
load net cur_digit0[1] -attr @rip O[1] -pin cur_digit0_i O[1] -pin cur_digit_i__0 I0[1]
load net cur_digit0[2] -attr @rip O[2] -pin cur_digit0_i O[2] -pin cur_digit_i__0 I0[2]
load net cur_digit0[3] -attr @rip O[3] -pin cur_digit0_i O[3] -pin cur_digit_i__0 I0[3]
load net cur_digit0_i__0_n_0 -attr @rip O[3] -pin cur_digit0_i__0 O[3] -pin cur_digit_i__0 I1[3]
load net cur_digit0_i__0_n_1 -attr @rip O[2] -pin cur_digit0_i__0 O[2] -pin cur_digit_i__0 I1[2]
load net cur_digit0_i__0_n_2 -attr @rip O[1] -pin cur_digit0_i__0 O[1] -pin cur_digit_i__0 I1[1]
load net cur_digit0_i__0_n_3 -attr @rip O[0] -pin cur_digit0_i__0 O[0] -pin cur_digit_i__0 I1[0]
load net cur_digit0_i__1_n_0 -attr @rip O[3] -pin cur_digit0_i__1 O[3] -pin cur_digit_i__0 I2[3]
load net cur_digit0_i__1_n_1 -attr @rip O[2] -pin cur_digit0_i__1 O[2] -pin cur_digit_i__0 I2[2]
load net cur_digit0_i__1_n_2 -attr @rip O[1] -pin cur_digit0_i__1 O[1] -pin cur_digit_i__0 I2[1]
load net cur_digit0_i__1_n_3 -attr @rip O[0] -pin cur_digit0_i__1 O[0] -pin cur_digit_i__0 I2[0]
load net cur_digit0_i__2_n_0 -attr @rip O[3] -pin cur_digit0_i__2 O[3] -pin cur_digit_i__0 I3[3]
load net cur_digit0_i__2_n_1 -attr @rip O[2] -pin cur_digit0_i__2 O[2] -pin cur_digit_i__0 I3[2]
load net cur_digit0_i__2_n_2 -attr @rip O[1] -pin cur_digit0_i__2 O[1] -pin cur_digit_i__0 I3[1]
load net cur_digit0_i__2_n_3 -attr @rip O[0] -pin cur_digit0_i__2 O[0] -pin cur_digit_i__0 I3[0]
load net cur_digit0_i__3_n_0 -attr @rip O[3] -pin cur_digit0_i__3 O[3] -pin cur_digit_i__0 I4[3]
load net cur_digit0_i__3_n_1 -attr @rip O[2] -pin cur_digit0_i__3 O[2] -pin cur_digit_i__0 I4[2]
load net cur_digit0_i__3_n_2 -attr @rip O[1] -pin cur_digit0_i__3 O[1] -pin cur_digit_i__0 I4[1]
load net cur_digit0_i__3_n_3 -attr @rip O[0] -pin cur_digit0_i__3 O[0] -pin cur_digit_i__0 I4[0]
load net cur_digit0_i__4_n_0 -attr @rip O[3] -pin cur_digit0_i__4 O[3] -pin cur_digit_i__0 I5[3]
load net cur_digit0_i__4_n_1 -attr @rip O[2] -pin cur_digit0_i__4 O[2] -pin cur_digit_i__0 I5[2]
load net cur_digit0_i__4_n_2 -attr @rip O[1] -pin cur_digit0_i__4 O[1] -pin cur_digit_i__0 I5[1]
load net cur_digit0_i__4_n_3 -attr @rip O[0] -pin cur_digit0_i__4 O[0] -pin cur_digit_i__0 I5[0]
load net cur_digit0_i__5_n_0 -attr @rip O[3] -pin cur_digit0_i__5 O[3] -pin cur_digit_i__0 I6[3]
load net cur_digit0_i__5_n_1 -attr @rip O[2] -pin cur_digit0_i__5 O[2] -pin cur_digit_i__0 I6[2]
load net cur_digit0_i__5_n_2 -attr @rip O[1] -pin cur_digit0_i__5 O[1] -pin cur_digit_i__0 I6[1]
load net cur_digit0_i__5_n_3 -attr @rip O[0] -pin cur_digit0_i__5 O[0] -pin cur_digit_i__0 I6[0]
load net cur_digit0_i__6_n_0 -attr @rip O[3] -pin cur_digit0_i__6 O[3] -pin cur_digit_i I1[3]
load net cur_digit0_i__6_n_1 -attr @rip O[2] -pin cur_digit0_i__6 O[2] -pin cur_digit_i I1[2]
load net cur_digit0_i__6_n_2 -attr @rip O[1] -pin cur_digit0_i__6 O[1] -pin cur_digit_i I1[1]
load net cur_digit0_i__6_n_3 -attr @rip O[0] -pin cur_digit0_i__6 O[0] -pin cur_digit_i I1[0]
load net cur_digit1[0] -attr @rip O[0] -pin cur_digit0_i__0 I0[0] -pin cur_digit1_i O[0]
load net cur_digit1[10] -attr @rip O[10] -pin cur_digit0_i__0 I0[10] -pin cur_digit1_i O[10]
load net cur_digit1[11] -attr @rip O[11] -pin cur_digit0_i__0 I0[11] -pin cur_digit1_i O[11]
load net cur_digit1[12] -attr @rip O[12] -pin cur_digit0_i__0 I0[12] -pin cur_digit1_i O[12]
load net cur_digit1[13] -attr @rip O[13] -pin cur_digit0_i__0 I0[13] -pin cur_digit1_i O[13]
load net cur_digit1[14] -attr @rip O[14] -pin cur_digit0_i__0 I0[14] -pin cur_digit1_i O[14]
load net cur_digit1[15] -attr @rip O[15] -pin cur_digit0_i__0 I0[15] -pin cur_digit1_i O[15]
load net cur_digit1[16] -attr @rip O[16] -pin cur_digit0_i__0 I0[16] -pin cur_digit1_i O[16]
load net cur_digit1[17] -attr @rip O[17] -pin cur_digit0_i__0 I0[17] -pin cur_digit1_i O[17]
load net cur_digit1[18] -attr @rip O[18] -pin cur_digit0_i__0 I0[18] -pin cur_digit1_i O[18]
load net cur_digit1[19] -attr @rip O[19] -pin cur_digit0_i__0 I0[19] -pin cur_digit1_i O[19]
load net cur_digit1[1] -attr @rip O[1] -pin cur_digit0_i__0 I0[1] -pin cur_digit1_i O[1]
load net cur_digit1[20] -attr @rip O[20] -pin cur_digit0_i__0 I0[20] -pin cur_digit1_i O[20]
load net cur_digit1[21] -attr @rip O[21] -pin cur_digit0_i__0 I0[21] -pin cur_digit1_i O[21]
load net cur_digit1[22] -attr @rip O[22] -pin cur_digit0_i__0 I0[22] -pin cur_digit1_i O[22]
load net cur_digit1[23] -attr @rip O[23] -pin cur_digit0_i__0 I0[23] -pin cur_digit1_i O[23]
load net cur_digit1[24] -attr @rip O[24] -pin cur_digit0_i__0 I0[24] -pin cur_digit1_i O[24]
load net cur_digit1[25] -attr @rip O[25] -pin cur_digit0_i__0 I0[25] -pin cur_digit1_i O[25]
load net cur_digit1[26] -attr @rip O[26] -pin cur_digit0_i__0 I0[26] -pin cur_digit1_i O[26]
load net cur_digit1[27] -attr @rip O[27] -pin cur_digit0_i__0 I0[27] -pin cur_digit1_i O[27]
load net cur_digit1[28] -attr @rip O[28] -pin cur_digit0_i__0 I0[28] -pin cur_digit1_i O[28]
load net cur_digit1[2] -attr @rip O[2] -pin cur_digit0_i__0 I0[2] -pin cur_digit1_i O[2]
load net cur_digit1[3] -attr @rip O[3] -pin cur_digit0_i__0 I0[3] -pin cur_digit1_i O[3]
load net cur_digit1[4] -attr @rip O[4] -pin cur_digit0_i__0 I0[4] -pin cur_digit1_i O[4]
load net cur_digit1[5] -attr @rip O[5] -pin cur_digit0_i__0 I0[5] -pin cur_digit1_i O[5]
load net cur_digit1[6] -attr @rip O[6] -pin cur_digit0_i__0 I0[6] -pin cur_digit1_i O[6]
load net cur_digit1[7] -attr @rip O[7] -pin cur_digit0_i__0 I0[7] -pin cur_digit1_i O[7]
load net cur_digit1[8] -attr @rip O[8] -pin cur_digit0_i__0 I0[8] -pin cur_digit1_i O[8]
load net cur_digit1[9] -attr @rip O[9] -pin cur_digit0_i__0 I0[9] -pin cur_digit1_i O[9]
load net cur_digit1_i__0_n_0 -attr @rip O[25] -pin cur_digit0_i__1 I0[25] -pin cur_digit1_i__0 O[25]
load net cur_digit1_i__0_n_1 -attr @rip O[24] -pin cur_digit0_i__1 I0[24] -pin cur_digit1_i__0 O[24]
load net cur_digit1_i__0_n_10 -attr @rip O[15] -pin cur_digit0_i__1 I0[15] -pin cur_digit1_i__0 O[15]
load net cur_digit1_i__0_n_11 -attr @rip O[14] -pin cur_digit0_i__1 I0[14] -pin cur_digit1_i__0 O[14]
load net cur_digit1_i__0_n_12 -attr @rip O[13] -pin cur_digit0_i__1 I0[13] -pin cur_digit1_i__0 O[13]
load net cur_digit1_i__0_n_13 -attr @rip O[12] -pin cur_digit0_i__1 I0[12] -pin cur_digit1_i__0 O[12]
load net cur_digit1_i__0_n_14 -attr @rip O[11] -pin cur_digit0_i__1 I0[11] -pin cur_digit1_i__0 O[11]
load net cur_digit1_i__0_n_15 -attr @rip O[10] -pin cur_digit0_i__1 I0[10] -pin cur_digit1_i__0 O[10]
load net cur_digit1_i__0_n_16 -attr @rip O[9] -pin cur_digit0_i__1 I0[9] -pin cur_digit1_i__0 O[9]
load net cur_digit1_i__0_n_17 -attr @rip O[8] -pin cur_digit0_i__1 I0[8] -pin cur_digit1_i__0 O[8]
load net cur_digit1_i__0_n_18 -attr @rip O[7] -pin cur_digit0_i__1 I0[7] -pin cur_digit1_i__0 O[7]
load net cur_digit1_i__0_n_19 -attr @rip O[6] -pin cur_digit0_i__1 I0[6] -pin cur_digit1_i__0 O[6]
load net cur_digit1_i__0_n_2 -attr @rip O[23] -pin cur_digit0_i__1 I0[23] -pin cur_digit1_i__0 O[23]
load net cur_digit1_i__0_n_20 -attr @rip O[5] -pin cur_digit0_i__1 I0[5] -pin cur_digit1_i__0 O[5]
load net cur_digit1_i__0_n_21 -attr @rip O[4] -pin cur_digit0_i__1 I0[4] -pin cur_digit1_i__0 O[4]
load net cur_digit1_i__0_n_22 -attr @rip O[3] -pin cur_digit0_i__1 I0[3] -pin cur_digit1_i__0 O[3]
load net cur_digit1_i__0_n_23 -attr @rip O[2] -pin cur_digit0_i__1 I0[2] -pin cur_digit1_i__0 O[2]
load net cur_digit1_i__0_n_24 -attr @rip O[1] -pin cur_digit0_i__1 I0[1] -pin cur_digit1_i__0 O[1]
load net cur_digit1_i__0_n_25 -attr @rip O[0] -pin cur_digit0_i__1 I0[0] -pin cur_digit1_i__0 O[0]
load net cur_digit1_i__0_n_3 -attr @rip O[22] -pin cur_digit0_i__1 I0[22] -pin cur_digit1_i__0 O[22]
load net cur_digit1_i__0_n_4 -attr @rip O[21] -pin cur_digit0_i__1 I0[21] -pin cur_digit1_i__0 O[21]
load net cur_digit1_i__0_n_5 -attr @rip O[20] -pin cur_digit0_i__1 I0[20] -pin cur_digit1_i__0 O[20]
load net cur_digit1_i__0_n_6 -attr @rip O[19] -pin cur_digit0_i__1 I0[19] -pin cur_digit1_i__0 O[19]
load net cur_digit1_i__0_n_7 -attr @rip O[18] -pin cur_digit0_i__1 I0[18] -pin cur_digit1_i__0 O[18]
load net cur_digit1_i__0_n_8 -attr @rip O[17] -pin cur_digit0_i__1 I0[17] -pin cur_digit1_i__0 O[17]
load net cur_digit1_i__0_n_9 -attr @rip O[16] -pin cur_digit0_i__1 I0[16] -pin cur_digit1_i__0 O[16]
load net cur_digit1_i__1_n_0 -attr @rip O[22] -pin cur_digit0_i__2 I0[22] -pin cur_digit1_i__1 O[22]
load net cur_digit1_i__1_n_1 -attr @rip O[21] -pin cur_digit0_i__2 I0[21] -pin cur_digit1_i__1 O[21]
load net cur_digit1_i__1_n_10 -attr @rip O[12] -pin cur_digit0_i__2 I0[12] -pin cur_digit1_i__1 O[12]
load net cur_digit1_i__1_n_11 -attr @rip O[11] -pin cur_digit0_i__2 I0[11] -pin cur_digit1_i__1 O[11]
load net cur_digit1_i__1_n_12 -attr @rip O[10] -pin cur_digit0_i__2 I0[10] -pin cur_digit1_i__1 O[10]
load net cur_digit1_i__1_n_13 -attr @rip O[9] -pin cur_digit0_i__2 I0[9] -pin cur_digit1_i__1 O[9]
load net cur_digit1_i__1_n_14 -attr @rip O[8] -pin cur_digit0_i__2 I0[8] -pin cur_digit1_i__1 O[8]
load net cur_digit1_i__1_n_15 -attr @rip O[7] -pin cur_digit0_i__2 I0[7] -pin cur_digit1_i__1 O[7]
load net cur_digit1_i__1_n_16 -attr @rip O[6] -pin cur_digit0_i__2 I0[6] -pin cur_digit1_i__1 O[6]
load net cur_digit1_i__1_n_17 -attr @rip O[5] -pin cur_digit0_i__2 I0[5] -pin cur_digit1_i__1 O[5]
load net cur_digit1_i__1_n_18 -attr @rip O[4] -pin cur_digit0_i__2 I0[4] -pin cur_digit1_i__1 O[4]
load net cur_digit1_i__1_n_19 -attr @rip O[3] -pin cur_digit0_i__2 I0[3] -pin cur_digit1_i__1 O[3]
load net cur_digit1_i__1_n_2 -attr @rip O[20] -pin cur_digit0_i__2 I0[20] -pin cur_digit1_i__1 O[20]
load net cur_digit1_i__1_n_20 -attr @rip O[2] -pin cur_digit0_i__2 I0[2] -pin cur_digit1_i__1 O[2]
load net cur_digit1_i__1_n_21 -attr @rip O[1] -pin cur_digit0_i__2 I0[1] -pin cur_digit1_i__1 O[1]
load net cur_digit1_i__1_n_22 -attr @rip O[0] -pin cur_digit0_i__2 I0[0] -pin cur_digit1_i__1 O[0]
load net cur_digit1_i__1_n_3 -attr @rip O[19] -pin cur_digit0_i__2 I0[19] -pin cur_digit1_i__1 O[19]
load net cur_digit1_i__1_n_4 -attr @rip O[18] -pin cur_digit0_i__2 I0[18] -pin cur_digit1_i__1 O[18]
load net cur_digit1_i__1_n_5 -attr @rip O[17] -pin cur_digit0_i__2 I0[17] -pin cur_digit1_i__1 O[17]
load net cur_digit1_i__1_n_6 -attr @rip O[16] -pin cur_digit0_i__2 I0[16] -pin cur_digit1_i__1 O[16]
load net cur_digit1_i__1_n_7 -attr @rip O[15] -pin cur_digit0_i__2 I0[15] -pin cur_digit1_i__1 O[15]
load net cur_digit1_i__1_n_8 -attr @rip O[14] -pin cur_digit0_i__2 I0[14] -pin cur_digit1_i__1 O[14]
load net cur_digit1_i__1_n_9 -attr @rip O[13] -pin cur_digit0_i__2 I0[13] -pin cur_digit1_i__1 O[13]
load net cur_digit1_i__2_n_0 -attr @rip O[18] -pin cur_digit0_i__3 I0[18] -pin cur_digit1_i__2 O[18]
load net cur_digit1_i__2_n_1 -attr @rip O[17] -pin cur_digit0_i__3 I0[17] -pin cur_digit1_i__2 O[17]
load net cur_digit1_i__2_n_10 -attr @rip O[8] -pin cur_digit0_i__3 I0[8] -pin cur_digit1_i__2 O[8]
load net cur_digit1_i__2_n_11 -attr @rip O[7] -pin cur_digit0_i__3 I0[7] -pin cur_digit1_i__2 O[7]
load net cur_digit1_i__2_n_12 -attr @rip O[6] -pin cur_digit0_i__3 I0[6] -pin cur_digit1_i__2 O[6]
load net cur_digit1_i__2_n_13 -attr @rip O[5] -pin cur_digit0_i__3 I0[5] -pin cur_digit1_i__2 O[5]
load net cur_digit1_i__2_n_14 -attr @rip O[4] -pin cur_digit0_i__3 I0[4] -pin cur_digit1_i__2 O[4]
load net cur_digit1_i__2_n_15 -attr @rip O[3] -pin cur_digit0_i__3 I0[3] -pin cur_digit1_i__2 O[3]
load net cur_digit1_i__2_n_16 -attr @rip O[2] -pin cur_digit0_i__3 I0[2] -pin cur_digit1_i__2 O[2]
load net cur_digit1_i__2_n_17 -attr @rip O[1] -pin cur_digit0_i__3 I0[1] -pin cur_digit1_i__2 O[1]
load net cur_digit1_i__2_n_18 -attr @rip O[0] -pin cur_digit0_i__3 I0[0] -pin cur_digit1_i__2 O[0]
load net cur_digit1_i__2_n_2 -attr @rip O[16] -pin cur_digit0_i__3 I0[16] -pin cur_digit1_i__2 O[16]
load net cur_digit1_i__2_n_3 -attr @rip O[15] -pin cur_digit0_i__3 I0[15] -pin cur_digit1_i__2 O[15]
load net cur_digit1_i__2_n_4 -attr @rip O[14] -pin cur_digit0_i__3 I0[14] -pin cur_digit1_i__2 O[14]
load net cur_digit1_i__2_n_5 -attr @rip O[13] -pin cur_digit0_i__3 I0[13] -pin cur_digit1_i__2 O[13]
load net cur_digit1_i__2_n_6 -attr @rip O[12] -pin cur_digit0_i__3 I0[12] -pin cur_digit1_i__2 O[12]
load net cur_digit1_i__2_n_7 -attr @rip O[11] -pin cur_digit0_i__3 I0[11] -pin cur_digit1_i__2 O[11]
load net cur_digit1_i__2_n_8 -attr @rip O[10] -pin cur_digit0_i__3 I0[10] -pin cur_digit1_i__2 O[10]
load net cur_digit1_i__2_n_9 -attr @rip O[9] -pin cur_digit0_i__3 I0[9] -pin cur_digit1_i__2 O[9]
load net cur_digit1_i__3_n_0 -attr @rip O[15] -pin cur_digit0_i__4 I0[15] -pin cur_digit1_i__3 O[15]
load net cur_digit1_i__3_n_1 -attr @rip O[14] -pin cur_digit0_i__4 I0[14] -pin cur_digit1_i__3 O[14]
load net cur_digit1_i__3_n_10 -attr @rip O[5] -pin cur_digit0_i__4 I0[5] -pin cur_digit1_i__3 O[5]
load net cur_digit1_i__3_n_11 -attr @rip O[4] -pin cur_digit0_i__4 I0[4] -pin cur_digit1_i__3 O[4]
load net cur_digit1_i__3_n_12 -attr @rip O[3] -pin cur_digit0_i__4 I0[3] -pin cur_digit1_i__3 O[3]
load net cur_digit1_i__3_n_13 -attr @rip O[2] -pin cur_digit0_i__4 I0[2] -pin cur_digit1_i__3 O[2]
load net cur_digit1_i__3_n_14 -attr @rip O[1] -pin cur_digit0_i__4 I0[1] -pin cur_digit1_i__3 O[1]
load net cur_digit1_i__3_n_15 -attr @rip O[0] -pin cur_digit0_i__4 I0[0] -pin cur_digit1_i__3 O[0]
load net cur_digit1_i__3_n_2 -attr @rip O[13] -pin cur_digit0_i__4 I0[13] -pin cur_digit1_i__3 O[13]
load net cur_digit1_i__3_n_3 -attr @rip O[12] -pin cur_digit0_i__4 I0[12] -pin cur_digit1_i__3 O[12]
load net cur_digit1_i__3_n_4 -attr @rip O[11] -pin cur_digit0_i__4 I0[11] -pin cur_digit1_i__3 O[11]
load net cur_digit1_i__3_n_5 -attr @rip O[10] -pin cur_digit0_i__4 I0[10] -pin cur_digit1_i__3 O[10]
load net cur_digit1_i__3_n_6 -attr @rip O[9] -pin cur_digit0_i__4 I0[9] -pin cur_digit1_i__3 O[9]
load net cur_digit1_i__3_n_7 -attr @rip O[8] -pin cur_digit0_i__4 I0[8] -pin cur_digit1_i__3 O[8]
load net cur_digit1_i__3_n_8 -attr @rip O[7] -pin cur_digit0_i__4 I0[7] -pin cur_digit1_i__3 O[7]
load net cur_digit1_i__3_n_9 -attr @rip O[6] -pin cur_digit0_i__4 I0[6] -pin cur_digit1_i__3 O[6]
load net cur_digit1_i__4_n_0 -attr @rip O[12] -pin cur_digit0_i__5 I0[12] -pin cur_digit1_i__4 O[12]
load net cur_digit1_i__4_n_1 -attr @rip O[11] -pin cur_digit0_i__5 I0[11] -pin cur_digit1_i__4 O[11]
load net cur_digit1_i__4_n_10 -attr @rip O[2] -pin cur_digit0_i__5 I0[2] -pin cur_digit1_i__4 O[2]
load net cur_digit1_i__4_n_11 -attr @rip O[1] -pin cur_digit0_i__5 I0[1] -pin cur_digit1_i__4 O[1]
load net cur_digit1_i__4_n_12 -attr @rip O[0] -pin cur_digit0_i__5 I0[0] -pin cur_digit1_i__4 O[0]
load net cur_digit1_i__4_n_2 -attr @rip O[10] -pin cur_digit0_i__5 I0[10] -pin cur_digit1_i__4 O[10]
load net cur_digit1_i__4_n_3 -attr @rip O[9] -pin cur_digit0_i__5 I0[9] -pin cur_digit1_i__4 O[9]
load net cur_digit1_i__4_n_4 -attr @rip O[8] -pin cur_digit0_i__5 I0[8] -pin cur_digit1_i__4 O[8]
load net cur_digit1_i__4_n_5 -attr @rip O[7] -pin cur_digit0_i__5 I0[7] -pin cur_digit1_i__4 O[7]
load net cur_digit1_i__4_n_6 -attr @rip O[6] -pin cur_digit0_i__5 I0[6] -pin cur_digit1_i__4 O[6]
load net cur_digit1_i__4_n_7 -attr @rip O[5] -pin cur_digit0_i__5 I0[5] -pin cur_digit1_i__4 O[5]
load net cur_digit1_i__4_n_8 -attr @rip O[4] -pin cur_digit0_i__5 I0[4] -pin cur_digit1_i__4 O[4]
load net cur_digit1_i__4_n_9 -attr @rip O[3] -pin cur_digit0_i__5 I0[3] -pin cur_digit1_i__4 O[3]
load net cur_digit1_i__5_n_0 -attr @rip O[8] -pin cur_digit0_i__6 I0[8] -pin cur_digit1_i__5 O[8]
load net cur_digit1_i__5_n_1 -attr @rip O[7] -pin cur_digit0_i__6 I0[7] -pin cur_digit1_i__5 O[7]
load net cur_digit1_i__5_n_2 -attr @rip O[6] -pin cur_digit0_i__6 I0[6] -pin cur_digit1_i__5 O[6]
load net cur_digit1_i__5_n_3 -attr @rip O[5] -pin cur_digit0_i__6 I0[5] -pin cur_digit1_i__5 O[5]
load net cur_digit1_i__5_n_4 -attr @rip O[4] -pin cur_digit0_i__6 I0[4] -pin cur_digit1_i__5 O[4]
load net cur_digit1_i__5_n_5 -attr @rip O[3] -pin cur_digit0_i__6 I0[3] -pin cur_digit1_i__5 O[3]
load net cur_digit1_i__5_n_6 -attr @rip O[2] -pin cur_digit0_i__6 I0[2] -pin cur_digit1_i__5 O[2]
load net cur_digit1_i__5_n_7 -attr @rip O[1] -pin cur_digit0_i__6 I0[1] -pin cur_digit1_i__5 O[1]
load net cur_digit1_i__5_n_8 -attr @rip O[0] -pin cur_digit0_i__6 I0[0] -pin cur_digit1_i__5 O[0]
load net cur_digit[0] -attr @rip O[0] -pin cur_digit_i__0 O[0] -pin seg0_i A[0]
load net cur_digit[1] -attr @rip O[1] -pin cur_digit_i__0 O[1] -pin seg0_i A[1]
load net cur_digit[2] -attr @rip O[2] -pin cur_digit_i__0 O[2] -pin seg0_i A[2]
load net cur_digit[3] -attr @rip O[3] -pin cur_digit_i__0 O[3] -pin seg0_i A[3]
load net cur_digit_i_n_0 -attr @rip O[3] -pin cur_digit_i O[3] -pin cur_digit_i__0 I7[3]
load net cur_digit_i_n_1 -attr @rip O[2] -pin cur_digit_i O[2] -pin cur_digit_i__0 I7[2]
load net cur_digit_i_n_2 -attr @rip O[1] -pin cur_digit_i O[1] -pin cur_digit_i__0 I7[1]
load net cur_digit_i_n_3 -attr @rip O[0] -pin cur_digit_i O[0] -pin cur_digit_i__0 I7[0]
load net cur_minus -pin cur_minus_i O -pin seg_i S
netloc cur_minus 1 8 1 2540 360n
load net led[0] -attr @rip wb_data_out[0] -pin abs_value1_i I0[0] -pin abs_value_i I1[0] -port led[0] -pin u_pipe wb_data_out[0]
load net led[10] -attr @rip wb_data_out[10] -pin abs_value1_i I0[10] -pin abs_value_i I1[10] -port led[10] -pin u_pipe wb_data_out[10]
load net led[11] -attr @rip wb_data_out[11] -pin abs_value1_i I0[11] -pin abs_value_i I1[11] -port led[11] -pin u_pipe wb_data_out[11]
load net led[12] -attr @rip wb_data_out[12] -pin abs_value1_i I0[12] -pin abs_value_i I1[12] -port led[12] -pin u_pipe wb_data_out[12]
load net led[13] -attr @rip wb_data_out[13] -pin abs_value1_i I0[13] -pin abs_value_i I1[13] -port led[13] -pin u_pipe wb_data_out[13]
load net led[14] -attr @rip wb_data_out[14] -pin abs_value1_i I0[14] -pin abs_value_i I1[14] -port led[14] -pin u_pipe wb_data_out[14]
load net led[15] -attr @rip wb_data_out[15] -pin abs_value1_i I0[15] -pin abs_value_i I1[15] -port led[15] -pin u_pipe wb_data_out[15]
load net led[1] -attr @rip wb_data_out[1] -pin abs_value1_i I0[1] -pin abs_value_i I1[1] -port led[1] -pin u_pipe wb_data_out[1]
load net led[2] -attr @rip wb_data_out[2] -pin abs_value1_i I0[2] -pin abs_value_i I1[2] -port led[2] -pin u_pipe wb_data_out[2]
load net led[3] -attr @rip wb_data_out[3] -pin abs_value1_i I0[3] -pin abs_value_i I1[3] -port led[3] -pin u_pipe wb_data_out[3]
load net led[4] -attr @rip wb_data_out[4] -pin abs_value1_i I0[4] -pin abs_value_i I1[4] -port led[4] -pin u_pipe wb_data_out[4]
load net led[5] -attr @rip wb_data_out[5] -pin abs_value1_i I0[5] -pin abs_value_i I1[5] -port led[5] -pin u_pipe wb_data_out[5]
load net led[6] -attr @rip wb_data_out[6] -pin abs_value1_i I0[6] -pin abs_value_i I1[6] -port led[6] -pin u_pipe wb_data_out[6]
load net led[7] -attr @rip wb_data_out[7] -pin abs_value1_i I0[7] -pin abs_value_i I1[7] -port led[7] -pin u_pipe wb_data_out[7]
load net led[8] -attr @rip wb_data_out[8] -pin abs_value1_i I0[8] -pin abs_value_i I1[8] -port led[8] -pin u_pipe wb_data_out[8]
load net led[9] -attr @rip wb_data_out[9] -pin abs_value1_i I0[9] -pin abs_value_i I1[9] -port led[9] -pin u_pipe wb_data_out[9]
load net reset -port reset -pin scan_counter_i__0 S -pin scan_sel_i__0 S -pin u_clk_div reset -pin u_pipe reset
netloc reset 1 0 9 NJ 1050 NJ 1050 NJ 1050N 820 1140 NJ 1140N N 1140 NJ 1140 2310 1060 2540J
load net scan_counter0[0] -attr @rip O[0] -pin scan_counter0_i O[0] -pin scan_counter_i I1[0]
load net scan_counter0[10] -attr @rip O[10] -pin scan_counter0_i O[10] -pin scan_counter_i I1[10]
load net scan_counter0[11] -attr @rip O[11] -pin scan_counter0_i O[11] -pin scan_counter_i I1[11]
load net scan_counter0[12] -attr @rip O[12] -pin scan_counter0_i O[12] -pin scan_counter_i I1[12]
load net scan_counter0[13] -attr @rip O[13] -pin scan_counter0_i O[13] -pin scan_counter_i I1[13]
load net scan_counter0[14] -attr @rip O[14] -pin scan_counter0_i O[14] -pin scan_counter_i I1[14]
load net scan_counter0[15] -attr @rip O[15] -pin scan_counter0_i O[15] -pin scan_counter_i I1[15]
load net scan_counter0[16] -attr @rip O[16] -pin scan_counter0_i O[16] -pin scan_counter_i I1[16]
load net scan_counter0[1] -attr @rip O[1] -pin scan_counter0_i O[1] -pin scan_counter_i I1[1]
load net scan_counter0[2] -attr @rip O[2] -pin scan_counter0_i O[2] -pin scan_counter_i I1[2]
load net scan_counter0[3] -attr @rip O[3] -pin scan_counter0_i O[3] -pin scan_counter_i I1[3]
load net scan_counter0[4] -attr @rip O[4] -pin scan_counter0_i O[4] -pin scan_counter_i I1[4]
load net scan_counter0[5] -attr @rip O[5] -pin scan_counter0_i O[5] -pin scan_counter_i I1[5]
load net scan_counter0[6] -attr @rip O[6] -pin scan_counter0_i O[6] -pin scan_counter_i I1[6]
load net scan_counter0[7] -attr @rip O[7] -pin scan_counter0_i O[7] -pin scan_counter_i I1[7]
load net scan_counter0[8] -attr @rip O[8] -pin scan_counter0_i O[8] -pin scan_counter_i I1[8]
load net scan_counter0[9] -attr @rip O[9] -pin scan_counter0_i O[9] -pin scan_counter_i I1[9]
load net scan_counter0_out[0] -attr @rip O[0] -pin scan_counter_i O[0] -pin scan_counter_reg[16:0] D[0]
load net scan_counter0_out[10] -attr @rip O[10] -pin scan_counter_i O[10] -pin scan_counter_reg[16:0] D[10]
load net scan_counter0_out[11] -attr @rip O[11] -pin scan_counter_i O[11] -pin scan_counter_reg[16:0] D[11]
load net scan_counter0_out[12] -attr @rip O[12] -pin scan_counter_i O[12] -pin scan_counter_reg[16:0] D[12]
load net scan_counter0_out[13] -attr @rip O[13] -pin scan_counter_i O[13] -pin scan_counter_reg[16:0] D[13]
load net scan_counter0_out[14] -attr @rip O[14] -pin scan_counter_i O[14] -pin scan_counter_reg[16:0] D[14]
load net scan_counter0_out[15] -attr @rip O[15] -pin scan_counter_i O[15] -pin scan_counter_reg[16:0] D[15]
load net scan_counter0_out[16] -attr @rip O[16] -pin scan_counter_i O[16] -pin scan_counter_reg[16:0] D[16]
load net scan_counter0_out[1] -attr @rip O[1] -pin scan_counter_i O[1] -pin scan_counter_reg[16:0] D[1]
load net scan_counter0_out[2] -attr @rip O[2] -pin scan_counter_i O[2] -pin scan_counter_reg[16:0] D[2]
load net scan_counter0_out[3] -attr @rip O[3] -pin scan_counter_i O[3] -pin scan_counter_reg[16:0] D[3]
load net scan_counter0_out[4] -attr @rip O[4] -pin scan_counter_i O[4] -pin scan_counter_reg[16:0] D[4]
load net scan_counter0_out[5] -attr @rip O[5] -pin scan_counter_i O[5] -pin scan_counter_reg[16:0] D[5]
load net scan_counter0_out[6] -attr @rip O[6] -pin scan_counter_i O[6] -pin scan_counter_reg[16:0] D[6]
load net scan_counter0_out[7] -attr @rip O[7] -pin scan_counter_i O[7] -pin scan_counter_reg[16:0] D[7]
load net scan_counter0_out[8] -attr @rip O[8] -pin scan_counter_i O[8] -pin scan_counter_reg[16:0] D[8]
load net scan_counter0_out[9] -attr @rip O[9] -pin scan_counter_i O[9] -pin scan_counter_reg[16:0] D[9]
load net scan_counter[0] -attr @rip 0 -pin scan_counter0_i I0[0] -pin scan_counter_i S[0] -pin scan_counter_reg[16:0] Q[0] -pin scan_sel_i A[0]
load net scan_counter[10] -attr @rip 10 -pin scan_counter0_i I0[10] -pin scan_counter_i S[10] -pin scan_counter_reg[16:0] Q[10] -pin scan_sel_i A[10]
load net scan_counter[11] -attr @rip 11 -pin scan_counter0_i I0[11] -pin scan_counter_i S[11] -pin scan_counter_reg[16:0] Q[11] -pin scan_sel_i A[11]
load net scan_counter[12] -attr @rip 12 -pin scan_counter0_i I0[12] -pin scan_counter_i S[12] -pin scan_counter_reg[16:0] Q[12] -pin scan_sel_i A[12]
load net scan_counter[13] -attr @rip 13 -pin scan_counter0_i I0[13] -pin scan_counter_i S[13] -pin scan_counter_reg[16:0] Q[13] -pin scan_sel_i A[13]
load net scan_counter[14] -attr @rip 14 -pin scan_counter0_i I0[14] -pin scan_counter_i S[14] -pin scan_counter_reg[16:0] Q[14] -pin scan_sel_i A[14]
load net scan_counter[15] -attr @rip 15 -pin scan_counter0_i I0[15] -pin scan_counter_i S[15] -pin scan_counter_reg[16:0] Q[15] -pin scan_sel_i A[15]
load net scan_counter[16] -attr @rip 16 -pin scan_counter0_i I0[16] -pin scan_counter_i S[16] -pin scan_counter_reg[16:0] Q[16] -pin scan_sel_i A[16]
load net scan_counter[1] -attr @rip 1 -pin scan_counter0_i I0[1] -pin scan_counter_i S[1] -pin scan_counter_reg[16:0] Q[1] -pin scan_sel_i A[1]
load net scan_counter[2] -attr @rip 2 -pin scan_counter0_i I0[2] -pin scan_counter_i S[2] -pin scan_counter_reg[16:0] Q[2] -pin scan_sel_i A[2]
load net scan_counter[3] -attr @rip 3 -pin scan_counter0_i I0[3] -pin scan_counter_i S[3] -pin scan_counter_reg[16:0] Q[3] -pin scan_sel_i A[3]
load net scan_counter[4] -attr @rip 4 -pin scan_counter0_i I0[4] -pin scan_counter_i S[4] -pin scan_counter_reg[16:0] Q[4] -pin scan_sel_i A[4]
load net scan_counter[5] -attr @rip 5 -pin scan_counter0_i I0[5] -pin scan_counter_i S[5] -pin scan_counter_reg[16:0] Q[5] -pin scan_sel_i A[5]
load net scan_counter[6] -attr @rip 6 -pin scan_counter0_i I0[6] -pin scan_counter_i S[6] -pin scan_counter_reg[16:0] Q[6] -pin scan_sel_i A[6]
load net scan_counter[7] -attr @rip 7 -pin scan_counter0_i I0[7] -pin scan_counter_i S[7] -pin scan_counter_reg[16:0] Q[7] -pin scan_sel_i A[7]
load net scan_counter[8] -attr @rip 8 -pin scan_counter0_i I0[8] -pin scan_counter_i S[8] -pin scan_counter_reg[16:0] Q[8] -pin scan_sel_i A[8]
load net scan_counter[9] -attr @rip 9 -pin scan_counter0_i I0[9] -pin scan_counter_i S[9] -pin scan_counter_reg[16:0] Q[9] -pin scan_sel_i A[9]
load net scan_counter__0 -pin scan_counter_i__0 O -pin scan_counter_reg[16:0] RST
netloc scan_counter__0 1 3 1 800 750n
load net scan_sel0[0] -attr @rip O[0] -pin scan_sel0_i O[0] -pin scan_sel_reg[2:0] D[0]
load net scan_sel0[1] -attr @rip O[1] -pin scan_sel0_i O[1] -pin scan_sel_reg[2:0] D[1]
load net scan_sel0[2] -attr @rip O[2] -pin scan_sel0_i O[2] -pin scan_sel_reg[2:0] D[2]
load net scan_sel[0] -attr @rip 0 -pin an_i A[0] -pin cur_digit_i__0 S[0] -pin cur_minus_i S[0] -pin scan_sel0_i I0[0] -pin scan_sel_reg[2:0] Q[0]
load net scan_sel[1] -attr @rip 1 -pin an_i A[1] -pin cur_digit_i__0 S[1] -pin cur_minus_i S[1] -pin scan_sel0_i I0[1] -pin scan_sel_reg[2:0] Q[1]
load net scan_sel[2] -attr @rip 2 -pin an_i A[2] -pin cur_digit_i__0 S[2] -pin cur_minus_i S[2] -pin scan_sel0_i I0[2] -pin scan_sel_reg[2:0] Q[2]
load net scan_sel__0 -pin scan_sel_i O -pin scan_sel_reg[2:0] CE
netloc scan_sel__0 1 5 1 1550 850n
load net scan_sel_i__0_n_0 -pin scan_sel_i__0 O -pin scan_sel_reg[2:0] RST
netloc scan_sel_i__0_n_0 1 5 1 1590 850n
load net seg0_i_n_0 -attr @rip O[6] -pin seg0_i O[6] -pin seg_i I1[6]
load net seg0_i_n_1 -attr @rip O[5] -pin seg0_i O[5] -pin seg_i I1[5]
load net seg0_i_n_2 -attr @rip O[4] -pin seg0_i O[4] -pin seg_i I1[4]
load net seg0_i_n_3 -attr @rip O[3] -pin seg0_i O[3] -pin seg_i I1[3]
load net seg0_i_n_4 -attr @rip O[2] -pin seg0_i O[2] -pin seg_i I1[2]
load net seg0_i_n_5 -attr @rip O[1] -pin seg0_i O[1] -pin seg_i I1[1]
load net seg0_i_n_6 -attr @rip O[0] -pin seg0_i O[0] -pin seg_i I1[0]
load net seg[0] -attr @rip O[0] -port seg[0] -pin seg_i O[0]
load net seg[1] -attr @rip O[1] -port seg[1] -pin seg_i O[1]
load net seg[2] -attr @rip O[2] -port seg[2] -pin seg_i O[2]
load net seg[3] -attr @rip O[3] -port seg[3] -pin seg_i O[3]
load net seg[4] -attr @rip O[4] -port seg[4] -pin seg_i O[4]
load net seg[5] -attr @rip O[5] -port seg[5] -pin seg_i O[5]
load net seg[6] -attr @rip O[6] -port seg[6] -pin seg_i O[6]
load net wb_data_display[16] -attr @rip wb_data_out[16] -pin abs_value1_i I0[16] -pin abs_value_i I1[16] -pin u_pipe wb_data_out[16]
load net wb_data_display[17] -attr @rip wb_data_out[17] -pin abs_value1_i I0[17] -pin abs_value_i I1[17] -pin u_pipe wb_data_out[17]
load net wb_data_display[18] -attr @rip wb_data_out[18] -pin abs_value1_i I0[18] -pin abs_value_i I1[18] -pin u_pipe wb_data_out[18]
load net wb_data_display[19] -attr @rip wb_data_out[19] -pin abs_value1_i I0[19] -pin abs_value_i I1[19] -pin u_pipe wb_data_out[19]
load net wb_data_display[20] -attr @rip wb_data_out[20] -pin abs_value1_i I0[20] -pin abs_value_i I1[20] -pin u_pipe wb_data_out[20]
load net wb_data_display[21] -attr @rip wb_data_out[21] -pin abs_value1_i I0[21] -pin abs_value_i I1[21] -pin u_pipe wb_data_out[21]
load net wb_data_display[22] -attr @rip wb_data_out[22] -pin abs_value1_i I0[22] -pin abs_value_i I1[22] -pin u_pipe wb_data_out[22]
load net wb_data_display[23] -attr @rip wb_data_out[23] -pin abs_value1_i I0[23] -pin abs_value_i I1[23] -pin u_pipe wb_data_out[23]
load net wb_data_display[24] -attr @rip wb_data_out[24] -pin abs_value1_i I0[24] -pin abs_value_i I1[24] -pin u_pipe wb_data_out[24]
load net wb_data_display[25] -attr @rip wb_data_out[25] -pin abs_value1_i I0[25] -pin abs_value_i I1[25] -pin u_pipe wb_data_out[25]
load net wb_data_display[26] -attr @rip wb_data_out[26] -pin abs_value1_i I0[26] -pin abs_value_i I1[26] -pin u_pipe wb_data_out[26]
load net wb_data_display[27] -attr @rip wb_data_out[27] -pin abs_value1_i I0[27] -pin abs_value_i I1[27] -pin u_pipe wb_data_out[27]
load net wb_data_display[28] -attr @rip wb_data_out[28] -pin abs_value1_i I0[28] -pin abs_value_i I1[28] -pin u_pipe wb_data_out[28]
load net wb_data_display[29] -attr @rip wb_data_out[29] -pin abs_value1_i I0[29] -pin abs_value_i I1[29] -pin u_pipe wb_data_out[29]
load net wb_data_display[30] -attr @rip wb_data_out[30] -pin abs_value1_i I0[30] -pin abs_value_i I1[30] -pin u_pipe wb_data_out[30]
load net wb_data_display[31] -attr @rip wb_data_out[31] -pin abs_value1_i I0[31] -pin abs_value_i S -pin abs_value_i I1[31] -pin cur_digit_i S -pin cur_minus_i I7 -pin u_pipe wb_data_out[31]
load netBundle @an 8 an[7] an[6] an[5] an[4] an[3] an[2] an[1] an[0] -autobundled
netbloc @an 1 9 1 NJ 480
load netBundle @led 16 led[15] led[14] led[13] led[12] led[11] led[10] led[9] led[8] led[7] led[6] led[5] led[4] led[3] led[2] led[1] led[0] -autobundled
netbloc @led 1 0 10 20 660 NJ 660 470 700 NJ 700 NJ 700 1550J 710 NJ 710 NJ 710 NJ 710 2950
load netBundle @seg 7 seg[6] seg[5] seg[4] seg[3] seg[2] seg[1] seg[0] -autobundled
netbloc @seg 1 9 1 NJ 590
load netBundle @abs_value0 32 abs_value0[31] abs_value0[30] abs_value0[29] abs_value0[28] abs_value0[27] abs_value0[26] abs_value0[25] abs_value0[24] abs_value0[23] abs_value0[22] abs_value0[21] abs_value0[20] abs_value0[19] abs_value0[18] abs_value0[17] abs_value0[16] abs_value0[15] abs_value0[14] abs_value0[13] abs_value0[12] abs_value0[11] abs_value0[10] abs_value0[9] abs_value0[8] abs_value0[7] abs_value0[6] abs_value0[5] abs_value0[4] abs_value0[3] abs_value0[2] abs_value0[1] abs_value0[0] -autobundled
netbloc @abs_value0 1 2 1 NJ 610
load netBundle @abs_value1 32 abs_value1[31] abs_value1[30] abs_value1[29] abs_value1[28] abs_value1[27] abs_value1[26] abs_value1[25] abs_value1[24] abs_value1[23] abs_value1[22] abs_value1[21] abs_value1[20] abs_value1[19] abs_value1[18] abs_value1[17] abs_value1[16] abs_value1[15] abs_value1[14] abs_value1[13] abs_value1[12] abs_value1[11] abs_value1[10] abs_value1[9] abs_value1[8] abs_value1[7] abs_value1[6] abs_value1[5] abs_value1[4] abs_value1[3] abs_value1[2] abs_value1[1] abs_value1[0] -autobundled
netbloc @abs_value1 1 1 1 220 620n
load netBundle @abs_value 32 abs_value[31] abs_value[30] abs_value[29] abs_value[28] abs_value[27] abs_value[26] abs_value[25] abs_value[24] abs_value[23] abs_value[22] abs_value[21] abs_value[20] abs_value[19] abs_value[18] abs_value[17] abs_value[16] abs_value[15] abs_value[14] abs_value[13] abs_value[12] abs_value[11] abs_value[10] abs_value[9] abs_value[8] abs_value[7] abs_value[6] abs_value[5] abs_value[4] abs_value[3] abs_value[2] abs_value[1] abs_value[0] -autobundled
netbloc @abs_value 1 3 3 800 550 1180 560 NJ
load netBundle @cur_digit0 4 cur_digit0[3] cur_digit0[2] cur_digit0[1] cur_digit0[0] -autobundled
netbloc @cur_digit0 1 6 1 1930 290n
load netBundle @cur_digit0_i__0_n_ 4 cur_digit0_i__0_n_0 cur_digit0_i__0_n_1 cur_digit0_i__0_n_2 cur_digit0_i__0_n_3 -autobundled
netbloc @cur_digit0_i__0_n_ 1 6 1 2010 70n
load netBundle @cur_digit0_i__1_n_ 4 cur_digit0_i__1_n_0 cur_digit0_i__1_n_1 cur_digit0_i__1_n_2 cur_digit0_i__1_n_3 -autobundled
netbloc @cur_digit0_i__1_n_ 1 6 1 1990 160n
load netBundle @cur_digit0_i__2_n_ 4 cur_digit0_i__2_n_0 cur_digit0_i__2_n_1 cur_digit0_i__2_n_2 cur_digit0_i__2_n_3 -autobundled
netbloc @cur_digit0_i__2_n_ 1 6 1 1950 250n
load netBundle @cur_digit0_i__3_n_ 4 cur_digit0_i__3_n_0 cur_digit0_i__3_n_1 cur_digit0_i__3_n_2 cur_digit0_i__3_n_3 -autobundled
netbloc @cur_digit0_i__3_n_ 1 6 1 1910 340n
load netBundle @cur_digit0_i__4_n_ 4 cur_digit0_i__4_n_0 cur_digit0_i__4_n_1 cur_digit0_i__4_n_2 cur_digit0_i__4_n_3 -autobundled
netbloc @cur_digit0_i__4_n_ 1 6 1 1950 390n
load netBundle @cur_digit0_i__5_n_ 4 cur_digit0_i__5_n_0 cur_digit0_i__5_n_1 cur_digit0_i__5_n_2 cur_digit0_i__5_n_3 -autobundled
netbloc @cur_digit0_i__5_n_ 1 6 1 1990 410n
load netBundle @cur_digit0_i__6_n_ 4 cur_digit0_i__6_n_0 cur_digit0_i__6_n_1 cur_digit0_i__6_n_2 cur_digit0_i__6_n_3 -autobundled
netbloc @cur_digit0_i__6_n_ 1 5 1 NJ 450
load netBundle @cur_digit1 29 cur_digit1[28] cur_digit1[27] cur_digit1[26] cur_digit1[25] cur_digit1[24] cur_digit1[23] cur_digit1[22] cur_digit1[21] cur_digit1[20] cur_digit1[19] cur_digit1[18] cur_digit1[17] cur_digit1[16] cur_digit1[15] cur_digit1[14] cur_digit1[13] cur_digit1[12] cur_digit1[11] cur_digit1[10] cur_digit1[9] cur_digit1[8] cur_digit1[7] cur_digit1[6] cur_digit1[5] cur_digit1[4] cur_digit1[3] cur_digit1[2] cur_digit1[1] cur_digit1[0] -autobundled
netbloc @cur_digit1 1 5 1 N 60
load netBundle @cur_digit1_i__0_n_ 26 cur_digit1_i__0_n_0 cur_digit1_i__0_n_1 cur_digit1_i__0_n_2 cur_digit1_i__0_n_3 cur_digit1_i__0_n_4 cur_digit1_i__0_n_5 cur_digit1_i__0_n_6 cur_digit1_i__0_n_7 cur_digit1_i__0_n_8 cur_digit1_i__0_n_9 cur_digit1_i__0_n_10 cur_digit1_i__0_n_11 cur_digit1_i__0_n_12 cur_digit1_i__0_n_13 cur_digit1_i__0_n_14 cur_digit1_i__0_n_15 cur_digit1_i__0_n_16 cur_digit1_i__0_n_17 cur_digit1_i__0_n_18 cur_digit1_i__0_n_19 cur_digit1_i__0_n_20 cur_digit1_i__0_n_21 cur_digit1_i__0_n_22 cur_digit1_i__0_n_23 cur_digit1_i__0_n_24 cur_digit1_i__0_n_25 -autobundled
netbloc @cur_digit1_i__0_n_ 1 5 1 N 150
load netBundle @cur_digit1_i__1_n_ 23 cur_digit1_i__1_n_0 cur_digit1_i__1_n_1 cur_digit1_i__1_n_2 cur_digit1_i__1_n_3 cur_digit1_i__1_n_4 cur_digit1_i__1_n_5 cur_digit1_i__1_n_6 cur_digit1_i__1_n_7 cur_digit1_i__1_n_8 cur_digit1_i__1_n_9 cur_digit1_i__1_n_10 cur_digit1_i__1_n_11 cur_digit1_i__1_n_12 cur_digit1_i__1_n_13 cur_digit1_i__1_n_14 cur_digit1_i__1_n_15 cur_digit1_i__1_n_16 cur_digit1_i__1_n_17 cur_digit1_i__1_n_18 cur_digit1_i__1_n_19 cur_digit1_i__1_n_20 cur_digit1_i__1_n_21 cur_digit1_i__1_n_22 -autobundled
netbloc @cur_digit1_i__1_n_ 1 5 1 N 240
load netBundle @cur_digit1_i__2_n_ 19 cur_digit1_i__2_n_0 cur_digit1_i__2_n_1 cur_digit1_i__2_n_2 cur_digit1_i__2_n_3 cur_digit1_i__2_n_4 cur_digit1_i__2_n_5 cur_digit1_i__2_n_6 cur_digit1_i__2_n_7 cur_digit1_i__2_n_8 cur_digit1_i__2_n_9 cur_digit1_i__2_n_10 cur_digit1_i__2_n_11 cur_digit1_i__2_n_12 cur_digit1_i__2_n_13 cur_digit1_i__2_n_14 cur_digit1_i__2_n_15 cur_digit1_i__2_n_16 cur_digit1_i__2_n_17 cur_digit1_i__2_n_18 -autobundled
netbloc @cur_digit1_i__2_n_ 1 5 1 N 330
load netBundle @cur_digit1_i__3_n_ 16 cur_digit1_i__3_n_0 cur_digit1_i__3_n_1 cur_digit1_i__3_n_2 cur_digit1_i__3_n_3 cur_digit1_i__3_n_4 cur_digit1_i__3_n_5 cur_digit1_i__3_n_6 cur_digit1_i__3_n_7 cur_digit1_i__3_n_8 cur_digit1_i__3_n_9 cur_digit1_i__3_n_10 cur_digit1_i__3_n_11 cur_digit1_i__3_n_12 cur_digit1_i__3_n_13 cur_digit1_i__3_n_14 cur_digit1_i__3_n_15 -autobundled
netbloc @cur_digit1_i__3_n_ 1 5 1 1570 630n
load netBundle @cur_digit1_i__4_n_ 13 cur_digit1_i__4_n_0 cur_digit1_i__4_n_1 cur_digit1_i__4_n_2 cur_digit1_i__4_n_3 cur_digit1_i__4_n_4 cur_digit1_i__4_n_5 cur_digit1_i__4_n_6 cur_digit1_i__4_n_7 cur_digit1_i__4_n_8 cur_digit1_i__4_n_9 cur_digit1_i__4_n_10 cur_digit1_i__4_n_11 cur_digit1_i__4_n_12 -autobundled
netbloc @cur_digit1_i__4_n_ 1 5 1 N 750
load netBundle @cur_digit1_i__5_n_ 9 cur_digit1_i__5_n_0 cur_digit1_i__5_n_1 cur_digit1_i__5_n_2 cur_digit1_i__5_n_3 cur_digit1_i__5_n_4 cur_digit1_i__5_n_5 cur_digit1_i__5_n_6 cur_digit1_i__5_n_7 cur_digit1_i__5_n_8 -autobundled
netbloc @cur_digit1_i__5_n_ 1 4 1 NJ 440
load netBundle @cur_digit_i_n_ 4 cur_digit_i_n_0 cur_digit_i_n_1 cur_digit_i_n_2 cur_digit_i_n_3 -autobundled
netbloc @cur_digit_i_n_ 1 6 1 1970 430n
load netBundle @cur_digit 4 cur_digit[3] cur_digit[2] cur_digit[1] cur_digit[0] -autobundled
netbloc @cur_digit 1 7 1 2270 360n
load netBundle @scan_counter0 17 scan_counter0[16] scan_counter0[15] scan_counter0[14] scan_counter0[13] scan_counter0[12] scan_counter0[11] scan_counter0[10] scan_counter0[9] scan_counter0[8] scan_counter0[7] scan_counter0[6] scan_counter0[5] scan_counter0[4] scan_counter0[3] scan_counter0[2] scan_counter0[1] scan_counter0[0] -autobundled
netbloc @scan_counter0 1 2 1 NJ 830
load netBundle @scan_counter0_out 17 scan_counter0_out[16] scan_counter0_out[15] scan_counter0_out[14] scan_counter0_out[13] scan_counter0_out[12] scan_counter0_out[11] scan_counter0_out[10] scan_counter0_out[9] scan_counter0_out[8] scan_counter0_out[7] scan_counter0_out[6] scan_counter0_out[5] scan_counter0_out[4] scan_counter0_out[3] scan_counter0_out[2] scan_counter0_out[1] scan_counter0_out[0] -autobundled
netbloc @scan_counter0_out 1 3 1 N 820
load netBundle @scan_sel0 3 scan_sel0[2] scan_sel0[1] scan_sel0[0] -autobundled
netbloc @scan_sel0 1 5 1 1610J 940n
load netBundle @seg0_i_n_ 7 seg0_i_n_0 seg0_i_n_1 seg0_i_n_2 seg0_i_n_3 seg0_i_n_4 seg0_i_n_5 seg0_i_n_6 -autobundled
netbloc @seg0_i_n_ 1 8 1 NJ 600
load netBundle @wb_data_display 16 wb_data_display[31] wb_data_display[30] wb_data_display[29] wb_data_display[28] wb_data_display[27] wb_data_display[26] wb_data_display[25] wb_data_display[24] wb_data_display[23] wb_data_display[22] wb_data_display[21] wb_data_display[20] wb_data_display[19] wb_data_display[18] wb_data_display[17] wb_data_display[16] -autobundled
netbloc @wb_data_display 1 0 10 20 740 NJ 740 450 680N 820 680 NJ 680 1550J 500N 2030J 500 2290 830 NJ 830 2930
load netBundle @scan_sel 3 scan_sel[2] scan_sel[1] scan_sel[0] -autobundled
netbloc @scan_sel 1 4 5 1200 1020 NJ 1020 2010 480N N 480N NJ
load netBundle @scan_counter 17 scan_counter[16] scan_counter[15] scan_counter[14] scan_counter[13] scan_counter[12] scan_counter[11] scan_counter[10] scan_counter[9] scan_counter[8] scan_counter[7] scan_counter[6] scan_counter[5] scan_counter[4] scan_counter[3] scan_counter[2] scan_counter[1] scan_counter[0] -autobundled
netbloc @scan_counter 1 1 4 220 880 NJ 880N N 880 1180
levelinfo -pg 1 0 100 300 680 970 1410 1740 2150 2410 2740 2980
pagesize -pg 1 -db -bbox -sgen -80 0 3090 1170
show
zoom 0.390625
scrollpos -275 -106
#
# initialize ictrl to current module top_fpga work:top_fpga:NOFILE
ictrl init topinfo |
