enum keybindtypes{
	left,
	right,
	up,
	down,
	jump,
	dash,
	interact,
	pause,
	reset,
	back
}

function KeybindInit(){
	//Left
	keybinds[keybindtypes.left] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.left],"Sprite", sArrowLeft);
	ds_map_add(keybinds[keybindtypes.left],"Key", global.keybindleft);
	ds_map_add(keybinds[keybindtypes.left],"Button", global.controllerbindleft);
	//Right
	keybinds[keybindtypes.right] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.right],"Sprite", sArrowRight);
	ds_map_add(keybinds[keybindtypes.right],"Key", global.keybindright);
	ds_map_add(keybinds[keybindtypes.right],"Button", global.controllerbindright);
	//Up
	keybinds[keybindtypes.up] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.up],"Sprite", sArrowUp);
	ds_map_add(keybinds[keybindtypes.up],"Key", global.keybindup);
	ds_map_add(keybinds[keybindtypes.up],"Button", global.controllerbindup);
	//Down
	keybinds[keybindtypes.down] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.down],"Sprite", sArrowDown);
	ds_map_add(keybinds[keybindtypes.down],"Key", global.keybinddown);
	ds_map_add(keybinds[keybindtypes.down],"Button", global.controllerbinddown);
	//Jump
	keybinds[keybindtypes.jump] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.jump],"Sprite", sJumpIcon);
	ds_map_add(keybinds[keybindtypes.jump],"Key", global.keybindjump);
	ds_map_add(keybinds[keybindtypes.jump],"Button", global.controllerbindjump);
	//Dash
	keybinds[keybindtypes.dash] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.dash],"Sprite", sDashIcon);
	ds_map_add(keybinds[keybindtypes.dash],"Key", global.keybinddash);
	ds_map_add(keybinds[keybindtypes.dash],"Button", global.controllerbinddash);
	//Interact
	keybinds[keybindtypes.interact] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.interact],"Sprite", sPlayIcon);
	ds_map_add(keybinds[keybindtypes.interact],"Key", global.keybindinteract);
	ds_map_add(keybinds[keybindtypes.interact],"Button", global.controllerbindinteract);
	//Pause
	keybinds[keybindtypes.pause] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.pause],"Sprite", sPauseIcon);
	ds_map_add(keybinds[keybindtypes.pause],"Key", global.keybindpause);
	ds_map_add(keybinds[keybindtypes.pause],"Button", global.controllerbindpause);
	//Reset
	keybinds[keybindtypes.reset] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.reset],"Sprite", sResetIcon);
	ds_map_add(keybinds[keybindtypes.reset],"Key", 0);
	ds_map_add(keybinds[keybindtypes.reset],"Button", 0);
	//Back
	keybinds[keybindtypes.back] = ds_map_create();
	ds_map_add(keybinds[keybindtypes.back],"Sprite", sQuitIcon);
	ds_map_add(keybinds[keybindtypes.back],"Key", 0);
	ds_map_add(keybinds[keybindtypes.back],"Button", 0);
}

function DefaultKeybinds(){
	global.defkeybindleft = ord("A");
	global.defkeybindright = ord("D");
	global.defkeybindup = ord("W");
	global.defkeybinddown = ord("S");
	global.defkeybindjump = vk_space;
	global.defkeybinddash = vk_shift;
	global.defkeybindinteract = vk_enter;
	global.defkeybindpause = vk_escape;
	
	global.defcontrollerbindleft = gp_padl;
	global.defcontrollerbindright = gp_padr;
	global.defcontrollerbindup = gp_padu;
	global.defcontrollerbinddown = gp_padd;
	global.defcontrollerbindjump = gp_face1;
	global.defcontrollerbinddash = gp_face4;
	global.defcontrollerbindinteract = gp_face3;
	global.defcontrollerbindpause = gp_start;
}

function SaveKeybinds(){
	ini_open("save.ini")
	ini_write_real("SAVE", "keyleft", global.keybindleft);
	ini_write_real("SAVE", "keyright", global.keybindright);
	ini_write_real("SAVE", "keyup", global.keybindup);
	ini_write_real("SAVE", "keydowm", global.keybinddown);
	ini_write_real("SAVE", "keyjump", global.keybindjump);
	ini_write_real("SAVE", "keydash", global.keybinddash);
	ini_write_real("SAVE", "keyinteract", global.keybindinteract);
	ini_write_real("SAVE", "keypause", global.keybindpause);
	
	ini_write_real("SAVE", "controllerleft", global.controllerbindleft);
	ini_write_real("SAVE", "controllerright", global.controllerbindright);
	ini_write_real("SAVE", "controllerup", global.controllerbindup);
	ini_write_real("SAVE", "controllerdowm", global.controllerbinddown);
	ini_write_real("SAVE", "controllerjump", global.controllerbindjump);
	ini_write_real("SAVE", "controllerdash", global.controllerbinddash);
	ini_write_real("SAVE", "controllerinteract", global.controllerbindinteract);
	ini_write_real("SAVE", "controllerpause", global.controllerbindpause);
	ini_close();
}

