settingx = 32;
for (var i = 0; i < settingcount; i += 1){
	sprite = ds_map_find_value(settings[i],"Sprite");
	settingy = settingstarty+(i*spacing);
	if setting = i{
		alpha = 1;
	}else{
		alpha = unselectedalpha;
	}
	draw_sprite_ext(sprite, 0, settingx, settingy, xscale, yscale, 0, col, alpha);
	
	checkbox = ds_map_find_value(settings[i],"Checkbox");
	if checkbox{
		switch i{
			case settingtypes.master:
				if oCore.mastervolume <= 0{
					checked = 0;
				}else{
					checked = 1;
				}
			break;
			case settingtypes.music:
				if oCore.musicvolume <= 0{
					checked = 0;
				}else{
					checked = 1;
				}
			break;
			case settingtypes.sfx:
				if oCore.sfxvolume <= 0{
					checked = 0;
				}else{
					checked = 1;
				}
			break;
			case settingtypes.speedrun:
				checked = oCore.speedrun;
			break;
			case settingtypes.fullscreen:
				checked = oCore.fullscreen;
			break;
		}
		draw_sprite_ext(sCheckboxIcon, checked, settingx+spacing, settingy, xscale, yscale, 0, col, alpha);
	}
	
	slider = ds_map_find_value(settings[i],"Slider");
		if slider{
			//draw max volume
			draw_set_alpha(unselectedalpha);
			draw_rectangle_color(settingx+(spacing*3), settingy-1, oCore.gui_width-spacing, settingy+1, col, col, col, col, 0);
			draw_set_alpha(1);
			switch i{
				case settingtypes.master:
					per = oCore.mastervolume;
				break;
				case settingtypes.music:
					per = oCore.musicvolume;
				break;
				case settingtypes.sfx:
					per = oCore.sfxvolume;
				break;
			}
			//draw volume percentage text
			draw_set_font(fntText);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_color(settingx+(spacing*2), settingy, round(per*100), col, col, col, col, 1);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			//draw volume percentage bar
			volper = ((oCore.gui_width-spacing)-(settingx+(spacing*3)))*per;
			draw_rectangle_color(settingx+(spacing*3), settingy-1, volper+(settingx+(spacing*3)), settingy+1, col, col, col, col, 0);
	}
}
//draw_text(45, 65, string(setting));
//draw_text(45, 75, string(settingcount));