Input_Get(0);
if menucooldown <= 0{
	if vInput != 0{
		if (setting+vInput)>(settingcount-1){
			setting = 0;
		}else if (setting+vInput)<0{
			setting = (settingcount-1);
		}else{
			setting += vInput;
		}
		menucooldown = maxmenucooldown;
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
	}else{
		if jumpinput or interactinput{
			var funct = ds_map_find_value(settings[setting],"Function");
			script_execute(funct);
			menucooldown = maxmenucooldown;
		}
	}
	switch setting{
		case settingtypes.master:
			oCore.mastervolume = clamp(oCore.mastervolume + (hInput/100), 0, 1);
			if hInput != 0 and !audio_is_playing(sndToggle){
				PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
			}
		break;
		case settingtypes.music:
			oCore.musicvolume = clamp(oCore.musicvolume + (hInput/100), 0, 1);
			audio_sound_gain(oCore.audiotrack, oCore.musicvolume, 0);
		break;
		case settingtypes.sfx:
			oCore.sfxvolume = clamp(oCore.sfxvolume + (hInput/100), 0, 1);
			audio_sound_gain(sndLand, oCore.sfxvolume, 0);
			if hInput != 0 and !audio_is_playing(sndToggle){
				PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
			}
		break;
	}
}

menucooldown -= 1;

settingcount = array_length(settings);