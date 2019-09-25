package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class VisualMap extends MovieClip
	{
		public var stageRef:Stage;
		
		public function VisualMap(stageRef:Stage, X:int, Y:int)
		{
			this.stageRef = stageRef;
			this.x = X;
			this.y = Y;
		}
	}
}