# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DW" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OPT_OUTREG" -parent ${Page_0}
  set S_LFSR [ipgui::add_param $IPINST -name "S_LFSR" -parent ${Page_0}]
  set_property tooltip {enable the slave LFSR} ${S_LFSR}
  set S_SEED [ipgui::add_param $IPINST -name "S_SEED" -parent ${Page_0}]
  set_property tooltip {Seed for the slave LFSR} ${S_SEED}


}

proc update_PARAM_VALUE.DW { PARAM_VALUE.DW } {
	# Procedure called to update DW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DW { PARAM_VALUE.DW } {
	# Procedure called to validate DW
	return true
}

proc update_PARAM_VALUE.OPT_OUTREG { PARAM_VALUE.OPT_OUTREG } {
	# Procedure called to update OPT_OUTREG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OPT_OUTREG { PARAM_VALUE.OPT_OUTREG } {
	# Procedure called to validate OPT_OUTREG
	return true
}

proc update_PARAM_VALUE.S_LFSR { PARAM_VALUE.S_LFSR } {
	# Procedure called to update S_LFSR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_LFSR { PARAM_VALUE.S_LFSR } {
	# Procedure called to validate S_LFSR
	return true
}

proc update_PARAM_VALUE.S_SEED { PARAM_VALUE.S_SEED } {
	# Procedure called to update S_SEED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S_SEED { PARAM_VALUE.S_SEED } {
	# Procedure called to validate S_SEED
	return true
}


proc update_MODELPARAM_VALUE.DW { MODELPARAM_VALUE.DW PARAM_VALUE.DW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DW}] ${MODELPARAM_VALUE.DW}
}

proc update_MODELPARAM_VALUE.OPT_OUTREG { MODELPARAM_VALUE.OPT_OUTREG PARAM_VALUE.OPT_OUTREG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OPT_OUTREG}] ${MODELPARAM_VALUE.OPT_OUTREG}
}

proc update_MODELPARAM_VALUE.S_LFSR { MODELPARAM_VALUE.S_LFSR PARAM_VALUE.S_LFSR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_LFSR}] ${MODELPARAM_VALUE.S_LFSR}
}

proc update_MODELPARAM_VALUE.S_SEED { MODELPARAM_VALUE.S_SEED PARAM_VALUE.S_SEED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S_SEED}] ${MODELPARAM_VALUE.S_SEED}
}

