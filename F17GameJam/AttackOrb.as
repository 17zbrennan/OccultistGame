package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import Main;

	public class AttackOrb extends MovieClip
	{
		
		public var stageRef:Stage;
		public var main:Main;
		public var xVel:Number;
		public var yVel:Number;
		public var speed:Number = 5;
		public var rotationInRadians:Number;
		
		public function AttackOrb(stageRef:Stage, X:int, Y:int,  rotationInDegrees:Number)
		{
			//constructor code
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef;
			this.rotation = rotationInDegrees;
            this.rotationInRadians = rotationInDegrees * Math.PI / 180; //convert degrees to radians, for trigonometry
		}
		
		public function loop():void
		{
			xVel = Math.cos(rotationInRadians) * speed; //uses the cosine to get the xVel from the speed and rotation
			yVel = Math.sin(rotationInRadians) * speed; //uses the sine to get the yVel
		 
			x += xVel; //updates the position
			y += yVel;
			
		}
		
		public function removeSelf():void
        {
            trace("remove self");
            removeEventListener(Event.ENTER_FRAME, loop); //stop the loop
            this.parent.removeChild(this); //tell this object's "parent object" to remove this object
        }
	}
}