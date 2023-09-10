function Gravity(gravityforce){
	vspd += gravityforce/room_speed;
	
	vspd = clamp(vspd, -infinity, maxfallvelocity);
	
	if place_meeting(x, y + vspd, oSolid){
		while !place_meeting(x, y + sign(vspd), oSolid){
			y += sign(vspd)
		}
		vspd = 0;
	}
}


function HorizontalMovement(acceleration, deceleration, maxspeed){
	var xAcceleration;
	
	if xInput !=0{
		xAcceleration = acceleration;
		xDirection = xInput;
	}else{
		xAcceleration = -deceleration;
	}
	
	spd = clamp(spd+xAcceleration, 0, maxspeed);
	
	hspd = xDirection*spd;
	
	if place_meeting(x + hspd, y, oSolid){
		while !place_meeting(x + sign(hspd), y, oSolid){
			x += sign(hspd)
		}
		spd = 0;
		hspd = 0;
	}
}

function CoyoteCheck(walkofftime){
	if walkofftime <= coyotetime and jumped = false{
		return true;
	}else{
		return false;
	}
}

function Jump(jumpvelocity){
	vspd = -jumpvelocity;
	jumpinputheld = true;
	part_particles_create(global.particlesystem, x, y+feetheight, dustpart, 5);
	PlaySound(sndJump, global.pitchlowjump, global.pitchhighjump);
}

function VariableJump(variablejumprate){
	grav -= variablejumprate;
	jumptime += 1;
}

function WallJump(yvelocity, xvelocity){
		hspd = -walldirection*xvelocity
		vspd = -yvelocity
		walljumptime = 0;
		spd = 0;
		part_particles_create(global.particlesystem, x+walldirection*halfwidth, y, dustpart, 5);
		PlaySound(sndJump, global.pitchlowjump, global.pitchhighjump);
}

function Dash(velocity){
	hspd = xDirection*velocity
	dashtime = 0;
	vspd = 0;
	PlaySound(sndTransition, global.pitchlowtransition, global.pitchhightransition);
}

function Unstick(){
	if place_meeting(x,y,oSolid){
		for (var i = 0; i < 1000; ++i){
			//Right
			if !place_meeting(x + i, y, oSolid){
				x += i;
				break;
			}
			//Left
			if !place_meeting(x - i, y, oSolid){
				x -= i;
				break;
			}
			//Down
			if !place_meeting(x, y + i, oSolid){
				y += i;
				break;
			}
			//Up
			if !place_meeting(x, y - i, oSolid){
				y -= i;
				break;
			}
		}
	}
}