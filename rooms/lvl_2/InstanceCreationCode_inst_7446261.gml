Input_Get(0);
sprite = sSign;
if oCore.truedevice < 0 {
	dsprite = sKeyboardBinds;
	keyimage = KeybindNumbering(global.keybindjump);
	im1 = keyimage;
	im2 = 0;
	imy = y - 60;
	imx = x + 8;
}else{
	dsprite = sControllerBinds;
	im1 = ControllerbindNumbering(global.controllerbindjump);
	im2 = 0;
	imy = y - 70;
	imx = x;
}

col = global.pforeground;
imspd = 1*room_speed;
showdialogue = false;
transitioned = false;