function LoadKeybinds(){
	ini_open("save.ini")
	DefaultKeybinds();
	global.keybindleft = ini_read_real("SAVE", "keyleft", global.defkeybindleft);
	global.keybindright = ini_read_real("SAVE", "keyright", global.defkeybindright);
	global.keybindup = ini_read_real("SAVE", "keyup", global.defkeybindup);
	global.keybinddown = ini_read_real("SAVE", "keydowm", global.defkeybinddown);
	global.keybindjump = ini_read_real("SAVE", "keyjump", global.defkeybindjump);
	global.keybinddash = ini_read_real("SAVE", "keydash", global.defkeybinddash);
	global.keybindinteract = ini_read_real("SAVE", "keyinteract", global.defkeybindinteract);
	global.keybindpause = ini_read_real("SAVE", "keypause", global.defkeybindpause);
	
	global.controllerbindleft = ini_read_real("SAVE", "controllerleft", global.defcontrollerbindleft);
	global.controllerbindright = ini_read_real("SAVE", "controllerright", global.defcontrollerbindright);
	global.controllerbindup = ini_read_real("SAVE", "controllerup", global.defcontrollerbindup);
	global.controllerbinddown = ini_read_real("SAVE", "controllerdowm", global.defcontrollerbinddown);
	global.controllerbindjump = ini_read_real("SAVE", "controllerjump", global.defcontrollerbindjump);
	global.controllerbinddash = ini_read_real("SAVE", "controllerdash", global.defcontrollerbinddash);
	global.controllerbindinteract = ini_read_real("SAVE", "controllerinteract", global.defcontrollerbindinteract);
	global.controllerbindpause = ini_read_real("SAVE", "controllerpause", global.defcontrollerbindpause);
	ini_close();
}

function KReset(){
	DefaultKeybinds();
	global.keybindleft = global.defkeybindleft;
	global.keybindright = global.defkeybindright;
	global.keybindup = global.defkeybindup;
	global.keybinddown = global.defkeybinddown;
	global.keybindjump = global.defkeybindjump;
	global.keybinddash = global.defkeybinddash;
	global.keybindinteract = global.defkeybindinteract;
	global.keybindpause = global.defkeybindpause;
	
	global.controllerbindleft = global.defcontrollerbindleft;
	global.controllerbindright = global.defcontrollerbindright;
	global.controllerbindup = global.defcontrollerbindup;
	global.controllerbinddown = global.defcontrollerbinddown;
	global.controllerbindjump = global.defcontrollerbindjump;
	global.controllerbinddash = global.defcontrollerbinddash;
	global.controllerbindinteract = global.defcontrollerbindinteract;
	global.controllerbindpause = global.defcontrollerbindpause;
	
	PlaySound(sndToggle, global.pitchlowtoggle, global.pitchhightoggle);
}

function KBack(){
	StartTransition(rSettings, oCore.key, 0.25, oCore.bgcol);
}

