if !instance_exists(oPlayer) && oCore.transitioned = true{
	if oCore.key = key{
		instance_create_layer(x, y+4, "Player", oPlayer);
	}
}