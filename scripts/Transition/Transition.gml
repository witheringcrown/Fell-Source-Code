// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Transition(){
	transtimeperc = transtimer/(transtime*room_speed);
	
	transitionx1_1 = 0;
	transitionx1_2 = gui_width;

	transitiony1_1 = 0;
	transitiony1_2 = 0;

	transitionx2_1 = transtimeperc*(gui_width/2)+32;
	transitionx2_2 = -transitionx2_1+gui_width;

	transitiony2_1 = gui_height;
	transitiony2_2 = gui_height;
	
	if transitioned{
		TransitionOut();
	}else{
		TransitionIn();
	}
}

function TransitionIn(){
	if transtimer <= transtime*room_speed{
		transtimer += 1;
	}else{
		room_goto(transitionroom);
		transitioned = true;
		PlaySound(sndTransition, global.pitchlowtransition, global.pitchhightransition);
	}
}

function TransitionOut(){
	if transtimer >= 0{
		transtimer -= 1;
	}else{
		transitioning = false;
	}
}

function StartTransition(transitionroom, key, transtime, color){
	oCore.transitionroom = transitionroom;
	oCore.key = key;
	oCore.transcol = color;
	oCore.transitioned = false;
	oCore.transtime = transtime;
	oCore.transtimer = 0;
	oCore.transitioning = true;
	
	PlaySound(sndTransition, global.pitchlowtransition, global.pitchhightransition);
}

function AreaChange(switchArea){
	oCore.area = switchArea;
	switch (switchArea){
		case 0:
			oCore.audiotrack = sndShallowAbyss;
		break;
		case 1:
			oCore.audiotrack = sndBoredVeins;
		break;
	}
}