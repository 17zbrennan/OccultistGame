package
{

	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import enemySpawner;
	import Player;
	import flash.geom.Point;
	
	
	public class Main  extends MovieClip
	{
		//objects
		public var player:Player;
		public var playerHealth:Health;
		public var playerMana:Mana;
		public var visualMap:VisualMap;
		public var mapBorder:MapBorder;
		public var door:Door;
		
		//Arrays
		public var doorList:Array = [];
		public var enemyList:Array = [];
		public var attackStationList:Array = [];
		public var mainAttackList:Array = [];
		public var attackOrbList:Array = [];
		
		//timers
		public var pColDelay:int = 25;
		public var pColMax:int = 25;
		
		
		//points
		public var topCol:Point = new Point(0,-49.925)
		public var botCol:Point = new Point(0, 49.925)
		public var rightCol:Point = new Point(50.4, 0)
		public var leftCol:Point = new Point(-50.4, 0)

		
		
		
		public function Main():void
		{
			//constructor
			player = new Player(this, stage, 640, 360);
			playerHealth = new Health(stage, 62,654);
			playerMana = new Mana(stage, 1200, 635);
			visualMap = new VisualMap(stage,0,0)
			mapBorder = new MapBorder(stage,94.55,53.25)
			stage.addChild(mapBorder);
			stage.addChild(visualMap);
			addDoor(stage,639.25,46.55,1);
			addEnemy(stage, 200, 200, 90);
			addEnemy(stage, 700, 500, 90);
			stage.addChild(player);
			stage.addChild(playerHealth);
			stage.addChild(playerMana);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void
		{
			
			if(enemyList.length > 0)
			{
				for(var i:int = enemyList.length-1; i >= 0; i--)
				{
					enemyList[i].loop();
					if(enemyList[i].hitTestObject(player))
					{
						if(pColDelay == pColMax)
						{
							player.decrementHealth();
							playerHealth.decrementHealth();
							pColDelay = 0;
						}
					}
					if(mainAttackList.length > 0)
					{
						for(var v:int = mainAttackList.length-1; v >= 0; v--)
						{
							if(enemyList[i].hitTestObject(mainAttackList[v]))
							{
								enemyList[i].removeSelf()
								mainAttackList[v].removeSelf()
							}
						}
					}
					if(attackOrbList.length > 0)
					{
						for(var b:int = attackOrbList.length-1; b >= 0; b--)
						{
							if(enemyList[i].hitTestObject(attackOrbList[b]))
							{
								enemyList[i].removeSelf()
								attackOrbList[b].removeSelf()
							}
						}
					}
				}
			}
			
			if(enemyList.length == 0)
			{
				if(doorList.length > 0)
				{
					for(var n:int = doorList.length-1; n >= 0; n--)
					{
						doorList[n].unlock();
						trace("The way is open")
					}
				}
			}
			
			if(mapBorder.hitTestPoint(player.x + rightCol.x, player.y + rightCol.y) == false)
			{
				player.x -= player.speed
			}
			if(mapBorder.hitTestPoint(player.x + leftCol.x, player.y + leftCol.y) == false)
			{
				player.x += player.speed
			}
			if(mapBorder.hitTestPoint(player.x + topCol.x, player.y + topCol.y) == false)
			{
				player.y += player.speed
			}
			if(mapBorder.hitTestPoint(player.x + botCol.x, player.y + botCol.y) == false)
			{
				player.y -= player.speed
			}
			
			if(attackStationList.length > 0)
			{
				for(var j:int = attackStationList.length-1; j >= 0; j--)
				{
					attackStationList[j].loop();
				}
			}
			
			if(mainAttackList.length > 0)
			{
				for(var k:int = mainAttackList.length-1; k >= 0; k--)
				{
					mainAttackList[k].loop();
				}
			}
			if(attackOrbList.length > 0)
			{
				for(var h:int = attackOrbList.length-1; h >= 0; h--)
				{
					attackOrbList[h].loop();
				}
			}
			
			
			if(doorList.length > 0)
			{
				for(var n:int = doorList.length-1; n >= 0; n--)
				{
					if(doorList[n].hitTestObject(player))
					{
						trace("door locked")
					}
				}
			}
			
			if(pColDelay != pColMax)
			{
				pColDelay++;
			}
		}
		
		
		public function addEnemy(stageRef:Stage, X:int, Y:int, range:int):void
		{
			var enemy:Enemy = new Enemy(stageRef,X,Y,range);
			var enemyHolder:Sprite = new Sprite();
			enemy.addEventListener(Event.REMOVED_FROM_STAGE, enemyRemoved);
			enemyList.push(enemy);
			stage.addChild(enemy);
			stage.addChild(enemyHolder);
		}
		
		public function enemyRemoved(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, enemyRemoved);
			enemyList.splice(enemyList.indexOf(e.currentTarget),1);//removes the app. bullet from array
		}
		
		public function plantAttackStation(stageRef:Stage, X:int, Y:int):void
		{
			var attackStation:AttackStation = new AttackStation(this,stageRef,X,Y);
			attackStation.addEventListener(Event.REMOVED_FROM_STAGE, attackStationRemoved);
			attackStationList.push(attackStation);
			stage.addChild(attackStation);
			player.decrementMana(3);
			playerMana.decrementMana(3);
		}
		
		public function attackStationRemoved(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, attackStationRemoved);
			attackStationList.splice(attackStationList.indexOf(e.currentTarget),1);//removes the app. bullet from array
		}
		
		public function shootMain(stageRef:Stage, X:int, Y:int, Direction:String):void
		{
			var mainAttack:MainAttack = new MainAttack(stageRef,X,Y,Direction)
			mainAttack.addEventListener(Event.REMOVED_FROM_STAGE, mainAttackRemoved)
			mainAttackList.push(mainAttack);
			stage.addChild(mainAttack);
			player.decrementMana(1);
			playerMana.decrementMana(1);
		}
		
		public function mainAttackRemoved(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, mainAttackRemoved);
			mainAttackList.splice(mainAttackList.indexOf(e.currentTarget),1);//removes the app. bullet from array
		}
		
		public function shootOrb(stageRef:Stage, X:int, Y:int, angle:int):void
		{
			var attackOrb:AttackOrb = new AttackOrb(stageRef, X, Y, angle)
			attackOrb.addEventListener(Event.REMOVED_FROM_STAGE, attackOrbRemoved);
			attackOrbList.push(attackOrb);
			stage.addChild(attackOrb);
			trace("shooting")
		}
		
		public function attackOrbRemoved(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, attackOrbRemoved);
			attackOrbList.splice(attackOrbList.indexOf(e.currentTarget),1);//removes the app. bullet from array
		}
		
		public function sacrifice()
		{
			playerHealth.decrementHealth();
			playerMana.decrementMana(-1);
			player.decrementHealth();
			player.decrementMana(-1);
		}
		
		
		
		public function addDoor(stageRef:Stage,X:int,Y:int,doorNumber:int)
		{
			var door:Door = new Door(stageRef,X,Y,doorNumber);
			door.addEventListener(Event.REMOVED_FROM_STAGE, doorRemoved);
			doorList.push(door);
			stage.addChild(door);
		}
		
		public function doorRemoved(e:Event):void
		{
			e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, doorRemoved);
			doorList.splice(doorList.indexOf(e.currentTarget),1);//removes the app. bullet from array
		}
		
	}
}