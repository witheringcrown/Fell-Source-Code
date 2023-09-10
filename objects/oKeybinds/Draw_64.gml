keybindx = 32;
for (var i = 0; i < keybindcount; i += 1){
	sprite = ds_map_find_value(keybinds[i],"Sprite");
	keybindy = keybindstarty+(i*spacing);
	if keybind = i{
		alpha = 1;
	}else{
		alpha = unselectedalpha;
	}
	draw_sprite_ext(sprite, 0, keybindx, keybindy, xscale, yscale, 0, col, alpha);
}

if truedevice >= 0{
	if remapping{
		controllerimage = 0;
		showalpha = 1;
	}else{
		controllerimage = ControllerbindNumbering(ds_map_find_value(keybinds[keybind],"Button"));
		showalpha = unselectedalpha;
	}
	draw_sprite_ext(sControllerBinds, controllerimage, keybindshowx, room_height/2, 1, 1, 0, col, showalpha);
}else{
	if remapping{
		keyimage = 0;
		showalpha = 1;
	}else{
		keyimage = KeybindNumbering(ds_map_find_value(keybinds[keybind],"Key"));
		showalpha = unselectedalpha;
	}
	draw_sprite_ext(sKeyboardBinds, keyimage, keybindshowx, room_height/2, 1, 1, 0, col, showalpha);
}
//draw_text(45, 65, string(keybind));
//draw_text(45, 75, string(keybindcount));