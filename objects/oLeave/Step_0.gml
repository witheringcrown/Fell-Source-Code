if place_meeting(x,y, oPlayer){
	instance_destroy(oPlayer);
	StartTransition(transitionroom, key, transtime, transcol);
	oCore.timing = false;
	
	ini_open( "save.ini" );
	ini_write_real("SAVE", "room", transitionroom);
	ini_write_string("SAVE", "key", key);
	ini_write_real("SAVE", "backwards", oCore.backwards);
	oCore.savekey = key;
	oCore.saveroom = transitionroom;
	ini_close();
}