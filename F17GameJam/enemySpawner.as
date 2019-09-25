package
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	import flash.events.Event;
	
	public class enemySpawner
	{
		
		public var enemy:Enemy;
		public var enemyList:Array = [];
		stage.addEventListener(Event.ENTER_FRAME);
		
		
		public function addEnemies(X:int, Y:int)
		{
			
		}
		
		if(enemyList.length > 0)
		{
			for(var i:int = enemyList.length - 1; i >= 0; i--)
			{
				enemyList[i].loop;

			}
		}
	}
}