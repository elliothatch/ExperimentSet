package  
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.geom.Point;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FX.FloodFillFX;
	public class ExperimentOne extends FlxState
	{
		public var lights:FlxGroup;
		public var collisionSounds:Vector.<Class>;
		
		private const minDistance:Number = 5;
		
		[Embed(source = "../sounds/pling1.mp3")] private var pling1Sound:Class;
		[Embed(source = "../sounds/pling2.mp3")] private var pling2Sound:Class;
		[Embed(source = "../sounds/pling3.mp3")] private var pling3Sound:Class;
		[Embed(source = "../sounds/pling4.mp3")] private var pling4Sound:Class;
		[Embed(source = "../sounds/pling5.mp3")] private var pling5Sound:Class;
		[Embed(source = "../sounds/pling6.mp3")] private var pling6Sound:Class;
		[Embed(source = "../sounds/pling7.mp3")] private var pling7Sound:Class;
		[Embed(source = "../sounds/pling8.mp3")] private var pling8Sound:Class;
		[Embed(source = "../sounds/pling9.mp3")] private var pling9Sound:Class;
		[Embed(source = "../sounds/pling10.mp3")] private var pling10Sound:Class;
		[Embed(source = "../sounds/pling11.mp3")] private var pling11Sound:Class;
		[Embed(source = "../sounds/pling12.mp3")] private var pling12Sound:Class;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			
			lights = new FlxGroup();
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					var obj:SpriteOne = new SpriteOne(i * 30, j * 30, 0.5);
					obj.makeGraphic(3,3, 0xffffffff);
					obj.maxVelocity = new FlxPoint(100,100);
					obj.drag = new FlxPoint(0, 0);
					obj.velocity.x = (Math.random() - .5) * 50;
					obj.velocity.y = (Math.random() - .5) * 50;
					lights.add(obj);
				}
			}
			
			add(lights);
			
			collisionSounds = new Vector.<Class>();
			collisionSounds.push(pling1Sound);
			collisionSounds.push(pling2Sound);
			collisionSounds.push(pling3Sound);
			collisionSounds.push(pling4Sound);
			collisionSounds.push(pling5Sound);
			collisionSounds.push(pling6Sound);
			collisionSounds.push(pling7Sound);
			collisionSounds.push(pling8Sound);
			collisionSounds.push(pling9Sound);
			collisionSounds.push(pling10Sound);
			collisionSounds.push(pling11Sound);
			collisionSounds.push(pling12Sound);
		}
		
		override public function update():void
		{
			for (var i:int = 0; i < lights.length; i++)
			{
					var obj:SpriteOne = lights.members[i];
					for (var j:int = 0; j < lights.length; j++)
					{
						var obj2:SpriteOne = lights.members[j];
						if (obj == obj2)
							break;
							
						var deltaX:Number = obj.x - obj2.x;
						var deltaY:Number = obj.y - obj2.y;
						var distance:Number = Math.sqrt(Math.pow(deltaX, 2) + Math.pow(deltaY,2));
						if (distance < minDistance)
						{
							obj.velocity.x += 1 / deltaX * 200;
							obj.velocity.y += 1 / deltaY * 200;
							obj2.velocity.x -= 1 / deltaX * 200;
							obj2.velocity.y -= 1 / deltaY * 200;
							var color:uint = FlxU.makeColorFromHSB(Math.random() * 360, 1, 1);
							obj.setColor(color);
							obj2.setColor(color);
							FlxG.play(collisionSounds[int(Math.random() * collisionSounds.length)]);
						}
					}
			}
			super.update();
		}
	}

}