if paletteselect < 8{
	draw_sprite_ext(sPaletteShowcase, 0, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[paletteselect],"Background"), 1);
	draw_sprite_ext(sPaletteShowcase, 1, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[paletteselect],"Player"), 1);
	draw_sprite_ext(sPaletteShowcase, 2, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[paletteselect],"Tiles"), 1);
	draw_sprite_ext(sPaletteShowcase, 3, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[paletteselect],"BackgroundOther"), 1);
	draw_sprite_ext(sPaletteShowcase, 4, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[paletteselect],"Hazards"), 1);
}else{
	draw_sprite_ext(sPaletteShowcase, 0, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[global.palette],"Background"), 1);
	draw_sprite_ext(sPaletteShowcase, 1, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[global.palette],"Player"), 1);
	draw_sprite_ext(sPaletteShowcase, 2, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[global.palette],"Tiles"), 1);
	draw_sprite_ext(sPaletteShowcase, 3, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[global.palette],"BackgroundOther"), 1);
	draw_sprite_ext(sPaletteShowcase, 4, showcasex, showcasey, xscale, yscale, 0, ds_map_find_value(palettes[global.palette],"Hazards"), 1);
}
draw_sprite_ext(sLevel1, 0, showcasex, showcasey, xscale, yscale, 0, col, 1);

for (var i = 0; i < palettemenucount; i += 1){
	row = floor(i/rowsize);
	palettex = palettemenustartx+((i-(rowsize*row))*spacing);
	palettey = palettemenustarty+(row*spacing);
	
	if paletteselect = i{
		alpha = 1;
	}else{
		alpha = unselectedalpha;
	}
	
	if i < 8{
		if ds_map_find_value(palettemenus[i],"Unlocked") = true{
			sprite = s16x16Box;
		}else{
			sprite = sLockIcon;
		}
		
		draw_sprite_ext(sPaletteSelect, 0, palettex, palettey, xscale, yscale, 0, ds_map_find_value(palettes[i],"Player"), alpha);
		draw_sprite_ext(sPaletteSelect, 1, palettex, palettey, xscale, yscale, 0, ds_map_find_value(palettes[i],"Hazards"), alpha);
		draw_sprite_ext(sPaletteSelect, 2, palettex, palettey, xscale, yscale, 0, ds_map_find_value(palettes[i],"Tiles"), alpha);
		draw_sprite_ext(sPaletteSelect, 3, palettex, palettey, xscale, yscale, 0, ds_map_find_value(palettes[i],"Background"), alpha);
	}else{
		sprite = sQuitIcon;
	}
	
	draw_sprite_ext(sprite, 0, palettex, palettey, xscale, yscale, 0, col, alpha);
}

//draw_text(45, 65, string(pause));
//draw_text(45, 75, string(pausecount));