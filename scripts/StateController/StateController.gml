// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StateController(state){
	switch state{
		case states.idle:
			Idle();
		break;
		case states.running:
			Running();
		break;
		case states.jumping:
			Jumping();
		break;
		case states.falling:
			Falling();
		break;
		case states.wallsliding:
			WallSliding();
		break;
		case states.walljumping:
			WallJumping();
		break;
		case states.dashing:
			Dashing();
		break;
	}
}