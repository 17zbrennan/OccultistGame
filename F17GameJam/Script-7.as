package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Door extends MovieClip
	{
		public var stageRef:stage;
		
		public function Door(stageRef:Stage, X:int, Y:int, doorNumber:int)
		{
			this.x = X
			this.y = Y
			this.stageRef = stageRef;
		}
	}
}