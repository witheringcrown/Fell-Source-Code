image_angle += 15;

if (x == x1 && y == y1){
	direction = point_direction(x, y, x2, y2);
}else if (x == x2 && y == y2){
	direction = point_direction(x, y, x1, y1);
}