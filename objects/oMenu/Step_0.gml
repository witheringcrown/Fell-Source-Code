Input_Get(0);
if menucooldown <= 0{
	if vInput != 0{
		if (button+vInput)>(buttoncount-1){
			button = 0;
		}else if (button+vInput)<0{
			button = (buttoncount-1);
		}else{
			button += vInput;
		}
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
		menucooldown = maxmenucooldown;
	}else{
		if jumpinput or interactinput{
			var funct = ds_map_find_value(buttons[button],"Function");
			script_execute(funct);
			menucooldown = maxmenucooldown;
		}
	}
}

menucooldown -= 1;

buttoncount = array_length(buttons);