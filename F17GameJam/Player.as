package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import KeyObject;
	import Main;
	
	public class Player extends MovieClip
	{
		//OBJECTS
		public var stageRef:Stage;
		public var key:KeyObject;
		public var main:Main;
		
		//OTHER
		public var speed:Number = 5;
		public var atsDelay:int = 50;
		public var atsMax:int = 50;
		public var matDelay:int = 20;
		public var matMax:int = 20;
		public var mana:int = 15;
		public var health:int = 6;
		public var sacDelay:int = 10;
		public var sacMax:int = 10;
		
		//KEYINPUTS
		public var rightPressed:Boolean = false;
		public var leftPressed:Boolean = false;
		public var upPressed:Boolean = false;
		public var downPressed:Boolean = false;
		public var qPressed:Boolean = false;
		public var rightArrowPressed:Boolean = false;
		public var leftArrowPressed:Boolean = false;
		public var upArrowPressed:Boolean = false;
		public var downArrowPressed:Boolean = false;
		public var hPressed:Boolean = false;
		
		public function Player(main:Main, stageRef:Stage, X:int, Y:int):void
		{
			//constructor
			this.main = main;
			this.x = X;
			this.y = Y;
			this.stageRef = stageRef;
			
			addEventListener(Event.ENTER_FRAME, loop);
			
			key = new KeyObject(stageRef);
			
		}
		
		public function decrementHealth()
		{
			trace("You have been hurt")
			health--;
		}
		
		public function decrementMana(amount:int)
		{
			trace("that cost",amount,"mana")
			mana -= amount;
		}
		
		public function loop(e:Event):void
		{
			//trace("looping");
			checkKeyPresses();
			if(rightPressed)
			{
				//trace("rightPressed");
				x += speed
				scaleX = -1
			}
			if(leftPressed)
			{
				//trace("leftPressed")
				x -= speed
				scaleX = 1
			}
			if(upPressed)
			{
				//trace("upPressed")
				y -= speed
			}
			if(downPressed)
			{
				//trace("downPressed")
				y += speed
			}
			if(qPressed)
			{
				if(atsDelay == atsMax)
				{
					if(mana > 2)
					{
						main.plantAttackStation(stage, x, y);
						atsDelay = 0;
					}
					else
					{
						trace("not enough mana")
					}
				}
			}
			if(atsDelay != atsMax)
			{
				atsDelay++
			}
			if(leftArrowPressed)
			{
				//main.shootMain(stage, x, y,"left")
				if(matDelay == matMax)
				{
					if(mana > 0)
					{
						main.shootMain(stage, x, y,"left")
						matDelay = 0;
					}
					else
					{
						trace("not enough mana")
						matDelay = 0;
					}
				}
			}
			if(upArrowPressed)
			{
				if(matDelay == matMax)
				{
					if(mana > 0)
					{
						main.shootMain(stage, x, y,"up")
						matDelay = 0;
					}
					else
					{
						trace("not enough mana")
						matDelay = 0;
					}
				}
			}
			if(downArrowPressed)
			{
				if(matDelay == matMax)
				{
					if(mana > 0)
					{
						main.shootMain(stage, x, y,"down")
						matDelay = 0;
					}
					else
					{
						trace("not enough mana")
						matDelay = 0;
					}
				}
			}
			if(rightArrowPressed)
			{
				if(matDelay == matMax)
				{
					if(mana > 0)
					{
						main.shootMain(stage, x, y,"right")
						matDelay = 0;
					}
					else
					{
						trace("not enough mana")
						matDelay = 0;
					}
				}
			}
			if(matDelay != matMax)
			{
				matDelay++
			}
			if(hPressed)
			{
				if(sacDelay == sacMax)
				{
					main.sacrifice();
					sacDelay = 0;
				}
				
			}
			if(sacDelay != sacMax)
			{
				sacDelay++;
			}
			if(mana > 15)
			{
				mana = 15
			}
		}
		
		
		
		public function checkKeyPresses():void
		{
			if(key.isDown(65))
			{
				leftPressed = true;
			}
			else
			{
				leftPressed = false;
			}
			if(key.isDown(68))
			{
				rightPressed = true;
			}
			else
			{
				rightPressed = false;
			}
			if(key.isDown(87))
			{
				upPressed = true;
			}
			else
			{
				upPressed = false;
			}
			if(key.isDown(83))
			{
				downPressed = true;
			}
			else
			{
				downPressed = false;
			}
			if(key.isDown(81))
			{
				qPressed = true;
			}
			else
			{
				qPressed = false;
			}
			if(key.isDown(39))
			{
				rightArrowPressed = true;
			}
			else
			{
				rightArrowPressed = false;
			}
			if(key.isDown(37))
			{
				leftArrowPressed = true;
			}
			else
			{
				leftArrowPressed = false;
			}
			if(key.isDown(40))
			{
				downArrowPressed = true;
			}
			else
			{
				downArrowPressed = false;
			}
			if(key.isDown(38))
			{
				upArrowPressed = true;
			}
			else
			{
				upArrowPressed = false;
			}
			if(key.isDown(72))
			{
				hPressed = true;
			}
			else
			{
				hPressed = false;
			}
			
		}
	}
}