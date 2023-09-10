col = global.pplayer;
if room != rMenu and room != rSettings and room != rKeybinds and room != rLevelSelect{
	if speedrun = true{
		draw_sprite_ext(sTime, 0, 16, 16, 1, 1, 0, col, 1);
		draw_set_font(fntText);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text_color(32, 16, string(timestring), col, col, col, col, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	
		draw_sprite_ext(sDeaths, 0, 16, 32, 1, 1, 0, col, 1);
		draw_set_font(fntText);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text_color(32, 32, string(oCore.deaths), col, col, col, col, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}