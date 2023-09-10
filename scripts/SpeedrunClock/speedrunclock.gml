// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SpeedrunClock(){
	///TIMER
	if transitioned and timing{
		time += 1/room_speed;
	}

	//time calculation
	hours = floor(time/3600);
	minutes = floor(time/60) - hours*60;
	seconds = time - minutes*60 - hours*3600;

	//padding calculation
	if string_length(string(hours)) < 2{
		var padding = string(0);
		hourstring = padding + string(hours);
	}else{ hourstring = string(hours) }
	if string_length(string(minutes)) < 2{
		var padding = string(0);
		minutestring = padding + string(minutes);
	}else{ minutestring = string(minutes) }
	if string_length(string(seconds)) < 5{
		var padding = string(0);
		secondstring = padding + string_format(seconds, 1, 2);
	}else{ secondstring = string_format(seconds, 2, 2) }

	timestring = hourstring + ":" + minutestring + ":" + secondstring;
}