function MakeParticleSystem(){
	global.particlesystem = part_system_create();
	part_system_depth(global.particlesystem,-1000);
}
function ParticleSystem() {
	DustPart();
	DeathPart();
	ConfettiPart();
	if (object_index = oPlayer){
		DashPart();
	}
}
function DustPart() {
	dustpart = part_type_create();
	part_type_shape(dustpart,pt_shape_square);
	part_type_size(dustpart,.01,.02,0,0);
	part_type_scale(dustpart,1,1);
	part_type_color1(dustpart,global.pplayer);
	part_type_alpha1(dustpart,0.5);
	part_type_speed(dustpart,0.1,0.2,0,0);
	part_type_direction(dustpart,0,359,0,0);
	part_type_gravity(dustpart,.01,90);
	part_type_orientation(dustpart,0,0,0,0,1);
	part_type_life(dustpart,20,30);
}
function DeathPart() {
	deathpart = part_type_create();
	part_type_shape(deathpart,pt_shape_disk);
	part_type_size(deathpart,.03,.05,0,0);
	part_type_scale(deathpart,1,1);
	part_type_color1(deathpart, global.pplayer);
	part_type_alpha1(deathpart,1);
	part_type_speed(deathpart,2,4,-0.1,0);
	part_type_direction(deathpart,0,359,0,0);
	part_type_gravity(deathpart,0.3,270);
	part_type_orientation(deathpart,0,0,0,0,1);
	part_type_life(deathpart,20,30);
}
function DashPart() {
	dashpart = part_type_create();
	part_type_sprite(dashpart,jumpsprite,0,0,0);
	part_type_size(dashpart,1,1,-0.01,0);
	part_type_scale(dashpart,xDirection,1);
	part_type_color1(dashpart, global.pplayer);
	part_type_alpha2(dashpart,1, 0);
	part_type_speed(dashpart,0,0,0,0);
	part_type_direction(dashpart,0,0,0,0);
	part_type_gravity(dashpart,0,270);
	part_type_orientation(dashpart,0,0,0,0,0);
	part_type_life(dashpart,20,20);
}
function ConfettiPart() {
	confettipart = part_type_create();
	part_type_shape(confettipart, pt_shape_pixel);
	part_type_size(confettipart,1,3,0,0);
	part_type_scale(confettipart,1,1);
	part_type_color1(confettipart, global.pplayer);
	part_type_alpha1(confettipart,1);
	part_type_speed(confettipart,4,8,-0.1,0);
	part_type_direction(confettipart,80,100,0,10);
	part_type_gravity(confettipart,0.3,270);
	part_type_orientation(confettipart,0,0,0,0,1);
	part_type_life(confettipart,20,30);
}
function Confetti(){
	part_type_color1(confettipart, global.pplayer);
	part_particles_create(global.particlesystem, x, y-8, confettipart, 10);
	part_type_color1(confettipart, global.ptiles);
	part_particles_create(global.particlesystem, x, y-8, confettipart, 10);
	part_type_color1(confettipart, global.phazards);
	part_particles_create(global.particlesystem, x, y-8, confettipart, 10);
	part_type_color1(confettipart, global.phazards);
	part_particles_create(global.particlesystem, x, y-8, confettipart, 10);
}