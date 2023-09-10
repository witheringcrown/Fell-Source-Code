levelx = oCore.gui_width/2;
for (var i = 0; i < levelcount; i += 1){
	if level = i{
		alpha = 1;
	}else{
		alpha = unselectedalpha;
	}
	
	switch i{
		case leveltypes.fullplay:
			levelx = 32;
			levely = 32;
			levelxsize = 16;
			levelysize = 48;
			sprite = ds_map_find_value(levels[i],"Sprite");
			levelcol = col;
			draw_sprite_ext(sprite, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, levelcol, alpha);
			draw_sprite_ext(sFullPlay, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, col, alpha);
		break;
		case leveltypes.level1:
			levelx = 16;
			levely = 80;
			levelxsize = 96;
			levelysize = 96;
			if oCore.level1{
				levelcol = c_white;
				sprite = ds_map_find_value(levels[i],"Sprite");
			}else{
				levelcol = col;
				sprite = sLockIcon;
			}
			draw_sprite_ext(sprite, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, levelcol, alpha);
			draw_sprite_ext(sLevel1, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, col, alpha);
		break;
		case leveltypes.level2:
			levelx = 112;
			levely = 80;
			levelxsize = 64;
			levelysize = 144;
			if oCore.level2{
				levelcol = c_white;
				sprite = ds_map_find_value(levels[i],"Sprite");
			}else{
				levelcol = col;
				sprite = sLockIcon;
			}
			draw_sprite_ext(sprite, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, levelcol, alpha);
			draw_sprite_ext(sLevel2, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, col, alpha);
		break;
		case leveltypes.level3:
			levelx = 48;
			levely = 32;
			levelxsize = 192;
			levelysize = 48;
			if oCore.level3{
				levelcol = c_white;
				sprite = ds_map_find_value(levels[i],"Sprite");
			}else{
				levelcol = col;
				sprite = sLockIcon;
			}
			draw_sprite_ext(sprite, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, levelcol, alpha);
			draw_sprite_ext(sLevel3, 0, levelx+(levelxsize/2), levely+(levelysize/2), xscale, yscale, 0, col, alpha);
		break;
		case leveltypes.speedrunmode:
			levelx = 24;
			levely = 200;
			sprite = ds_map_find_value(levels[i],"Sprite");
			draw_sprite_ext(sCheckboxIcon, oCore.speedrun, levelx+16+8, levely, xscale, yscale, 0, col, alpha);
			draw_sprite_ext(sprite, 0, levelx, levely, xscale, yscale, 0, col, alpha);
		break;
		case leveltypes.back:
			levelx = 24;
			levely = 232;
			sprite = ds_map_find_value(levels[i],"Sprite");
			draw_sprite_ext(sprite, 0, levelx, levely, xscale, yscale, 0, col, alpha);
		break;
	}
}
//draw_text(45, 65, string(level));
//draw_text(45, 75, string(levelcount));