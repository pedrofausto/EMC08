globalNetConnect VDD -type pgpin -pin vdd* -all -override -verbose
globalNetConnect VDD -type pgpin -pin r*vdd -all -override -verbose
globalNetConnect VDD -type pgpin -pin VDD -all  -override -verbose

globalNetConnect VDDR -type pgpin -pin VDDR -all  -override -verbose
globalNetConnect VDDR -type pgpin -pin VDDO -all  -override -verbose
globalNetConnect VDDR -type pgpin -pin VDDOR -all  -override -verbose

globalNetConnect GND -type pgpin -pin gnd* -all -override -verbose
globalNetConnect GND -type pgpin -pin r*gnd -all -override -verbose

globalNetConnect GND -type pgpin -pin GNDO -all  -override -verbose
globalNetConnect GND -type pgpin -pin GNDR -all  -override -verbose
globalNetConnect GND -type pgpin -pin GNDOR -all  -override -verbose
