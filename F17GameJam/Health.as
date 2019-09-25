package
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Health extends MovieClip
	{
		public var stageRef:Stage;
		public var i:int = 1;
		
		public function Health(stageRef:Stage,X:int, Y:int):void
		{
			//constructor code
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef; 
		}
		
		public function decrementHealth():void
		{
			i++
			trace("this worked")
			MovieClip(this).gotoAndStop(i);
		}

	}
}