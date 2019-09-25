package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import Main;
	
	public class AttackStation extends MovieClip
	{
		
		public var stageRef:Stage;
		public var main:Main;
		public var radiansToDegrees:Number = 180/Math.PI;
		public var range:Number = 50;
		public var damage:Number;
		public var xDistance:Number;
		public var yDistance:Number;
		public var angle:Number;
		public var i:int = 0;
		public var orbList:Array = [];
		public var attackMax:int = 100;
		public var attackTimer:int = 100;

		
		public function AttackStation(main:Main, stageRef:Stage, X:int, Y:int)
		{
			//constructor code
			this.main = main;
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef;
			
			
		}
		
		public function loop():void
		{
			//for(var i:int = 0; i < enemyList.length; i
			if(main.enemyList.length != 0)
			{
				xDistance = main.enemyList[i].x - x;
				yDistance = main.enemyList[i].y - y;
			}
			angle = Math.atan2(yDistance, xDistance) * radiansToDegrees;
			//trace(xDistance,yDistance,angle);
			if(attackTimer == attackMax)
			{
				trace("it equals")
				main.shootOrb(stage,x,y,angle);
				attackTimer = 0
			}else
			{
				attackTimer++
			}
		}
	}
}