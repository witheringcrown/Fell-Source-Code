Input_Get(0);
//pausing
if pauseinput{
	if room == rPause{
		StartTransition(oCore.pauseroom, pausekey, 0.25, $1D181E);
	}else if room != rMenu and room != rSettings and room != rSplashScreen and room != rKeybinds and room != rLevelSelect and room != rPalette{
		if instance_exists(oPlayer){
			pausex = oPlayer.x;
			pausey = oPlayer.y;
			pausekey = "Resume"
		}else{
			pausekey = savekey;
		}
		pauseroom = room;
		room_goto(rPause);
	}
}

//ui
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

//transitions
if transitioning = true{
	Transition();
}

//audio
if !audio_is_playing(audiotrack){
	audio_stop_sound(sndMenu);
	audio_stop_sound(sndShallowAbyss);
	audio_stop_sound(sndBoredVeins);
	PlayMusic(audiotrack);
}

audio_set_master_gain(0, mastervolume);

SpeedrunClock();

//Emergency Keybind Reset
key1 = keyboard_check(vk_alt);
key2 = keyboard_check(vk_delete);
key3 = keyboard_check(vk_shift);
if (key1 && key2 && key3){
	KReset();
}