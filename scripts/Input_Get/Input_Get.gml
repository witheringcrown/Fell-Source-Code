///Input_Get(device)
function Input_Get(device){
	deadzone = 0.3;
	//controller joystick left
	lhaxisl = 17;
	lhaxisr = 18;
	lvaxisu = 19;
	lvaxisd = 20;
	lal = gamepad_axis_value(device, gp_axislh)<-deadzone;
	lar = gamepad_axis_value(device, gp_axislh)>deadzone;
	lau = gamepad_axis_value(device, gp_axislv)<-deadzone;
	lad = gamepad_axis_value(device, gp_axislv)>deadzone;
	//controller joystick right
	rhaxisl = 21;
	rhaxisr = 22;
	rvaxisu = 23;
	rvaxisd = 24;
	ral = gamepad_axis_value(device, gp_axisrh)<-deadzone;
	rar = gamepad_axis_value(device, gp_axisrh)>deadzone;
	rau = gamepad_axis_value(device, gp_axisrv)<-deadzone;
	rad = gamepad_axis_value(device, gp_axisrv)>deadzone;
	
	//keyboard
	truedevice = -1;
	leftinput = keyboard_check(global.keybindleft);
	rightinput = keyboard_check(global.keybindright);
	upinput = keyboard_check(global.keybindup);
	downinput = keyboard_check(global.keybinddown);
	jumpinput = keyboard_check_pressed(global.keybindjump);
	jumpinputheld = keyboard_check(global.keybindjump);
	dashinput = keyboard_check_pressed(global.keybinddash);
	interactinput = keyboard_check_pressed(global.keybindinteract);
	pauseinput = keyboard_check_pressed(global.keybindpause);

//controller
	if gamepad_is_connected(device){
		truedevice = device;
		//Left Input
		if UsingJoystick(global.controllerbindleft){
			leftinput = JoystickCheck(global.controllerbindleft);
		}else{
			leftinput = gamepad_button_check(device, global.controllerbindleft);
		}
		//Right Input
		if UsingJoystick(global.controllerbindright){
			rightinput = JoystickCheck(global.controllerbindright);
		}else{
			rightinput = gamepad_button_check(device, global.controllerbindright);
		}
		//Up Input
		if UsingJoystick(global.controllerbindup){
			upinput = JoystickCheck(global.controllerbindup);
		}else{
			upinput = gamepad_button_check(device, global.controllerbindup);
		}
		//Down Input
		if UsingJoystick(global.controllerbinddown){
			downinput = JoystickCheck(global.controllerbinddown);
		}else{
			downinput = gamepad_button_check(device, global.controllerbinddown);
		}
		//Jump Input
		if UsingJoystick(global.controllerbindjump){
			jumpinput = JoystickCheck(global.controllerbindjump);
			jumpinputheld = JoystickCheck(global.controllerbindjump);
		}else{
			jumpinput = gamepad_button_check_pressed(device, global.controllerbindjump);
			jumpinputheld = gamepad_button_check(device, global.controllerbindjump);
		}
		//Dash Input
		if UsingJoystick(global.controllerbinddash){
			dashinput = JoystickCheck(global.controllerbinddash);
		}else{
			dashinput = gamepad_button_check_pressed(device, global.controllerbinddash);
		}
		//Interact Input
		if UsingJoystick(global.controllerbindinteract){
			interactinput = JoystickCheck(global.controllerbindinteract);
		}else{
			interactinput = gamepad_button_check_pressed(device, global.controllerbindinteract);
		}
		//Pause Input
		if UsingJoystick(global.controllerbindpause){
			pauseinput = JoystickCheck(global.controllerbindpause);
		}else{
			pauseinput = gamepad_button_check_pressed(device, global.controllerbindpause);
		}
	}
	vInput = (downinput - upinput);
	hInput = (rightinput - leftinput);
}

function UsingJoystick(controllerbind){
	if controllerbind == lhaxisl or controllerbind == lhaxisr or controllerbind == lvaxisu or controllerbind == lvaxisd or controllerbind == rhaxisl or controllerbind == rhaxisr or controllerbind == rvaxisu or controllerbind == rvaxisd{
		return true;
	}else{
		return false;
	}
}

function GpButton(device){
	if lal{
		return lhaxisl;
	}else if lar{
		return lhaxisr;
	}else if lau{
		return lvaxisu;
	}else if lad{
		return lvaxisd;
	}else if ral{
		return rhaxisl;
	}else if rar{
		return rhaxisr;
	}else if rau{
		return rvaxisu;
	}else if rad{
		return rvaxisd;
	}else if gamepad_button_check_pressed(device, gp_face1){
		return gp_face1;
	}else if gamepad_button_check_pressed(device, gp_face2){
		return gp_face2;
	}else if gamepad_button_check_pressed(device, gp_face3){
		return gp_face3;
	}else if gamepad_button_check_pressed(device, gp_face4){
		return gp_face4;
	}else if gamepad_button_check_pressed(device, gp_shoulderl){
		return gp_shoulderl;
	}else if gamepad_button_check_pressed(device, gp_shoulderlb){
		return gp_shoulderlb;
	}else if gamepad_button_check_pressed(device, gp_shoulderr){
		return gp_shoulderr;
	}else if gamepad_button_check_pressed(device, gp_shoulderrb){
		return gp_shoulderrb;
	}else if gamepad_button_check_pressed(device, gp_select){
		return gp_select;
	}else if gamepad_button_check_pressed(device, gp_start){
		return gp_start;
	}else if gamepad_button_check_pressed(device, gp_stickl){
		return gp_stickl;
	}else if gamepad_button_check_pressed(device, gp_stickr){
		return gp_stickr;
	}else if gamepad_button_check_pressed(device, gp_padl){
		return gp_padl;
	}else if gamepad_button_check_pressed(device, gp_padr){
		return gp_padr;
	}else if gamepad_button_check_pressed(device, gp_padu){
		return gp_padu;
	}else if gamepad_button_check_pressed(device, gp_padd){
		return gp_padd;
	}
}
	
function JoystickCheck(input){
	switch input{
		case lhaxisl:
			if lal = 1{
				return 1;
			}else{
				return 0
			}
		break;
		case lhaxisr:
			if lar = 1{
				return 1;
			}else{
				return 0
			};
		break;
		case lvaxisu:
			if lau = 1{
				return 1;
			}else{
				return 0
			};
		break;
		case lvaxisd:
			if lad = 1{
				return 1;
			}else{
				return 0
			};
		break;
		case rhaxisl:
			if ral = 1{
				return 1;
			}else{
				return 0
			};
		break;
		case rhaxisr:
			if rar = 1{
				return 1;
			}else{
				return 0
			};
		break;
		case rvaxisu:
			if rau = 1{
				return 1;
			}else{
				return 0
			};
		break;
		case rvaxisd:
			if rad = 1{
				return 1;
			}else{
				return 0
			};
		break;
	}
}