if(!is_falling && place_meeting(x, y - 1, o_player)){
	show_debug_message("step")
	fall_duration = 20;
	is_falling = true;
}

if(fall_duration > 0){
	fall_duration = max(fall_duration - 1, 0); //Reduz o cooldown
}

if(fall_duration == 0){
	show_debug_message("fell")
	fell = true;
	fall_duration = -1;
}

if(fell){
	show_debug_message("destroy")
	instance_destroy(self);
}

//show_debug_message(is_falling);
//show_debug_message(fell);
