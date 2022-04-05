//get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var _move = key_right - key_left;

if(!place_meeting(x,y+vsp,oWall)){
	canjump -= 1;
}

if(canjump > 0) && (key_jump){
	vsp = -jumpsp;
}

hsp = _move * walksp;

vsp += grv;

//horizontal collision
if(place_meeting(x+hsp,y,oWall)){
	while(!place_meeting(x+sign(hsp),y,oWall)){
		x += sign(hsp);
	}
	if(place_meeting(x,y,oWall)){
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

//vertical collision
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall)){
		y += sign(vsp);
	}
	if(place_meeting(x,y,oWall)){
		y += sign(vsp);
	}
	vsp = 0;
	canjump = 10;
}
y += vsp;

//animation
if(!place_meeting(x,y+1,oWall)){
	sprite_index = sPlayerA;
	image_speed = 0;
	if(vsp > 0) image_index = 1;
	else image_index = 0;	
} else {
	image_speed = 1;
	if(hsp == 0){
		sprite_index = sPlayer;
	} else {
		sprite_index = sPlayerR;
	}
}

if(hsp != 0) image_xscale = sign(hsp);

if(keyboard_check_pressed(ord("R"))){
	game_restart();
}