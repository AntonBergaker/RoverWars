
x+=spdX;
y+=spdY;

var _headInst = instance_place(x, y, oRoverHead);
if (_headInst != noone && _headInst.owner != sender) {
	_headInst.owner.hp -= 7.5;
	_headInst.spdX += spdX;
	_headInst.spdY += spdY;
	audio_play_sound(sndHeadshot, 0, false);
	instance_destroy();
	exit;
}

var _inst = instance_place(x, y, oRoverParent);
if (_inst != noone && _inst != sender) {
	_inst.hp -= 3;
	var _aud = audio_play_sound(sndHit, 0, false);
	audio_sound_pitch(_aud, 2);
	instance_destroy();
	exit;
}
