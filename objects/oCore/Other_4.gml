if !instance_exists(oPlayer) && transitioned = true{
	if key = "Resume"{
		instance_create_layer(pausex, pausey, "Player", oPlayer);
		key = savekey;
	}
}

bgcol = global.pbackground;
bglayerid = layer_get_id("Background");
bgid = layer_background_get_id(bglayerid);
layer_background_blend(bgid, bgcol);

if palette3 and palette4 and palette5 and palette6 and !palette7{
	palette7 = true;
	ini_write_real("SAVE", "palette7", oCore.palette7);
}
ini_close();