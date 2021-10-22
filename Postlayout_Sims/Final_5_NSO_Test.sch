v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 80 -80 80 -60 { lab=GND}
N 80 -170 80 -140 { lab=#net1}
N 80 -180 190 -180 { lab=#net1}
N 140 -140 140 -130 { lab=#net2}
N 140 -140 190 -140 { lab=#net2}
N 140 -70 140 -50 { lab=GND}
N 80 -60 80 -50 { lab=GND}
N 140 -50 140 -40 { lab=GND}
N 140 -40 140 -30 { lab=GND}
N 80 -180 80 -170 { lab=#net1}
N 180 -160 190 -160 { lab=#net1}
N 180 -180 180 -160 { lab=#net1}
N 190 -120 190 -50 { lab=GND}
N 490 -180 540 -180 { lab=CLK}
C {Anchit_Tests/Final_5_NSO.sym} 340 -150 0 0 {name=x1}
C {vsource.sym} 80 -110 0 0 {name=V1 value=1.8}
C {gnd.sym} 140 -40 0 0 {name=l2 lab=GND}
C {vsource.sym} 140 -100 0 0 {name=V2 value=Vct}
C {lab_pin.sym} 540 -180 2 0 {name=l4 sig_type=std_logic lab=CLK}
C {code.sym} 40 -550 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/tt/nonfet.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/all.spice 
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/pfet_01v8_lvt/sky130_fd_pr__pfet_01v8_lvt__tt.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/nfet_01v8_lvt/sky130_fd_pr__nfet_01v8_lvt__tt.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/pfet_01v8_lvt/sky130_fd_pr__pfet_01v8_lvt__mismatch.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/nfet_01v8_lvt/sky130_fd_pr__nfet_01v8_lvt__mismatch.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/pfet_01v8/sky130_fd_pr__pfet_01v8__tt.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/nfet_01v8/sky130_fd_pr__nfet_01v8__tt.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/pfet_01v8/sky130_fd_pr__pfet_01v8__mismatch.corner.spice
.include /home/foundry/skywater_pdk/skywater-pdk/libraries/sky130_fd_pr/latest/cells/nfet_01v8/sky130_fd_pr__nfet_01v8__mismatch.corner.spice
.param mc_mm_switch=0
.param mc_pr_switch=0
"
spice_ignore=false}
C {code_shown.sym} 220 -740 0 0 {name=SPICE 
only_toplevel=false 
value=".include /usr/local/Final_7_Flat.spice
.param Vct=1.6
.IC v(clk)=1.8
.func frequency(t) \{1/t\}
.control
      let v_start=0
      let v_end=1.9
      let v_step=0.2
      let length=(v_end/v_step)+1
      let v_temp=v_start
      let freq=unitvec(length)
      let v_control=unitvec(length)
      let v_map=unitvec(length)
      let count=0
      while v_temp le v_end
            alter V2 v_temp
            let v_control[count]=v_temp
            tran 1000p 200n UIC
            meas tran tdiff TRIG v(clk) VAL=0.9 RISE=20 TARG v(clk) VAL=0.9 RISE=21
            let freq[count]=frequency(tdiff)
            let v_temp=v_temp+v_step
            let count=count+1
            echo after while loop "%loop"
      end
      write Final_5_NSO_Test.raw
      plot freq vs v_control
      plot v(clk)
.endc
.save all"}
C {gnd.sym} 80 -50 0 0 {name=l1 lab=GND}
C {gnd.sym} 190 -50 0 0 {name=l3 lab=GND}
