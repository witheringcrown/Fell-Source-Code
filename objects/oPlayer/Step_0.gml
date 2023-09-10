Input_Get(0);

xInput = rightinput - leftinput;
groundcheck = collision_rectangle(x-(sprite_width/2)+1,y+(sprite_height/2),x+(sprite_width/2)-1,(y+(sprite_height/2))+groundforgiveness, oSolid, false, true);
wallcheck = place_meeting(x+xDirection*wallforgiveness, y, oSolid);
Unstick();
StateController(state);
PlayerAnimationController(state);



//Death
if place_meeting(x, y, oSpike){
	instance_destroy();
	part_particles_create(global.particlesystem, x+walldirection*halfwidth, y, deathpart, 10);
	PlaySound(sndDeath, global.pitchlowdeath, global.pitchhighdeath);
	StartTransition(room, oCore.key, 0.25, global.pbackground);
	oCore.deaths += 1;
}