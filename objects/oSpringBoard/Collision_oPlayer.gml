if (image_index <= 0){
	image_index = 1;
	with (other){
		Jump(other.spring);
		state = states.jumping;
		jumped = true;
		jumptime = maxjumptime*room_speed;
		PlaySound(sndJumpPad, global.pitchlowspring, global.pitchhighspring);
		dashes = maxdashes;
		jumps = maxjumps;
	}
	cooldown = maxcooldown;
}