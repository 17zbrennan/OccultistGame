package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Enemy extends MovieClip
	{
		public var stageRef:Stage;
		public var range:int;
		public var initialX:int;
		public var right:Boolean = true;
		
		public function Enemy(stageRef:Stage, X:int, Y:int,range:int):void
		{
			//constructor
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef;
			this.range = range;
			this.initialX = X;
			
			//stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop():void
		{
			if(right)
			{
				scaleX = 1
				x++
			}
			else
			{
				scaleX = -1
				x--
			}
			if(x > (initialX + range))
			{
				right = false;
			}
			else if(x < (initialX - range))
			{
				right = true;
			}
			//trace("i am looping")
		}
		
		public function removeSelf():void
        {
            trace("remove self");
            removeEventListener(Event.ENTER_FRAME, loop); //stop the loop
            this.parent.removeChild(this); //tell this object's "parent object" to remove this object
        }
	}
}