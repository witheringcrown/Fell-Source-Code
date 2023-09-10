enum leveltypes{
	fullplay,
	level1,
	level2,
	level3,
	speedrunmode,
	back
}

function LevelInit(){
	//Full Play
	levels[leveltypes.fullplay] = ds_map_create();
	ds_map_add(levels[leveltypes.fullplay],"Sprite", sArrowDown);
	ds_map_add(levels[leveltypes.fullplay],"Function", FullPlay);
	//Level One
	levels[leveltypes.level1] = ds_map_create();
	ds_map_add(levels[leveltypes.level1],"Sprite", sShallowAbyssPortrait);
	ds_map_add(levels[leveltypes.level1],"Function", LevelOne);
	//Level Two
	levels[leveltypes.level2] = ds_map_create();
	ds_map_add(levels[leveltypes.level2],"Sprite", sPlayIcon);
	ds_map_add(levels[leveltypes.level2],"Function", LevelTwo);
	//Level Three
	levels[leveltypes.level3] = ds_map_create();
	ds_map_add(levels[leveltypes.level3],"Sprite", sPlayIcon);
	ds_map_add(levels[leveltypes.level3],"Function", LevelThree);
	//Speedrun Mode
	levels[leveltypes.speedrunmode] = ds_map_create();
	ds_map_add(levels[leveltypes.speedrunmode],"Sprite", sTime);
	ds_map_add(levels[leveltypes.speedrunmode],"Function", SpeedrunMode);
	//Back
	levels[leveltypes.back] = ds_map_create();
	ds_map_add(levels[leveltypes.back],"Sprite", sQuitIcon);
	ds_map_add(levels[leveltypes.back],"Function", LBack);
}

function FullPlay(){
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
function LevelOne(){
	if oCore.level1{
		StartTransition(lvl_1, "Top", 0.25, oCore.bgcol);
		oCore.time = 0;
		oCore.deaths = 0;
		oCore.backwards = false;
		AreaChange(1);
		
		ini_open( "save.ini" );
		ini_write_real("SAVE", "room", lvl_1);
		ini_write_string("SAVE", "key", "Top");
		ini_write_real("SAVE", "backwards", false);
		oCore.savekey = "Top";
		oCore.saveroom = lvl_1;
		ini_close();
	}else{
		PlaySound(sndInvalid, global.pitchlowinvalid, global.pitchhighinvalid);
	}
}
function LevelTwo(){
	if oCore.level2{
		oCore.time = 0;
		oCore.deaths = 0;
		oCore.backwards = false;
	}else{
		PlaySound(sndInvalid, global.pitchlowinvalid, global.pitchhighinvalid);
	}
}
function LevelThree(){
	if oCore.level3{
		oCore.time = 0;
		oCore.deaths = 0;
		oCore.backwards = false;
	}else{
		PlaySound(sndInvalid, global.pitchlowinvalid, global.pitchhighinvalid);
	}
}
function SpeedrunMode(){
	if oCore.speedrun{
		oCore.speedrun = false;
	}else{
		oCore.speedrun = true;
	}
	PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
}
function LBack(){
	StartTransition(rMenu, "null", 0.25, oCore.bgcol);
}