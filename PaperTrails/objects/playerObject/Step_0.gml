//Keyboard Player Input
leftKey = keyboard_check(vk_left);
rightKey = keyboard_check(vk_right);
jumpKey = keyboard_check(vk_space);

//Movement
var move = rightKey - leftKey;

hsp = move * walkSpeed;

vsp = vsp + grv;

if (place_meeting(x,y+1,wallSprite)) && (jumpKey){
	vsp = -7;
}

//X Collision

if(place_meeting(x+hsp,y,wallObject)){
	while(!place_meeting(x+sign(hsp),y,wallObject)){
		x = x+sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//Collision

if(place_meeting(x,y+vsp,wallObject)){
	while(!place_meeting(x,y+sign(vsp),wallObject)){
		y = y+sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;