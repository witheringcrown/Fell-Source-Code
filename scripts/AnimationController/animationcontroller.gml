// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimationController(state){
	switch state{
		case states.idle:
			sprite = idlesprite;
			spriteeyes = idlespriteeyes;
		break;
		case states.running:
			sprite = runsprite;
			spriteeyes = runspriteeyes;
		break;
		case states.jumping:
			sprite = jumpsprite;
			spriteeyes = jumpspriteeyes;
		break;
		case states.falling:
			sprite = fallsprite;
			spriteeyes = fallspriteeyes;
		break;
		case states.wallsliding:
			sprite = wallsprite;
			spriteeyes = wallspriteeyes;
		break;
		case states.dashing:
			sprite = jumpsprite;
			spriteeyes = jumpspriteeyes;
		break;
		case states.walljumping:
			sprite = jumpsprite;
			spriteeyes = jumpspriteeyes;
		break;
	}
}