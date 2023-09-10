// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlaySound(sound, pitchlow, pitchhigh){
	var pitch = random_range(pitchlow, pitchhigh);
	
	audio_sound_pitch(sound, pitch);
	audio_sound_gain(sound, oCore.sfxvolume, 0);
	audio_play_sound(sound, 1, 0);
}
function PlayMusic(track){
	audio_stop_all();
	audio_sound_gain(track, oCore.musicvolume, 0);
	audio_play_sound(track, 1, 0);
}