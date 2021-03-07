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

var _deltaMovement/*:number*/ = clamp((oPlayer.x - x + 1000)/200, -1, 1);
if (disableInput == true) {
	_deltaMovement = 0;
}
spdX += _deltaMovement;
spdX *= 0.9;
spdX = value_shift(spdX, 0, 0.001);

var _fire = false;

if (abs(angle_difference( point_direction(x, y, oPlayer.x, oPlayer.y), gunRot+180 )) < 10) {
	_fire = true;
}
if (irandom(20) == 0) {
	_fire = true;
}
if (irandom(5) != 0) {
	_fire = false;
}
gunCooldown--;
if (gunCooldown > 0) {
	_fire = false;
}
if (disableInput == true) {
	_fire = false;
}

if (_fire) {
	gunSpdY-=10;
	gunSpdX+=20;
	gunSpdRot -= 50;
	gunCooldown = 15;
	
	var _snd = audio_play_sound(sndGun, 0, false);
	audio_sound_pitch(_snd, random_range(0.95, 1.05));
	
	var _inst = instance_create_depth(gunRealsiesX+lengthdir_x(50, 160), gunRealsiesY+lengthdir_y(50, 160), 0, oBullet);
	_inst.spdX += lengthdir_x(50, gunRot+180);
	_inst.spdY += lengthdir_y(50, gunRot+180);
	_inst.image_angle = gunRot+180;
	_inst.sender = id;
	
	var _flash = instance_create_depth(_inst.x, _inst.y, -1, oGunFlash);
	_flash.image_angle = gunRot+180;
	
}

head.spdX *= 0.9;
head.spdY *= 0.9;

head.spdX += ((x-80)  - head.x) * 0.075;
head.spdY += ((y-115) - head.y) * 0.075;

head.y += sin(timer)*5;
head.x += head.spdX;
head.y += head.spdY;

gunWantX = x-190;
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

var _lX = x-85;
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

arms[0].targetRotation = angle_lerp(_dir+180, _dir, clamp(point_distance(arms[0].x, arms[0].y, gunX, gunY) / _totalLen, 0, 1));
arms[1].targetRotation = point_direction(arms[1].x, arms[1].y, gunX, gunY);


