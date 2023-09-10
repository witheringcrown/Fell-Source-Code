middlex = oCore.gui_width/2;
middley = oCore.gui_height/2;
draw_sprite_ext(sPause, 0, middlex, middley-32, 1, 1, 0, col, 1);

for (var i = 0; i < pausecount; i += 1){
	sprite = ds_map_find_value(pauses[i],"Sprite");
	pausex = pausestartx+(i*spacing);
	if pause = i{
		alpha = 1;
	}else{
		alpha = unselectedalpha;
	}
	draw_sprite_ext(sprite, 0, pausex, middley+16, xscale, yscale, 0, col, alpha);
}

//draw_text(45, 65, string(pause));
//draw_text(45, 75, string(pausecount));