Input_Get(0);
if menucooldown <= 0{
	if hInput != 0{
		if (paletteselect+hInput)>(palettemenucount-1){
			paletteselect = 0;
		}else if (paletteselect+hInput)<0{
			paletteselect = (palettemenucount-1);
		}else{
			paletteselect += hInput;
		}
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
		menucooldown = maxmenucooldown;
	}else if vInput != 0{
		if (paletteselect+(vInput*rowsize))>(palettemenucount-1){
			paletteselect = 0;
		}else if (paletteselect+(vInput*rowsize))<0{
			paletteselect = (palettemenucount-1);
		}else{
			paletteselect += (vInput*rowsize);
		}
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
		menucooldown = maxmenucooldown;
	}
}
if jumpinput or interactinput{
	if ds_map_find_value(palettemenus[paletteselect],"Unlocked"){
		var funct = ds_map_find_value(palettemenus[paletteselect],"Function");
		script_execute(funct);
	}else{
		PlaySound(sndInvalid, global.pitchlowinvalid, global.pitchhighinvalid);
	}
}

menucooldown -= 1;

palettemenucount = array_length(palettemenus);