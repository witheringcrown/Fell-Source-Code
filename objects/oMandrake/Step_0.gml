if place_meeting(x, y, oPlayer){
	if (popped = false && popping = false){
		image_index = 0;
		sprite_index = sMandrakePopUp;
		popping = true;
	}else{
		showdialogue = true;
	}
}else{
	showdialogue = false;
}

if (popping){
	if (image_index >= image_number-1){
		popping = false;
		popped = true;
		image_index = 0; 
		sprite_index = sMandrakeIdle;
	}
}