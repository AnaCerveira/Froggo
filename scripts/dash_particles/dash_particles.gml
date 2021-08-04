// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dash_particles(x, y){
	randomize();
	repeat (1){
		instance_create_layer(x-random(8), y, "Instances", o_dash_smoke);
	}
	part_particles_create(o_dash_smoke.system_dash, x, y, o_dash_smoke.smoke_particle_dash, 1);
	
}