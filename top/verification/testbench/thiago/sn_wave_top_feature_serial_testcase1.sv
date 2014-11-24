
set _radixMap("_Struct_") "%a"
set expression {specman_wave.sn_str1[647:0]}

if {[condition find -match exact -name "_Struct_"] != {}} {
 condition delete "_Struct_"
}

if {[condition find -match exact -name "_Struct_"] == {}} {
 condition new -name  "_Struct_" -expr $expression
} else {
 condition set -using "_Struct_" -expr $expression}

set _radixMap("_event_port3_1_rise_") "%a"
set expression {specman_wave.sn_str2[647:0]}

if {[condition find -match exact -name "_event_port3_1_rise_"] != {}} {
 condition delete "_event_port3_1_rise_"
}

if {[condition find -match exact -name "_event_port3_1_rise_"] == {}} {
 condition new -name  "_event_port3_1_rise_" -expr $expression
} else {
 condition set -using "_event_port3_1_rise_" -expr $expression}
if {[group find -match exact -name "sys.env.agent_in.mon"] == {}} {
 group new -name "sys.env.agent_in.mon" -overlay 0
} else {
 group using "sys.env.agent_in.mon"
group set -overlay 0
group clear 0 end
}
group insert \
{_Struct_} \
{_event_port3_1_rise_}

if {[window find -match exact -name "Waveform 1"] == {}} {
	waveform new -name "Waveform 1"
}
window target "Waveform 1" on
waveform using "Waveform 1"

if {[waveform find -match exact -name "sys.env.agent_in.mon" -type group] == {}} {
	waveform add -groups {"sys.env.agent_in.mon"}
}

foreach signalname [array names _radixMap] {
	set cmd [list waveform format $signalname -radix $_radixMap($signalname)]
	catch {eval $cmd} status
	if {[string length $status] > 0} {
		puts "$status: $signalname"
	}
}

set _radixMap("_Struct__2_") "%a"
set expression {specman_wave.sn_str3[647:0]}

if {[condition find -match exact -name "_Struct__2_"] != {}} {
 condition delete "_Struct__2_"
}

if {[condition find -match exact -name "_Struct__2_"] == {}} {
 condition new -name  "_Struct__2_" -expr $expression
} else {
 condition set -using "_Struct__2_" -expr $expression}

set _radixMap("_event_port3_1_fall_") "%a"
set expression {specman_wave.sn_str4[647:0]}

if {[condition find -match exact -name "_event_port3_1_fall_"] != {}} {
 condition delete "_event_port3_1_fall_"
}

if {[condition find -match exact -name "_event_port3_1_fall_"] == {}} {
 condition new -name  "_event_port3_1_fall_" -expr $expression
} else {
 condition set -using "_event_port3_1_fall_" -expr $expression}
if {[group find -match exact -name "sys.env.agent_in.mon__2"] == {}} {
 group new -name "sys.env.agent_in.mon__2" -overlay 0
} else {
 group using "sys.env.agent_in.mon__2"
group set -overlay 0
group clear 0 end
}
group insert \
{_Struct__2_} \
{_event_port3_1_fall_}

if {[window find -match exact -name "Waveform 1"] == {}} {
	waveform new -name "Waveform 1"
}
window target "Waveform 1" on
waveform using "Waveform 1"

if {[waveform find -match exact -name "sys.env.agent_in.mon__2" -type group] == {}} {
	waveform add -groups {"sys.env.agent_in.mon__2"}
}

foreach signalname [array names _radixMap] {
	set cmd [list waveform format $signalname -radix $_radixMap($signalname)]
	catch {eval $cmd} status
	if {[string length $status] > 0} {
		puts "$status: $signalname"
	}
}
