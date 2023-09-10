if !won{
	ini_open("save.ini");
	Confetti();
	PlaySound(sndWin, 1, 1);
	won = true;
	if room == lvl_30{
		oCore.backwards = true;
		oCore.palette5 = true;
		ini_write_real("SAVE", "palette3", oCore.palette5);
		if oCore.time < oCore.devrecord{
			oCore.palette7 = true;
			ini_write_real("SAVE", "palette5", oCore.palette7);
		}
	}else if room == lvl_1{
		oCore.palette6 = true;
		ini_write_real("SAVE", "palette4", oCore.palette6);
	}
	oCore.timing = false;
	
	oCore.key = "Win";
	oCore.savekey = "Win";
	oCore.saveroom = lvl_30;
	
	ini_write_real("SAVE", "room", lvl_30);
	ini_write_string("SAVE", "key", "Win");
	ini_write_real("SAVE", "backwards", oCore.backwards);
	ini_close();
}