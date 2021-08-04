if(place_meeting(x, y, o_player)){
	global.collectibles += 1;
	instance_destroy(self);
}