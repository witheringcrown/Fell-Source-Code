col = global.pbackgroundother;

for (i = 0; i < room_height; i++){
	if collision_line(x, y, x, y - i, oSolid, false, true){
		place = i;
		break;
	}
}