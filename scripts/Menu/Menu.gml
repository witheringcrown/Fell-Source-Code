enum buttontypes{
	continuegame,
	reset,
	settings,
	quit
}

function ButtonInit(){
	//Continue Game
	buttons[buttontypes.continuegame] = ds_map_create();
	ds_map_add(buttons[buttontypes.continuegame],"Sprite", sPlayIcon);
	ds_map_add(buttons[buttontypes.continuegame],"Function", ContinueGame);
	//Level Select
	buttons[buttontypes.reset] = ds_map_create();
	ds_map_add(buttons[buttontypes.reset],"Sprite", sResetIcon);
	ds_map_add(buttons[buttontypes.reset],"Function", NewGame);
	//Settings
	buttons[buttontypes.settings] = ds_map_create();
	ds_map_add(buttons[buttontypes.settings],"Sprite", sSettingsIcon);
	ds_map_add(buttons[buttontypes.settings],"Function", Settings);
	//Quit
	buttons[buttontypes.quit] = ds_map_create();
	ds_map_add(buttons[buttontypes.quit],"Sprite", sQuitIcon);
	ds_map_add(buttons[buttontypes.quit],"Function", Quit);
}

function ContinueGame(){
	StartTransition(oCore.saveroom, oCore.savekey, 0.25, oCore.bgcol);
	AreaChange(oCore.area);
	//StartTransition(lvl_1, "Top", 0.25, $1D181E);
}

function NewGame(){
	StartTransition(lvl_1, "Top", 0.25, oCore.bgcol);
	oCore.time = 0;
	oCore.deaths = 0;
	oCore.backwards = false;
	AreaChange(0);
	
	ini_open( "save.ini" );
	ini_write_real("SAVE", "room", lvl_1);
	ini_write_string("SAVE", "key", "Top");
	ini_write_real("SAVE", "backwards", false);
	oCore.savekey = "Top";
	oCore.saveroom = lvl_1;
	ini_close();
}

function Settings(){
	StartTransition(rSettings, "Menu", 0.25, oCore.bgcol);
}

function Quit(){
	game_end();
}