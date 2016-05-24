.include "ex1.spice" 
.include "0.25-models.sp"      
                           
Vdd vdd 0 2.5 
Vin in gnd PWL(0n 0v 0.3n 0.25v 0.5n 2.25v 0.6n 2.5v 2.2n 2.5v 2.3n 2.25v 2.5n 0.25v 2.6n 0v)

.measure tran tplh
+trig v(in) val=1.25 fall=1
+targ v(out) val=1.25 rise=1
.measure tran tphl
+trig v(in) val=1.25 rise=1
+targ v(out) val=1.25 fall=1

.measure tran trise
+trig v(out) val=(2.5)*0.1 rise=1
+targ v(out) val=(2.5)*0.9 rise=1
.measure tran tfall
+trig v(out) val=(2.5)*0.9 fall=1
+targ v(out) val=(2.5)*0.1 fall=1


.TRAN 10p 8.5n
.control
plot V(out) V(in)
set hcopydevtype=postscript
set hcopypscolor=true
set color0=rgb:f/f/f
set color1=rgb:0/0/0
hardcopy temp.ps out in
.endc
.end
