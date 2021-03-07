event_inherited();

spdX = 0;

head = instance_create_depth(x+80, y-115, -1, oRoverHead); ///@is {oRoverHead}
head.owner = id;

bodyShakeX = 0;
bodyShakeY = 0;

gunWantX = x+190; ///@is {number}
gunWantY = y-10; ///@is {number}

gunX = gunWantX; ///@is {number}
gunY = gunWantY; ///@is {number}
gunSpdX = 0;
gunSpdY = 0;
gunRot = 0;
gunSpdRot = 0;

gunRealsiesX = gunWantX; ///@is {number}
gunRealsiesY = gunWantY; ///@is {number}

disableInput = false;
timer = 0;

hp = 100;
maxhp = 100;

arms = [
	new Arm(sCuriosityArm1, 85, 0,
		point_distance (85, 0, 117, -57),
		point_direction(85, 0, 117, -57)),
	new Arm(sCuriosityArm2, 117, -57,
		point_distance (117, -57, 190, -10),
		point_direction(117, -57, 190, -10)),
]; ///@is {Array<Arm>}



wheelRot = [random(360), random(360), random(360)]; ///@is {Array<number>}
