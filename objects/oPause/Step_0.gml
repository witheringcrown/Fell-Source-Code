Input_Get(0);
if menucooldown <= 0{
	if hInput != 0{
		if (pause+hInput)>(pausecount-1){
			pause = 0;
		}else if (pause+hInput)<0{
			pause = (pausecount-1);
		}else{
			pause += hInput;
		}
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
		menucooldown = maxmenucooldown;
	}
}
if jumpinput or interactinput{
	var funct = ds_map_find_value(pauses[pause],"Function");
	script_execute(funct);
}

menucooldown -= 1;

pausecount = array_length(pauses);