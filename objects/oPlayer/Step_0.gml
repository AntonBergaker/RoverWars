timer += 1/60;

x += spdX;

for (var i=0;i<3;i++) {
	wheelRot[i] -= spdX;
	bodyShakeX = abs(spdX)/5;
	bodyShakeY = abs(spdX)/5;
}

bodyShakeX += (1- hp/maxhp)*2;

for (var i = 0; i < 2; i++) {
	arms[i].update();
}

var _deltaMovement/*:number*/ = keyboard_check(vk_right) - keyboard_check(vk_left);
if (disableInput == true) {
	_deltaMovement = 0;
}

spdX += _deltaMovement;
spdX *= 0.9;
spdX = value_shift(spdX, 0, 0.001);


if (keyboard_check_pressed(vk_space) && !disableInput) {
	gunSpdY-=10;
	gunSpdX-=20;
	gunSpdRot += 30;
	
	var _snd = audio_play_sound(sndGun, 0, false);
	audio_sound_pitch(_snd, random_range(0.95, 1.05));
	
	var _inst = instance_create_depth(gunRealsiesX+lengthdir_x(50, 20), gunRealsiesY+lengthdir_y(50, 20), 0, oBullet);
	_inst.spdX += lengthdir_x(50, gunRot);
	_inst.spdY += lengthdir_y(50, gunRot);
	_inst.sender = id;
	_inst.image_angle = gunRot;
	
	var _flash = instance_create_depth(_inst.x, _inst.y, -1, oGunFlash);
	_flash.image_angle = gunRot;
	
}

head.spdX *= 0.9;
head.spdY *= 0.9;

head.spdX += ((x+80)  - head.x) * 0.075;
head.spdY += ((y-115) - head.y) * 0.075;

head.y += sin(timer)*5;
head.x += head.spdX;
head.y += head.spdY;

gunWantX = x+190;
gunWantY = y-10;

gunSpdX *= 0.9;
gunSpdY *= 0.9;
gunSpdRot *= 0.9;

gunSpdX += (gunWantX - gunX) * 0.075;
gunSpdY += (gunWantY - gunY) * 0.075;
gunSpdRot += (0 - gunRot) * 0.075;

gunX += gunSpdX;
gunY += gunSpdY;
gunRot += gunSpdRot;

//gunX = mouse_x;
//gunY = mouse_y;

var _lX = x+85;
var _lY = y;
for (var i=0;i<2;i++) {
	var arm/*:Arm*/ = arms[i];
	arm.x = _lX;
	arm.y = _lY;
	_lX += lengthdir_x(arm.length, arm.rotation);
	_lY += lengthdir_y(arm.length, arm.rotation);
	
	if (i == 1) {
		gunRealsiesX = _lX;
		gunRealsiesY = _lY;
	}
}

var _dir = point_direction(arms[0].x, arms[0].y, gunX, gunY);

var _totalLen = arms[0].length + arms[1].length;

arms[0].targetRotation = angle_lerp(_dir+180, angle_lerp( _dir, arms[0].targetRotation, 0.5), clamp(point_distance(arms[0].x, arms[0].y, gunX, gunY) / _totalLen, 0, 1));
arms[1].targetRotation = point_direction(arms[1].x, arms[1].y, gunX, gunY);


