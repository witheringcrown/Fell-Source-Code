enum states{
	idle = 0,
	running = 1,
	jumping = 2,
	falling = 3,
	wallsliding = 4,
	walljumping = 5,
	dashing = 6
}

function Idle(){
	dashes = maxdashes;
	jumps = maxjumps;
	jumped = false;
	walkofftime = 0;
	jumptime = 0;
	grav = initgrav;
	
	if !place_meeting(x,y+1,oSolid){
		state = states.falling;
	}else if jumpinput{
		Jump(jumpvelocity);
		state = states.jumping;
		jumped = true;
	}else if (leftinput or rightinput){
		state = states.running;
	}
	if (dashinput){
			state = states.dashing;
			Dash(dashspeed);
	}
}

function Falling(){	
	cancoyote = CoyoteCheck(walkofftime);
	grav = initgrav;
	wallmovetime += 1;
	walkofftime += 1;
	
	HorizontalMovement(acceleration, deceleration, maxspeed);
	
	if wallcheck && xInput = xDirection{
		vspd = 0;
		state = states.wallsliding;
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
	}else if (jumpinput){
		if cancoyote{
			Jump(jumpvelocity);
			state = states.jumping;
			jumped = true;
		}else if jumps > 0{
			jumptime = 0;
			Jump(jumpvelocity);
			state = states.jumping;
			jumps -= 1;
		}
	}else if vspd = 0{
		state = states.idle;
		part_particles_create(global.particlesystem, x, y+feetheight, dustpart, 5);
		
		PlaySound(sndLand, global.pitchlowland, global.pitchhighland);
	}
	if (dashinput) && (dashes > 0){
			state = states.dashing;
			Dash(dashspeed);
			dashes -= 1;
	}
	
	Gravity(grav);
	y += vspd;
	x += hspd;
}

function Jumping(){
	
	HorizontalMovement(acceleration, deceleration, maxspeed);
	
	if (jumpinputheld && (jumptime <= maxjumptime*room_speed)){
		VariableJump(variablejumprate);
	}else if (wallcheck) && (xInput = xDirection){
			vspd = 0;
			state = states.wallsliding;
			PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
	}else{
		grav = initgrav;
		state = states.falling
	}
	if (jumpinput) && (jumps > 0){
			grav = initgrav;
			jumps -= 1;
			jumptime = 0;
			Jump(jumpvelocity);
			jumped = true;
	}
	if (dashinput) && (dashes > 0){
		state = states.dashing;
		Dash(dashspeed);
		dashes -= 1;
	}
	
	Gravity(grav);
	y += vspd;
	x += hspd;
}

function Running(){
	
	HorizontalMovement(acceleration, deceleration, maxspeed);
	
	if !groundcheck{
		state = states.falling;
	}else if jumpinput{
		Jump(jumpvelocity);
		state = states.jumping;
		jumped = true;
	}else if hspd = 0{
		state = states.idle;
	}
	if dashinput{
		state = states.dashing;
		Dash(dashspeed);
	}
	
	x += hspd;
	
	if parttime >= partwalktime*room_speed{
		part_particles_create(global.particlesystem, x, y+feetheight, dustpart, 1);
		parttime = 0;
	}
	parttime += 1;
	
	if image_index <= 0.25 and !audio_is_playing(footstepsound){
		PlaySound(footstepsound, global.pitchhighfootstep, global.pitchlowfootstep);
	}
}

