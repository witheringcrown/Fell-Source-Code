enum settingtypes{
	master,
	music,
	sfx,
	speedrun,
	fullscreen,
	binds,
	palettes,
	reset,
	back
}

function SettingsInit(){
	//Master Volume
	settings[settingtypes.master] = ds_map_create();
	ds_map_add(settings[settingtypes.master],"Sprite", sMasterIcon);
	ds_map_add(settings[settingtypes.master],"Function", Master);
	ds_map_add(settings[settingtypes.master],"Checkbox", true);
	ds_map_add(settings[settingtypes.master],"Slider", true);
	//Music
	settings[settingtypes.music] = ds_map_create();
	ds_map_add(settings[settingtypes.music],"Sprite", sMusicIcon);
	ds_map_add(settings[settingtypes.music],"Function", Music);
	ds_map_add(settings[settingtypes.music],"Checkbox", true);
	ds_map_add(settings[settingtypes.music],"Slider", true);
	//SFX
	settings[settingtypes.sfx] = ds_map_create();
	ds_map_add(settings[settingtypes.sfx],"Sprite", sSoundsIcon);
	ds_map_add(settings[settingtypes.sfx],"Function", SFX);
	ds_map_add(settings[settingtypes.sfx],"Checkbox", true);
	ds_map_add(settings[settingtypes.sfx],"Slider", true);
	//SpeedrunMode
	settings[settingtypes.speedrun] = ds_map_create();
	ds_map_add(settings[settingtypes.speedrun],"Sprite", sTime);
	ds_map_add(settings[settingtypes.speedrun],"Function", Speedrun);
	ds_map_add(settings[settingtypes.speedrun],"Checkbox", true);
	ds_map_add(settings[settingtypes.speedrun],"Slider", false);
	//Fullscreen
	settings[settingtypes.fullscreen] = ds_map_create();
	ds_map_add(settings[settingtypes.fullscreen],"Sprite", sFullscreenIcon);
	ds_map_add(settings[settingtypes.fullscreen],"Function", Fullscreen);
	ds_map_add(settings[settingtypes.fullscreen],"Checkbox", true);
	ds_map_add(settings[settingtypes.fullscreen],"Slider", false);
	//Binds
	settings[settingtypes.binds] = ds_map_create();
	if gamepad_is_connected(0){
		ds_map_add(settings[settingtypes.binds],"Sprite", sControllerIcon);
	}else{
		ds_map_add(settings[settingtypes.binds],"Sprite", sKeyboardIcon);
	}
	ds_map_add(settings[settingtypes.binds],"Function", Binds);
	ds_map_add(settings[settingtypes.binds],"Checkbox", false);
	ds_map_add(settings[settingtypes.binds],"Slider", false);
	//Palettes
	settings[settingtypes.palettes] = ds_map_create();
	ds_map_add(settings[settingtypes.palettes],"Sprite", sPaletteIcon);
	ds_map_add(settings[settingtypes.palettes],"Function", Palette);
	ds_map_add(settings[settingtypes.palettes],"Checkbox", false);
	ds_map_add(settings[settingtypes.palettes],"Slider", false);
	//Reset To Defaults
	settings[settingtypes.reset] = ds_map_create();
	ds_map_add(settings[settingtypes.reset],"Sprite", sResetIcon);
	ds_map_add(settings[settingtypes.reset],"Function", Reset);
	ds_map_add(settings[settingtypes.reset],"Checkbox", false);
	ds_map_add(settings[settingtypes.reset],"Slider", false);
	//Back
	settings[settingtypes.back] = ds_map_create();
	ds_map_add(settings[settingtypes.back],"Sprite", sQuitIcon);
	ds_map_add(settings[settingtypes.back],"Function", Back);
	ds_map_add(settings[settingtypes.back],"Checkbox", false);
	ds_map_add(settings[settingtypes.back],"Slider", false);
	
}

function Master(){
	if oCore.mastervolume > 0{
		oCore.mastervolumesaved = oCore.mastervolume;
		oCore.mastervolume = 0;
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}else{
		oCore.mastervolume = oCore.mastervolumesaved;
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}
}

function Music(){
	if oCore.musicvolume > 0{
		oCore.musicvolumesaved = oCore.musicvolume;
		oCore.musicvolume = 0;
		audio_sound_gain(oCore.audiotrack, oCore.musicvolume, 0);
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}else{
		oCore.musicvolume = oCore.musicvolumesaved;
		audio_sound_gain(oCore.audiotrack, oCore.musicvolume, 0);
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}
}

function SFX(){
	if oCore.sfxvolume > 0{
		oCore.sfxvolumesaved = oCore.sfxvolume;
		oCore.sfxvolume = 0;
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}else{
		oCore.sfxvolume = oCore.sfxvolumesaved;
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}
}

function Speedrun(){
	if oCore.speedrun{
		oCore.speedrun = false;
	}else{
		oCore.speedrun = true;
	}
	PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
}

function Fullscreen(){
	if oCore.fullscreen = true{
		window_set_fullscreen(false);
		oCore.fullscreen = false;
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}else{
		window_set_fullscreen(true);
		oCore.fullscreen = true;
		PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
	}
}

function Binds(){
	StartTransition(rKeybinds, oCore.key, 0.25, oCore.bgcol);
}

function Palette(){
	StartTransition(rPalette, oCore.key, 0.25, oCore.bgcol);
}

function Reset(){
	oCore.mastervolume = oCore.defmaster;
	oCore.musicvolume = oCore.defmusic;
	audio_sound_gain(oCore.audiotrack, oCore.musicvolume, 0);
	oCore.sfxvolume = oCore.defsfx;
	oCore.fullscreen = oCore.deffullscreen;
	window_set_fullscreen(oCore.fullscreen);
	PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
}

function Back(){
	SaveSettings();
	if oCore.key = "Menu"{
		StartTransition(rMenu, "null", 0.25, oCore.bgcol);
	}else if oCore.key = "Pause"{
		StartTransition(rPause, "null", 0.25, oCore.bgcol);
	}
}

function SaveSettings(){
	ini_open( "save.ini" );
		ini_write_real("SAVE", "mastervolume", oCore.mastervolume);
		ini_write_real("SAVE", "musicvolume", oCore.musicvolume);
		ini_write_real("SAVE", "sfxvolume", oCore.sfxvolume);
		ini_write_real("SAVE", "mastervolumesaved", oCore.mastervolumesaved);
		ini_write_real("SAVE", "musicvolumesaved", oCore.musicvolumesaved);
		ini_write_real("SAVE", "sfxvolumesaved", oCore.sfxvolumesaved);
		ini_write_real("SAVE", "fullscreen", oCore.fullscreen);
	ini_close();
}