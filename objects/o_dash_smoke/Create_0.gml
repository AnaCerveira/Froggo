/// @description Init particles
// You can write your code in this editor
system_dash = part_system_create();

// Create particle
smoke_particle_dash = create_part_type_sprite(s_smoke, true, 5, 5, 0.1, 0.5, -0.01);

randomize();
speed = random_range(1, 2);
friction = 0.25;
direction = random(360);