package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import Main;
	
	public class MainAttack extends MovieClip
	{
		public var stageRef:Stage;
		public var Direction:String;
		public var speed:Number = 8;
		
		public function MainAttack(stageRef:Stage, X:int, Y:int, Direction:String)
		{
			scaleX = .2
			scaleY = .2
			this.x = X
			this.y = Y
			this.stageRef = stageRef;
			this.Direction = Direction;
		}
		
		public function loop():void
		{
			if(Direction == "left")
			{
				x-=speed;
				rotation = 180
			}
			if(Direction == "right")
			{
				x+=speed;
			}
			if(Direction == "up")
			{
				y-=speed;
				rotation = 270
			}
			if(Direction == "down")
			{
				y+=speed;
				rotation = 90
			}
		}
		
		public function removeSelf():void
        {
            trace("remove self");
            removeEventListener(Event.ENTER_FRAME, loop); //stop the loop
            this.parent.removeChild(this); //tell this object's "parent object" to remove this object
        }
	}
}