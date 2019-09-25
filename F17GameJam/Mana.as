package
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Mana extends MovieClip
	{
		public var stageRef:Stage;
		public var mana:int = 15;
		public var manaString:String;
		public function Mana(stageRef:Stage, X:int, Y:int):void
		{
			//constructor code
			scaleX = .5
			scaleY = .5
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void
		{
			if(mana > 15)
			{
				mana = 15
			}
			if(mana < 1)
			{
				MovieClip(this).gotoAndStop(4);
			}
			else if(mana < 5)
			{
				MovieClip(this).gotoAndStop(3);
			}
			else if(mana < 10)
			{
				MovieClip(this).gotoAndStop(2);
			}
			else
			{
				MovieClip(this).gotoAndStop(1);
			}
				
			MovieClip(this).manaText.text = mana
		}
		
		public function decrementMana(amount:int):void
		{
			mana -= amount
			trace("this worked")
			
		}
	}
}