function WallSliding(){
	walkofftime += 1;
	walldirection = place_meeting(x+wallforgiveness, y, oSolid) - place_meeting(x-wallforgiveness, y, oSolid);
	HorizontalMovement(acceleration, deceleration, maxspeed);
	
	if !wallcheck{
		if wallmovetime <= maxwallmovetime{
			if jumpinput{
				grav = initgrav;
				WallJump(walljumpyvelocity, walljumpxvelocity);
				state = states.walljumping;
			}
			grav = initgrav;
			wallmovetime += 1;
		}else{
			state = states.falling;
			if audio_is_playing(sndSlide){
				audio_stop_sound(sndSlide);
			}
		}
	}else if jumpinput{
		grav = initgrav;
		WallJump(walljumpyvelocity, walljumpxvelocity);
		state = states.walljumping;
		
		audio_stop_sound(sndSlide);
	}else if place_meeting(x, y+1, oSolid){
		state = states.idle;
		part_particles_create(global.particlesystem, x, y+feetheight, dustpart, 5);
		
		if audio_is_playing(sndSlide){
			audio_stop_sound(sndSlide);
		}

		PlaySound(sndLand, global.pitchlowland, global.pitchhighland);
	}else{
		wallmovetime = 0;
		grav = slidegrav;
		
		if vspd >= slidecutoff{
			if parttime >= partslidetime*room_speed{
				part_particles_create(global.particlesystem, x+walldirection*halfwidth, y, dustpart, 1);
				parttime = 0;
			}
			if !audio_is_playing(sndSlide){
				PlaySound(sndSlide, global.pitchlowslide, global.pitchhighslide);
			}
			parttime += 1;
		}
	}
	
	if (dashinput) && (dashes > 0){
		if wallcheck{
			vspd = 0;
			xDirection = -walldirection;
		}
		Dash(dashspeed);
		state = states.dashing;
		dashes -= 1;
			
		if audio_is_playing(sndSlide){
			audio_stop_sound(sndSlide);
		}
	}
	
	Gravity(grav);
	y += vspd;
	x += hspd;
}

function WallJumping(){
	if hInput != 0{
		xDirection = hInput;
	}else if hspd != 0{
		xDirection = sign(hspd);
	}else{
		xDirection = 1;
	}
	
	if walljumptime < maxwalljumptime*room_speed{
		walljumptime += 1;
	}else{
		state = states.falling;
		walljumptime = 0;
	}
	if (jumpinput) && (jumps > 0){
			grav = initgrav;
			jumps -= 1;
			jumptime = 0;
			Jump(jumpvelocity);
			state = states.jumping;
			jumped = true;
	}
	if (dashinput) && (dashes > 0){
			state = states.dashing;
			Dash(dashspeed);
			dashes -= 1;
	}
	
	Gravity(grav);
	y += vspd;
	
	//Horizontal Collisions
	if place_meeting(x + hspd, y, oSolid){
		while !place_meeting(x + sign(hspd), y, oSolid){
			x += sign(hspd)
		}
		spd = 0;
		hspd = 0;
		vspd = 0;
		state = states.wallsliding;
		PlaySound(sndMenuNavigation, global.pitchlowmenu, global.pitchhighmenu);
	}
	
	x += hspd;
}

function Dashing(){
	x += hspd;
	dashtime += 1;
	if dashtime >= maxdashtime*room_speed{
		if place_meeting(x, y+1, oSolid){
			state = states.idle;
		}else{
			state = states.falling;
		}
	}
	
	if jumpinput{
		if cancoyote or groundcheck{
			Jump(jumpvelocity);
			state = states.jumping;
			jumped = true;
		}else if jumps > 0{
			jumptime = 0;
			Jump(jumpvelocity);
			state = states.jumping;
			jumps -= 1;
		}
	}
	
	//particles
	if parttime >= partdashtime*room_speed{
		part_type_scale(dashpart,xDirection,1);
		part_particles_create(global.particlesystem, x, y, dashpart, 1);
		parttime = 0;
	}
	parttime += 1;
	
	//Horizontal Collisions
	if place_meeting(x + hspd, y, oSolid){
		while !place_meeting(x + sign(hspd), y, oSolid){
			x += sign(hspd)
		}
		spd = 0;
		hspd = 0;
		vspd = 0;
		state = states.wallsliding;
	}
}