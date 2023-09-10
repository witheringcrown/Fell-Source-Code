if (popped == false){
	if (popping){
		draw_sprite_ext(sMandrakePopUp, image_index, x, y, 1, 1, 0, col, 1);
		draw_sprite_ext(sMandrakePopUpSprout, image_index, x, y, 1, 1, 0, colS, 1);
	}else{
		draw_sprite_ext(sMandrakePopUpSprout, 0, x, y, 1, 1, 0, colS, 1);
	}
}else{
	draw_sprite_ext(sMandrakeIdle, image_index, x, y, 1, 1, 0, col, 1);
	draw_sprite_ext(sMandrakeIdleSprout, image_index, x, y, 1, 1, 0, colS, 1);
	DrawDialogue(dsprite, im1, im2, imx, imy, colD, imspd, showdialogue);
	draw_sprite_ext(sDialogue, 0, x, y - 27, 1, 1, 0, colD, 1);
}