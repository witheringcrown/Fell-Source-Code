Input_Get(0);

vInput = (downinput - upinput);
hInput = (rightinput - leftinput);
if menucooldown <= 0{
	if remapping{
		if truedevice >= 0{
			remap = ds_map_find_value(keybinds[keybind],"Button");
			if GpButton(0) > 0{
				switch remap{
					case global.controllerbindleft:
						global.controllerbindleft = GpButton(0);
					break;
					case global.controllerbindright:
						global.controllerbindright = GpButton(0);
					break;
					case global.controllerbindup:
						global.controllerbindup = GpButton(0);
					break;
					case global.controllerbinddown:
						global.controllerbinddown = GpButton(0);
					break;
					case global.controllerbindjump:
						global.controllerbindjump = GpButton(0);
					break;
					case global.controllerbinddash:
						global.controllerbinddash = GpButton(0);
					break;
					case global.controllerbindinteract:
						global.controllerbindinteract = GpButton(0);
					break;
					case global.controllerbindpause:
						global.controllerbindpause = GpButton(0);
					break;
				}
				SaveKeybinds();
				KeybindInit();
				remapping = false;
			}
		}else{
			keyimage = 0;
			if keyboard_key != 0{
				remap = ds_map_find_value(keybinds[keybind],"Key");
				switch remap{
					case global.keybindleft:
						global.keybindleft = keyboard_key;
					break;
					case global.keybindright:
						global.keybindright = keyboard_key;
					break;
					case global.keybindup:
						global.keybindup = keyboard_key;
					break;
					case global.keybinddown:
						global.keybinddown = keyboard_key;
					break;
					case global.keybindjump:
						global.keybindjump = keyboard_key;
					break;
					case global.keybinddash:
						global.keybinddash = keyboard_key;
					break;
					case global.keybindinteract:
						global.keybindinteract = keyboard_key;
					break;
					case global.keybindpause:
						global.keybindpause = keyboard_key;
					break;
				}
				SaveKeybinds();
				KeybindInit();
				remapping = false;
			}
		}
	}else{
		if vInput != 0{
			if (keybind+vInput)>(keybindcount-1){
				keybind = 0;
			}else if (keybind+vInput)<0{
				keybind = (keybindcount-1);
			}else{
				keybind += vInput;
			}
			PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
			menucooldown = maxmenucooldown;
		}else{
			if jumpinput or interactinput{
				if keybind < keybindtypes.reset{
					remapping = true;
					PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
				}else{
					switch keybind{
						case keybindtypes.reset:
							KReset();
						break;
						case keybindtypes.back:
							KBack();
						break;
					}
				}
				menucooldown = maxmenucooldown;
			}
		}
	}
}

menucooldown -= 1;

keybindcount = array_length(keybinds);