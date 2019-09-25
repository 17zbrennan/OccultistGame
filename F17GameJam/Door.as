package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Door extends MovieClip
	{
		public var stageRef:Stage;
		
		public function Door(stageRef:Stage, X:int, Y:int, doorNumber:int)
		{
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef;
		}
		
		public function unlock()
		{
			MovieClip(this).gotoAndStop(2);
		}
		
		
	}
}