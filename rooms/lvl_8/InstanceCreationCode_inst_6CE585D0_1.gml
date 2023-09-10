Input_Get(0);
sprite = sSign;
if oCore.truedevice < 0 {
	dsprite = sKeyboardBinds;
	keyimage = KeybindNumbering(global.keybinddash);
	im1 = keyimage;
	im2 = 0;
	imy = 64;
	imx = 152;
}else{
	dsprite = sControllerBinds;
	im1 = ControllerbindNumbering(global.controllerbinddash);
	im2 = 0;
	imy = 64;
	imx = 152;
}

col = global.pforeground;
imspd = 0.5*room_speed;
showdialogue = false;
transitioned = false;