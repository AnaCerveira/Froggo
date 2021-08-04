//Update input
input_right = keyboard_check(ord("D"));
input_left = keyboard_check(ord("A"));
input_up = keyboard_check(ord("W")); //Climb up
input_down = keyboard_check(ord("S")); //Climb down
input_jump = keyboard_check_pressed(vk_space); //pressionou e soltou
input_jump_held = keyboard_check(vk_space);
input_dash = keyboard_check_pressed(vk_control);


x_dir = input_right - input_left;
y_dir = input_down - input_up;
moveX = x_dir * w_spd;

if(input_right || input_left){
	global.last_x_dir = x_dir;
	sprite_index = s_player_run;
}
else{
	sprite_index = s_player;
}

dash_duration = max(dash_duration - 1, 0); //Reduz o cooldown do dash até zero


if(!can_move){ exit;}

//States
if(!place_meeting(x, y + moveY, o_misc) && state != "on swing"){ //On air
	
	//Gravity
	gravity_spd = gvt;	
	moveY += gravity_spd;
	state = "on air";
}

if(place_meeting(x, y - moveY, o_swing) and y_dir == -1){ //On swing
	state = "on swing";
}

if(place_meeting(x, y + moveY, o_misc)){ //Grounded
	moveY = 0;
	state = "grounded";
	jump_ready = true;
}

if(place_meeting(x, y + moveY, o_spikes)){
	state = "dead";
	die();
}


//If player is on swing	
if (state == "on swing"){
	jump_ready = true;
	gravity_spd = 0;
	moveY = 0;
	moveX = 0;
	x = o_swing.x+8;
		
	if(y_dir != 0){
		moveY = 0;
		moveY += 2*sign(y_dir);
	}
		
	if(!place_meeting(x, y-1, o_swing)){
		state = "on air";
	}
}
	
	
//Dash
if(input_dash && dash_ready){
	if(state == "on swing"){
		state = "on air";
	}
	moveX = dash_spd*global.last_x_dir;
	dash_duration = 15;
	dash_ready = false;
}
	
if (dash_duration > 0){
	sprite_index = s_player_dash;
}
	
if(dash_duration <= 0){
	dash_ready = true;	
}


if (o_player.dash_duration > 0){
	/*if (dash_sound){
		audio_play_sound(sound_dash, 10, false);	
	}
	dash_sound = false;*/
	dash_particles(o_player.x, o_player.y);	
}
else{
	//dash_sound = true;	
}

		
//Collision checks
//Horizontal
if(place_meeting(x+moveX, y, o_misc)){
	while(!place_meeting(x+sign(moveX), y, o_misc)){
			x += sign(moveX);
	}
		
	moveX = 0;	
}

if (abs(moveX)) image_xscale = sign(moveX);
	
x += moveX;
	
	
//Jump
if(input_jump && jump_ready){
	if(state == "on swing"){
		state = "on air";
	}
	moveY = jump_spd;
	jump_ready = false;
}
		
//Variable jump height
if(moveY < 0) && (!input_jump_held){
	moveY = max(moveY, jump_spd/5);	
}
	
//Vertical
if(place_meeting(x, y+(moveY), o_misc)){
	while(!place_meeting(x, y+sign((moveY)), o_misc)){
		y += sign((moveY));
	}
		
moveY = 0;
}
	
//Apply movement
y += moveY;
	