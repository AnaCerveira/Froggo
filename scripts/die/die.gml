// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function die(){
	if(state == "dead"){
		x = global.last_checkpoint_x;
		y = global.last_checkpoint_y;
		
		room_restart();
		//room_goto(Room1);
		state = undefined;
		
	}
	
}