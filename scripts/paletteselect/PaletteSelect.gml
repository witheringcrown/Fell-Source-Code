function PaletteMenuInit(){
	//Default
	palettemenus[0] = ds_map_create();
	ds_map_add(palettemenus[0],"Function", SelectPalette);
	ds_map_add(palettemenus[0],"Color1", ds_map_find_value(palettes[0],"Player"));
	ds_map_add(palettemenus[0],"Color2", ds_map_find_value(palettes[0],"Hazard"));
	ds_map_add(palettemenus[0],"Color3", ds_map_find_value(palettes[0],"Tiles"));
	ds_map_add(palettemenus[0],"Color4", ds_map_find_value(palettes[0],"Background"));
	ds_map_add(palettemenus[0],"Unlocked", oCore.palette0);
	//Red-Green Colorblind
	palettemenus[1] = ds_map_create();
	ds_map_add(palettemenus[1],"Function", SelectPalette);
	ds_map_add(palettemenus[1],"Color1", ds_map_find_value(palettes[1],"Player"));
	ds_map_add(palettemenus[1],"Color2", ds_map_find_value(palettes[1],"Hazard"));
	ds_map_add(palettemenus[1],"Color3", ds_map_find_value(palettes[1],"Tiles"));
	ds_map_add(palettemenus[1],"Color4", ds_map_find_value(palettes[1],"Background"));
	ds_map_add(palettemenus[1],"Unlocked", oCore.palette1);
	//Blue-Yellow Colorblind
	palettemenus[2] = ds_map_create();
	ds_map_add(palettemenus[2],"Function", SelectPalette);
	ds_map_add(palettemenus[2],"Color1", ds_map_find_value(palettes[2],"Player"));
	ds_map_add(palettemenus[2],"Color2", ds_map_find_value(palettes[2],"Hazard"));
	ds_map_add(palettemenus[2],"Color3", ds_map_find_value(palettes[2],"Tiles"));
	ds_map_add(palettemenus[2],"Color4", ds_map_find_value(palettes[2],"Background"));
	ds_map_add(palettemenus[2],"Unlocked", oCore.palette2);
	//Greyscale
	palettemenus[3] = ds_map_create();
	ds_map_add(palettemenus[3],"Function", SelectPalette);
	ds_map_add(palettemenus[3],"Color1", ds_map_find_value(palettes[3],"Player"));
	ds_map_add(palettemenus[3],"Color2", ds_map_find_value(palettes[3],"Hazard"));
	ds_map_add(palettemenus[3],"Color3", ds_map_find_value(palettes[3],"Tiles"));
	ds_map_add(palettemenus[3],"Color4", ds_map_find_value(palettes[3],"Background"));
	ds_map_add(palettemenus[3],"Unlocked", oCore.palette3);
	//Inverted
	palettemenus[4] = ds_map_create();
	ds_map_add(palettemenus[4],"Function", SelectPalette);
	ds_map_add(palettemenus[4],"Color1", ds_map_find_value(palettes[4],"Player"));
	ds_map_add(palettemenus[4],"Color2", ds_map_find_value(palettes[4],"Hazard"));
	ds_map_add(palettemenus[4],"Color3", ds_map_find_value(palettes[4],"Tiles"));
	ds_map_add(palettemenus[4],"Color4", ds_map_find_value(palettes[4],"Background"));
	ds_map_add(palettemenus[4],"Unlocked", oCore.palette4);
	//NOVIS
	palettemenus[5] = ds_map_create();
	ds_map_add(palettemenus[5],"Function", SelectPalette);
	ds_map_add(palettemenus[5],"Color1", ds_map_find_value(palettes[5],"Player"));
	ds_map_add(palettemenus[5],"Color2", ds_map_find_value(palettes[5],"Hazard"));
	ds_map_add(palettemenus[5],"Color3", ds_map_find_value(palettes[5],"Tiles"));
	ds_map_add(palettemenus[5],"Color4", ds_map_find_value(palettes[5],"Background"));
	ds_map_add(palettemenus[5],"Unlocked", oCore.palette5);
	//Gameboy
	palettemenus[6] = ds_map_create();
	ds_map_add(palettemenus[6],"Function", SelectPalette);
	ds_map_add(palettemenus[6],"Color1", ds_map_find_value(palettes[6],"Player"));
	ds_map_add(palettemenus[6],"Color2", ds_map_find_value(palettes[6],"Hazard"));
	ds_map_add(palettemenus[6],"Color3", ds_map_find_value(palettes[6],"Tiles"));
	ds_map_add(palettemenus[6],"Color4", ds_map_find_value(palettes[6],"Background"));
	ds_map_add(palettemenus[6],"Unlocked", oCore.palette6);
	//All White
	palettemenus[7] = ds_map_create();
	ds_map_add(palettemenus[7],"Function", SelectPalette);
	ds_map_add(palettemenus[7],"Color1", ds_map_find_value(palettes[7],"Player"));
	ds_map_add(palettemenus[7],"Color2", ds_map_find_value(palettes[7],"Hazard"));
	ds_map_add(palettemenus[7],"Color3", ds_map_find_value(palettes[7],"Tiles"));
	ds_map_add(palettemenus[7],"Color4", ds_map_find_value(palettes[7],"Background"));
	ds_map_add(palettemenus[7],"Unlocked", oCore.palette7);
	//Back Button
	palettemenus[8] = ds_map_create();
	ds_map_add(palettemenus[8],"Function", PBack);
	ds_map_add(palettemenus[8],"Color1", ds_map_find_value(palettes[0],"Player"));
	ds_map_add(palettemenus[8],"Color2", ds_map_find_value(palettes[0],"Hazard"));
	ds_map_add(palettemenus[8],"Color3", ds_map_find_value(palettes[0],"Tiles"));
	ds_map_add(palettemenus[8],"Color4", ds_map_find_value(palettes[0],"Background"));
	ds_map_add(palettemenus[8],"Unlocked", true);
}

function SelectPalette(){
	global.palette = paletteselect;
	
	ini_open("save.ini");
	oCore.palette5 = true;
	ini_write_real("SAVE", "palette3", oCore.palette5);
	ini_write_real("SAVE", "palette", global.palette);
	ini_close();
	
	StartTransition(rPalette, oCore.key, 0.25, oCore.bgcol);
	global.pplayer = ds_map_find_value(palettes[global.palette],"Player");
	global.phazards = ds_map_find_value(palettes[global.palette],"Hazards");
	global.pforeground = ds_map_find_value(palettes[global.palette],"Foreground");
	global.ptiles = ds_map_find_value(palettes[global.palette],"Tiles");
	global.pbackgroundother = ds_map_find_value(palettes[global.palette],"BackgroundOther");
	global.pbackground = ds_map_find_value(palettes[global.palette],"Background");
}

function PBack(){
	StartTransition(rSettings, oCore.key, 0.25, oCore.bgcol);
}