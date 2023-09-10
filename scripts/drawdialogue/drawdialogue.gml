// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawDialogue(sprite, image1, image2, imagex, imagey, col, imagespeed, showdialogue){
	if showdialogue{
		if transitioned = true{
			if imagetimer >= imagespeed{
				if showimage = image1{
					showimage = image2;
				}else{
					showimage = image1;
				}
				imagetimer = 0;
			}
			imagetimer += 1;
			scale = 1;
		}else{
			if transtime >= 0.15*room_speed{
				transitioned = true;
			}
			scale = transtime*(1/9);
			transtime += 1;
		}
	}else{
		showimage = image1;
		if transtime > 0{
			transtime -= 1;
			scale = transtime*(1/9);
			transitioned = false;
		}
	}
	draw_sprite_ext(sprite, showimage, imagex, imagey, scale, scale, 0, col, 1);
}