Input_Get(0);
if menucooldown <= 0{
	switch level{
		case leveltypes.fullplay:
			if upinput{
				level = leveltypes.back;
				menucooldown = maxmenucooldown;
			}else if downinput{
				level = leveltypes.level1;
				menucooldown = maxmenucooldown;
			}else if leftinput or rightinput{
				level = leveltypes.level3;
				menucooldown = maxmenucooldown;
			}
		break;
		case leveltypes.level1:
			if upinput{
				level = leveltypes.fullplay;
				menucooldown = maxmenucooldown;
			}else if downinput{
				level = leveltypes.speedrunmode;
				menucooldown = maxmenucooldown;
			}else if leftinput or rightinput{
				level = leveltypes.level2;
				menucooldown = maxmenucooldown;
			}
		break;
		case leveltypes.speedrunmode:
			if upinput{
				level = leveltypes.level1;
				menucooldown = maxmenucooldown;
			}else if downinput{
				level = leveltypes.back;
				menucooldown = maxmenucooldown;
			}else if leftinput or rightinput{
				level = leveltypes.level2;
				menucooldown = maxmenucooldown;
			}
		break;
		case leveltypes.back:
			if upinput{
				level = leveltypes.speedrunmode;
			}else if downinput{
				level = leveltypes.fullplay;
				menucooldown = maxmenucooldown;
			}else if leftinput or rightinput{
				level = leveltypes.level2;
				menucooldown = maxmenucooldown;
			}
		break;
		case leveltypes.level3:
			if upinput or downinput{
				level = leveltypes.level2;
				menucooldown = maxmenucooldown;
			}else if leftinput or rightinput{
				level = leveltypes.fullplay;
				menucooldown = maxmenucooldown;
			}
		break;
		case leveltypes.level2:
			if upinput or downinput{
				level = leveltypes.level3;
				menucooldown = maxmenucooldown;
			}else if leftinput or rightinput{
				level = leveltypes.level1;
				menucooldown = maxmenucooldown;
			}
		break;
	}
	if jumpinput or interactinput{
		var funct = ds_map_find_value(levels[level],"Function");
		script_execute(funct);
		menucooldown = maxmenucooldown;
	}
	if vInput or hInput{
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
	}
}

menucooldown -= 1;

levelcount = array_length(levels);