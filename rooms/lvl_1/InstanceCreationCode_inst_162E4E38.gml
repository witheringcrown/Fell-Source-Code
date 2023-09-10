Input_Get(0);
if oCore.backwards = false{
	sprite = sSign;
	if oCore.truedevice < 0 {
		dsprite = sKeyboardBinds;
		im1 = KeybindNumbering(global.keybindleft);
		im2 = KeybindNumbering(global.keybindright);
	}else{
		dsprite = sControllerBinds;
		im1 = ControllerbindNumbering(global.controllerbindleft);
		im2 = ControllerbindNumbering(global.controllerbindright);
	}
	imy = y - 43;
	imx = x
	imspd = 1*room_speed;
	showdialogue = false;
	transitioned = false;
}else{
	instance_destroy();
	instance_create_layer(x, y-12, "Solids", oCrown);
}