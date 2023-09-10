surface_resize(application_surface, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
PaletteInit();
DefaultSettings();
LoadKeybinds();
pausex = 0;
pausey = 0;
pauseroom = room;

ini_open( "save.ini" );

area = ini_read_real("SAVE", "area", 0);

global.palette = ini_read_real("SAVE", "palette", defpalette);
global.pplayer = ds_map_find_value(palettes[global.palette],"Player");
global.phazards = ds_map_find_value(palettes[global.palette],"Hazards");
global.pforeground = ds_map_find_value(palettes[global.palette],"Foreground");
global.ptiles = ds_map_find_value(palettes[global.palette],"Tiles");
global.pbackgroundother = ds_map_find_value(palettes[global.palette],"BackgroundOther");
global.pbackground = ds_map_find_value(palettes[global.palette],"Background");

//fix after playtesting
palette0 = ini_read_real("SAVE", "palette0", true);
palette1 = ini_read_real("SAVE", "palette1", true);
palette2 = ini_read_real("SAVE", "palette2", true);
palette3 = ini_read_real("SAVE", "palette3", true);
palette4 = ini_read_real("SAVE", "palette4", true);
palette5 = ini_read_real("SAVE", "palette5", true);
palette6 = ini_read_real("SAVE", "palette6", true);
palette7 = ini_read_real("SAVE", "palette7", true);

saveroom = ini_read_real("SAVE", "room", lvl_1);
savekey = ini_read_string("SAVE", "key", "Top");

level1 = ini_read_real("SAVE", "level1", false);
level2 = ini_read_real("SAVE", "level2", false);
level3 = ini_read_real("SAVE", "level3", false);

backwards = ini_read_real("SAVE", "backwards", false);

fullscreen = ini_read_real("SAVE", "fullscreen", deffullscreen);
window_set_fullscreen(fullscreen);

//trackers
speedrun = false;
deaths = 0;
timing = false;
time = 0;
hours = 0;
minutes = 0;
seconds = 0;

devrecord = 0.01; //00:00:46.28

//Sounds
mastervolume = ini_read_real("SAVE", "mastervolume", defmaster);
musicvolume = ini_read_real("SAVE", "musicvolume",defmusic);
sfxvolume = ini_read_real("SAVE", "sfxvolume", defsfx);

mastervolumesaved = ini_read_real("SAVE", "mastervolumesaved", defmaster);
musicvolumesaved = ini_read_real("SAVE", "musicvolumesaved", defmusic);
sfxvolumesaved = ini_read_real("SAVE", "sfxvolumesaved", defsfx);

audiotrack = sndMenu;

global.pitchhighland = 1.1;
global.pitchlowland = 0.9;

global.pitchhighslide = 1;
global.pitchlowslide = 1;

global.pitchhighjump = 1.1;
global.pitchlowjump = 0.9;

global.pitchhighdeath = 1.1;
global.pitchlowdeath = 0.9;

global.pitchhighland = 1.1;
global.pitchlowland = 0.9;

global.pitchhightransition = 1.1;
global.pitchlowtransition = 0.9;

global.pitchhighinvalid = 1;
global.pitchlowinvalid = 0.9;

global.pitchhighmenu = 1.1;
global.pitchlowmenu = 0.9;

global.pitchhightoggle = 1.1;
global.pitchlowtoggle = 0.9;

global.pitchhighfootstep = 1.1;
global.pitchlowfootstep = 0.9;

global.pitchlowspring = 1.1;
global.pitchhighspring = 0.9;

//Scene Transition
transcol = $1D181E;
transtimer = 0;
transtime = 0.5;
transtimeperc = transtimer/transtime;
transitioning = false;
transitionroom = oSplashScreen;
key = 0;
transitioned = false;

MakeParticleSystem();

ini_close();