enum pausetypes{
	resume,
	settings,
	quit
}

function PauseInit(){
	//Resume
	pauses[pausetypes.resume] = ds_map_create();
	ds_map_add(pauses[pausetypes.resume],"Sprite", sPlayIcon);
	ds_map_add(pauses[pausetypes.resume],"Function", Resume);
	//Settings
	pauses[pausetypes.settings] = ds_map_create();
	ds_map_add(pauses[pausetypes.settings],"Sprite", sSettingsIcon);
	ds_map_add(pauses[pausetypes.settings],"Function", PSettings);
	//Quit
	pauses[pausetypes.quit] = ds_map_create();
	ds_map_add(pauses[pausetypes.quit],"Sprite", sQuitIcon);
	ds_map_add(pauses[pausetypes.quit],"Function", PQuit);
}

function Resume(){
	StartTransition(oCore.pauseroom, "Resume", 0.25, $1D181E);
	//StartTransition(lvl_1, "Top", 0.25, $1D181E);
}

function PSettings(){
	StartTransition(rSettings, "Pause", 0.25, $1D181E);
}

function PQuit(){
	StartTransition(rMenu, "Pause", 0.25, $1D181E);
}