function KeybindNumbering(storedkey){
	switch storedkey{
		case 0:
			return 0;
		break;
		case 27:
			return 1;
		break;
		case 112:
			return 2;
		break;
		case 113:
			return 3;
		break;
		case 114:
			return 4;
		break;
		case 115:
			return 5;
		break;
		case 116:
			return 6;
		break;
		case 117:
			return 7;
		break;
		case 118:
			return 8;
		break;
		case 119:
			return 9;
		break;
		case 120:
			return 10;
		break;
		case 121:
			return 11;
		break;
		case 122:
			return 12;
		break;
		case 123:
			return 13;
		break;
		case 192:
			return 14;
		break;
		case 49:
			return 15;
		break;
		case 50:
			return 16;
		break;
		case 51:
			return 17;
		break;
		case 52:
			return 18;
		break;
		case 53:
			return 19;
		break;
		case 54:
			return 20;
		break;
		case 55:
			return 21;
		break;
		case 56:
			return 22;
		break;
		case 57:
			return 23;
		break;
		case 48:
			return 24;
		break;
		case 189:
			return 25;
		break;
		case 187:
			return 26;
		break;
		case 81:
			return 27;
		break;
		case 87:
			return 28;
		break;
		case 69:
			return 29;
		break;
		case 82:
			return 30;
		break;
		case 84:
			return 31;
		break;
		case 89:
			return 32;
		break;
		case 85:
			return 33;
		break;
		case 73:
			return 34;
		break;
		case 79:
			return 35;
		break;
		case 80:
			return 36;
		break;
		case 219:
			return 37;
		break;
		case 221:
			return 38;
		break;
		case 65:
			return 39;
		break;
		case 83:
			return 40;
		break;
		case 68:
			return 41;
		break;
		case 70:
			return 42;
		break;
		case 71:
			return 43;
		break;
		case 72:
			return 44;
		break;
		case 74:
			return 45;
		break;
		case 75:
			return 46;
		break;
		case 76:
			return 47;
		break;
		case 186:
			return 48;
		break;
		case 222:
			return 49;
		break;
		case 90:
			return 50;
		break;
		case 88:
			return 51;
		break;
		case 67:
			return 52;
		break;
		case 86:
			return 53;
		break;
		case 66:
			return 54;
		break;
		case 78:
			return 55;
		break;
		case 77:
			return 56;
		break;
		case 188:
			return 57;
		break;
		case 190:
			return 58;
		break;
		case 191:
			return 59;
		break;
		case 8:
			return 60;
		break;
		case 9:
			return 61;
		break;
		case 220:
			return 62;
		break;
		case 20:
			return 63;
		break;
		case 13:
			return 64;
		break;
		case 16:
			return 65;
		break;
		case vk_control:
			return 67;
		break;
		case 91:
			return 68;
		break;
		case vk_alt:
			return 69;
		break;
		case 32:
			return 70;
		break;
		case 93:
			return 73;
		break;
		case vk_printscreen:
			return 75;
		break;
		case 145:
			return 76;
		break;
		case 19:
			return 77;
		break;
		case 45:
			return 78;
		break;
		case 36:
			return 79;
		break;
		case 33:
			return 80;
		break;
		case 46:
			return 81;
		break;
		case 35:
			return 82;
		break;
		case 34:
			return 83;
		break;
		case 38:
			return 84;
		break;
		case 37:
			return 85;
		break;
		case 40:
			return 86;
		break;
		case 39:
			return 87;
		break;
		case 144:
			return 88;
		break;
		case 111:
			return 89;
		break;
		case 106:
			return 90;
		break;
		case 109:
			return 91;
		break;
		case 103:
			return 92;
		break;
		case 104:
			return 93;
		break;
		case 105:
			return 94;
		break;
		case 100:
			return 95;
		break;
		case 101:
			return 96;
		break;
		case 102:
			return 97;
		break;
		case 97:
			return 98;
		break;
		case 98:
			return 99;
		break;
		case 99:
			return 100;
		break;
		case 96:
			return 101;
		break;
		case 110:
			return 102;
		break;
		case 107:
			return 103;
		break;
	}
}

function ControllerbindNumbering(storedbutton){
	switch storedbutton{
		case 0:
			return 0;
		break;
		case gp_face1:
			return 1;
		break;
		case gp_face2:
			return 2;
		break;
		case gp_face3:
			return 3;
		break;
		case gp_face4:
			return 4;
		break;
		case gp_shoulderl:
			return 5;
		break;
		case gp_shoulderlb:
			return 6;
		break;
		case gp_shoulderr:
			return 7;
		break;
		case gp_shoulderrb:
			return 8;
		break;
		case gp_select:
			return 9;
		break;
		case gp_start:
			return 10;
		break;
		case gp_padl:
			return 11;
		break;
		case gp_padr:
			return 12;
		break;
		case gp_padu:
			return 13;
		break;
		case gp_padd:
			return 14;
		break;
		case gp_stickl:
			return 15;
		break;
		case lhaxisl:
			return 16;
		break;
		case lhaxisr:
			return 17;
		break;
		case lvaxisu:
			return 18;
		break;
		case lvaxisd:
			return 19;
		break;
		case gp_stickr:
			return 20;
		break;
		case rhaxisl:
			return 21;
		break;
		case rhaxisr:
			return 22;
		break;
		case rvaxisu:
			return 23;
		break;
		case rvaxisd:
			return 24;
		break;
	}
}
		






















































