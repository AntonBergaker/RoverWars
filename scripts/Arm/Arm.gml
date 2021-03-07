function Arm(sprite/*:sprite*/, x/*:number*/, y/*:number*/, length/*:number*/, targetRotation/*:number*/) constructor {
	
	static update = function() {
		
		rotationSpeed *= 0.8;

		rotationSpeed += angle_difference(self.targetRotation, self.rotation) * 0.1;
		
		rotation += rotationSpeed;
	}
	
	self.x = x;
	self.y = y;
	self.sprite = sprite; ///@is {sprite}
	self.length = length; ///@is {number}
	self.targetRotation = targetRotation; ///@is {number}
	self.defaultRotation = targetRotation; ///@is {number}
	self.rotation = targetRotation; ///@is {number}
	self.rotationSpeed = 0;
}
