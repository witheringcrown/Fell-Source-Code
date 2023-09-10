// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AutoTiling(){
	GetCollisions();
	if (tl && tr && tu && td && tlu && tru && tld && trd){
		var fossil = random_range(0,100);
		if fossil <= 1{
			col = global.pbackgroundother;
			tileindex = choose(47,48);
		}else{
			tileindex = 0;
		}
	}else if (tl && tr && tu && td && !tlu && tru && tld && trd){
		tileindex = 1;
	}else if (tl && tr && tu && td && tlu && !tru && tld && trd){
		tileindex = 2;
	}else if (tl && tr && tu && td && !tlu && !tru && tld && trd){
		tileindex = 3;
	}else if (tl && tr && tu && td && tlu && tru && tld && !trd){
		tileindex = 4;
	}else if (tl && tr && tu && td && !tlu && tru && tld && !trd){
		tileindex = 5;
	}else if (tl && tr && tu && td && tlu && !tru && tld && !trd){
		tileindex = 6;
	}else if (tl && tr && tu && td && !tlu && !tru && tld && !trd){
		tileindex = 7;
	}else if (tl && tr && tu && td && tlu && tru && !tld && trd){
		tileindex = 8;
	}else if (tl && tr && tu && td && !tlu && tru && !tld && trd){
		tileindex = 9;
	}else if (tl && tr && tu && td && tlu && !tru && !tld && trd){
		tileindex = 10;
	}else if (tl && tr && tu && td && !tlu && !tru && !tld && trd){
		tileindex = 11;
	}else if (tl && tr && tu && td && tlu && tru && !tld && !trd){
		tileindex = 12;
	}else if (tl && tr && tu && td && !tlu && tru && !tld && !trd){
		tileindex = 13; //this one 
	}else if (tl && tr && tu && td && tlu && !tru && !tld && !trd){
		tileindex = 14;
	}else if (tl && tr && tu && td && !tlu && !tru && !tld && !trd){
		tileindex = 15;
	}else if (!tl && tr && tu && td && tru && trd){
		tileindex = 16;
	}else if (!tl && tr && tu && td && !tru && trd){
		tileindex = 17;
	}else if (!tl && tr && tu && td && tru && !trd){
		tileindex = 18;
	}else if (!tl && tr && tu && td && !tru && !trd){
		tileindex = 19;
	}else if (tl && tr && !tu && td && tld && trd){
		tileindex = choose(20, 49, 50, 51);
	}else if (tl && tr && !tu && td && tld && !trd){
		tileindex = 21;
	}else if (tl && tr && !tu && td && !tld && trd){
		tileindex = 22;
	}else if (tl && tr && !tu && td && !tld && !trd){
		tileindex = 23;
	}else if (tl && !tr && tu && td && tlu && tld){
		tileindex = 24;
	}else if (tl && !tr && tu && td && tlu && !tld){
		tileindex = 25;
	}else if (tl && !tr && tu && td && !tlu && tld){
		tileindex = 26;
	}else if (tl && !tr && tu && td && !tlu && !tld){
		tileindex = 27;
	}else if (tl && tr && tu && !td && tlu && tru){
		tileindex = 28;
	}else if (tl && tr && tu && !td && !tlu && tru){
		tileindex = 29;
	}else if (tl && tr && tu && !td && tlu && !tru){
		tileindex = 30;
	}else if (tl && tr && tu && !td && !tlu && !tru){
		tileindex = 31;
	}else if (!tl && !tr && tu && td){
		tileindex = 32;
	}else if (tl && tr && !tu && !td){
		tileindex = 33;
	}else if (!tl && tr && !tu && td && trd){
		tileindex = 34;
	}else if (!tl && tr && !tu && td && !trd){
		tileindex = 35;
	}else if (tl && !tr && !tu && td && tld){
		tileindex = 36;
	}else if (tl && !tr && !tu && td && !tld){
		tileindex = 37;
	}else if (tl && !tr && tu && !td && tlu){
		tileindex = 38;
	}else if (tl && !tr && tu && !td && !tlu){
		tileindex = 39;
	}else if (!tl && tr && tu && !td && tru){
		tileindex = 40;
	}else if (!tl && tr && tu && !td && !tru){
		tileindex = 41;
	}else if (!tl && !tr && !tu && td){
		tileindex = 42;
	}else if (!tl && tr && !tu && !td){
		tileindex = 43;
	}else if (!tl && !tr && tu && !td){
		tileindex = 44;
	}else if (tl && !tr && !tu && !td){
		tileindex = 45;
	}else if (!tl && !tr && !tu && !td){
		tileindex = 46;
	}else{
		tileindex = 46;
	}
	if (oCore.area == 0){
		if !td{
			var grasslayer = choose ("Foreground", "Solids");
			with instance_create_layer(x, y + 8, grasslayer, oGrass){
				sprite = other.hangingGrass;
				grass = irandom_range(0,5);
				col = other.col;
			}
		}
		if !tu{
			var grasslayer = choose ("Foreground", "Solids");
			with instance_create_layer(x, y - 8, grasslayer, oGrass){
				sprite = other.groundGrass;
				grass = irandom_range(0,5);
				col = other.col;
			}
		}
	}
}

function GetCollisions(){
	tl = place_meeting(x-8,y,oSolid);
	tr = place_meeting(x+8,y,oSolid);
	tu = place_meeting(x,y-8,oSolid);
	td = place_meeting(x,y+8,oSolid);
	tlu = place_meeting(x-8,y-8,oSolid);
	tru = place_meeting(x+8,y-8,oSolid);
	tld = place_meeting(x-8,y+8,oSolid);
	trd = place_meeting(x+8,y+8,oSolid);
}