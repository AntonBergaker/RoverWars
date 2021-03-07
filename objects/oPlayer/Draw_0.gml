var _headX = head.x;
var _headY = head.y;

var _hp = hp/maxhp;


for (var i=0;i<2;i++) {
	var arm/*:Arm*/ = arms[i];
	draw_sprite_ext(arm.sprite, 0, arm.x, arm.y, 1, 1, arm.rotation - arm.defaultRotation, c_white, 1);
}


var _armX = x+45;
var _armY = y-20;
var _dir = point_direction(_armX, _armY, _headX-30, _headY) - 93;
var _dist = point_distance(_armX, _armY, _headX-30, _headY) / 86;

// Head arm
draw_sprite_ext(sCuriosityArm, 0, _armX, _armY, 1, _dist, _dir, c_white, 1);

var _bodyX = x + random_range(-bodyShakeX, bodyShakeX);
var _bodyY = y + random_range(-bodyShakeY, bodyShakeY);

draw_sprite(sCuriosityBody, _hp > 0.45 ? 0 : 1, _bodyX, _bodyY); 

var _frameX = _bodyX+random_range(-bodyShakeX, bodyShakeX);
var _frameY = _bodyY+random_range(-bodyShakeY, bodyShakeY) + 40;

draw_sprite(sCuriosityFrame, _hp > 0.7 ? 0 : 1, _frameX, _frameY);


draw_sprite_ext(sCuriosityWheel, _hp > 0.5 ? 0 : 1, _frameX+90+random_range(-bodyShakeX, bodyShakeX), _frameY-5+random_range(-bodyShakeY, bodyShakeY), 1, 1, wheelRot[0], c_white, 1);

draw_sprite_ext(sCuriosityWheel, _hp > 0.6 ? 0 : 1, _frameX+random_range(-bodyShakeX, bodyShakeX),_frameY-1+random_range(-bodyShakeY, bodyShakeY), 1, 1, wheelRot[1], c_white, 1);

draw_sprite_ext(sCuriosityWheel, _hp > 0.4 ? 0 : 1, _frameX-94+random_range(-bodyShakeX, bodyShakeX), _frameY + 1+random_range(-bodyShakeY, bodyShakeY), 1, 1, wheelRot[2], c_white, 1);

draw_sprite(sCuriosityHead, _hp > 0.35 ? 0 : 1, _headX, _headY);
draw_sprite(sCuriosityFaces, 1, _headX, _headY);

draw_sprite_ext(sCuriosityGun, 0, gunRealsiesX, gunRealsiesY, 1, 1, gunRot, c_white, 1);