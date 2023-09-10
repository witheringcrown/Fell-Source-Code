key = "Left"
oCore.level1 = true;
ini_open( "save.ini" );
ini_write_real("SAVE", "level1", true);
ini_close();