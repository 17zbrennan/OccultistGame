package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class MapBorder extends MovieClip
	{
		public var stageRef:Stage;
		
		public function MapBorder(stageRef:Stage, X:Number, Y:Number)
		{
			this.x = X
			this.y = Y
			this.stageRef = stageRef;
			scaleX = 1.175;
			scaleY = 1.206;
		}
	}
}