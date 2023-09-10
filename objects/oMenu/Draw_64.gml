buttonx = oCore.gui_width/2;
for (var i = 0; i < buttoncount; i += 1){
	sprite = ds_map_find_value(buttons[i],"Sprite");
	buttony = buttonstarty+(i*spacing);
	if button = i{
		alpha = 1;
	}else{
		alpha = unselectedalpha;
	}
	draw_sprite_ext(sprite, 0, buttonx, buttony, xscale, yscale, 0, col, alpha);
}

draw_sprite_ext(sLogo, 0, 128, 40, 1, 1, 0, col, 1);
//draw_text(45, 65, string(button));
//draw_text(45, 75, string(buttoncount));