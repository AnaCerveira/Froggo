/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, o_player)){
	o_player.state = "checkpoint";
	global.last_checkpoint_x = x;
	global.last_checkpoint_y = y;
}