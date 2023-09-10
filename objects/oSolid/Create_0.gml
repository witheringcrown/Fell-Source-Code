col = global.ptiles;
bgcol = global.pbackground;

switch (oCore.area){
	case 0:
		tileset = sTileset;
		groundGrass = sGrass;
		hangingGrass = sHangingGrass;
	break;
	case 1:
		tileset = sBoredVeinsTileset;
	break;
}

AutoTiling();