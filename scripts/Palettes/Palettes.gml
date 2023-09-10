enum paletteID{
	defaultID,
	redGreedColorblind,
	blueYellowColorblind,
	greyscale,
	inverted,
	novis,
	gameboy,
	allwhite
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PaletteInit(){
	//Default
	palettes[0] = ds_map_create();
	ds_map_add(palettes[0],"Player", $ffffff);
	ds_map_add(palettes[0],"Hazards", $3838e5);
	ds_map_add(palettes[0],"Foreground", $464682);
	ds_map_add(palettes[0],"Tiles", $a9e377);
	ds_map_add(palettes[0],"BackgroundOther", $2d2730);
	ds_map_add(palettes[0],"Background", $1d181e);
	//Red-Green Colorblind
	palettes[1] = ds_map_create();
	ds_map_add(palettes[1],"Player", $ffffff);
	ds_map_add(palettes[1],"Hazards", $3efffa);
	ds_map_add(palettes[1],"Foreground", $464682);
	ds_map_add(palettes[1],"Tiles", $c28d64);
	ds_map_add(palettes[1],"BackgroundOther", $2d2730);
	ds_map_add(palettes[1],"Background", $1d181e);
	//Blue-Yellow Colorblind
	palettes[2] = ds_map_create();
	ds_map_add(palettes[2],"Player", $ffffff);
	ds_map_add(palettes[2],"Hazards", $5252ff);
	ds_map_add(palettes[2],"Foreground", $464682);
	ds_map_add(palettes[2],"Tiles", $ffeeaf);
	ds_map_add(palettes[2],"BackgroundOther", $2d2730);
	ds_map_add(palettes[2],"Background", $1d181e);
	//Greyscale
	palettes[3] = ds_map_create();
	ds_map_add(palettes[3],"Player", $ffffff);
	ds_map_add(palettes[3],"Hazards", $dcdcdc);
	ds_map_add(palettes[3],"Foreground", $ffffff);
	ds_map_add(palettes[3],"Tiles", $565656);
	ds_map_add(palettes[3],"BackgroundOther", $2d2730);
	ds_map_add(palettes[3],"Background", $1d181e);
	//Inverted
	palettes[4] = ds_map_create();
	ds_map_add(palettes[4],"Player", $1d181e);
	ds_map_add(palettes[4],"Hazards", $a9e377);
	ds_map_add(palettes[4],"Foreground", $ffeeaf);
	ds_map_add(palettes[4],"Tiles", $3838e5);
	ds_map_add(palettes[4],"BackgroundOther", $dcdcdc);
	ds_map_add(palettes[4],"Background", $ffffff);
	//NOVIS
	palettes[5] = ds_map_create();
	ds_map_add(palettes[5],"Player", $ffffff);
	ds_map_add(palettes[5],"Hazards", $41251c);
	ds_map_add(palettes[5],"Foreground", $ffffff);
	ds_map_add(palettes[5],"Tiles", $2b130b);
	ds_map_add(palettes[5],"BackgroundOther", $6b503a);
	ds_map_add(palettes[5],"Background", $bec05b);
	//Gameboy
	palettes[6] = ds_map_create();
	ds_map_add(palettes[6],"Player", $0fbc9b);
	ds_map_add(palettes[6],"Hazards", $0fac8b);
	ds_map_add(palettes[6],"Foreground", $0fbc9b);
	ds_map_add(palettes[6],"Tiles", $306230);
	ds_map_add(palettes[6],"BackgroundOther", $306230);
	ds_map_add(palettes[6],"Background", $0f380f);
	//All White
	palettes[7] = ds_map_create();
	ds_map_add(palettes[7],"Player", $ffffff);
	ds_map_add(palettes[7],"Hazards", $ffffff);
	ds_map_add(palettes[7],"Foreground", $ffffff);
	ds_map_add(palettes[7],"Tiles", $ffffff);
	ds_map_add(palettes[7],"BackgroundOther", $2d2730);
	ds_map_add(palettes[7],"Background", $1d181e);
}