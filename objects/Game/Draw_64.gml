/// @description Insert description here
// You can write your code in this editor
with(o_player){
	var xx = "vel X = " + string(moveX);
	var yy = "vel Y = " + string(moveY);
	var grav = "gravity = " + string(gvt);
	var collec = "score = " + string(global.collectibles);

	draw_text(20, 20, xx);
	draw_text(20, 40, yy);
	//draw_text(20, 60, grav);
	draw_text(20, 60, sprite_get_name(sprite_index));
	draw_text(20, 80, state);
	draw_text(20, 100, fps_real);
	draw_text(20, 120, collec)
	//draw_text(20, 100, o_player.image_xscale);

}