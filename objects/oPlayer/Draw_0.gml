draw_sprite_ext(spriteeyes, image_index, x, y, xDirection, image_yscale, rot, eyecol, image_alpha);
draw_sprite_ext(sprite, image_index, x, y, xDirection, image_yscale, rot, col, image_alpha);

switch state{
	case states.idle:
		statestring = "Idle"
	break;
	case states.running:
		statestring = "Running"
	break;
	case states.jumping:
		statestring = "Jumping"
	break;
	case states.falling:
		statestring = "Falling"
	break;
	case states.wallsliding:
		statestring = "WallSliding"
	break;
	case states.dashing:
		statestring = "Dashing"
	break;
	case states.walljumping:
		statestring = "WallJumping"
	break;
}


//draw_text(x, y-16, statestring);
//draw_text(x, y-32, image_index);
//draw_text(x, y-32, string(xInput));
//draw_text(x, y-48, string(xDirection));
//draw_text(x, y-64, string(maxjumptime*room_speed));
//draw_text(x, y-80, string(dashspeed));