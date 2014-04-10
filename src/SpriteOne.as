package  
{
	/**
	 * ...
	 * @author ...
	 */
	import flash.events.TimerEvent;
	import org.flixel.*
	public class SpriteOne extends FlxSprite
	{
		private var red:int;
		private var green:int;
		private var blue:int;
		private var lastRed:int;
		private var lastGreen:int;
		private var lastBlue:int;
		private var timer:Number
		private var fadeTime:Number;
		public function SpriteOne(X:Number, Y:Number, fadeDuration:Number)
		{
			super(X, Y);
			red = 255;
			green = 255;
			blue = 255;
			lastRed = 255;
			lastGreen = 255;
			lastBlue = 255;
			fadeTime = fadeDuration;
			timer = 0;
		}
		
		override public function update():void 
		{
			if (timer < fadeTime)
			{
				red = lerp(lastRed, 255, timer/fadeTime);
				green = lerp(lastGreen, 255, timer/fadeTime);
				blue = lerp(lastBlue, 255, timer/fadeTime);
				
				var intVal:int = red << 16 | green << 8 | blue;
				this.color = intVal;
				timer += FlxG.elapsed;
			}
			super.update();
		}
		
		override public function postUpdate():void
		{
			super.postUpdate();
			if (x < 0)
			{
				x = 0;
				velocity.x *= -1;
			}
			if (x > FlxG.width)
			{
				x = FlxG.width;
				velocity.x *= -1;
			}
			if (y < 0)
			{
				y = 0;
				velocity.y *= -1;
			}
			if (y > FlxG.height)
			{
				y = FlxG.height;
				velocity.y *= -1;
			}
		}
		
		public function setColor(c:uint):void
		{
			setRed((c & 0xFF0000) >> 16);
			setGreen((c & 0x00FF00) >> 8);
			setBlue((c & 0x0000FF));
		}
		
		public function setRed(r:int):void
		{
			red = r;
			lastRed = r;
			lastGreen = green;
			lastBlue = blue;
			timer = 0;
		}
		public function setGreen(g:int):void
		{
			green = g;
			lastGreen = g;
			lastRed = red;
			lastBlue = blue;
			timer = 0;
		}
		public function setBlue(b:int):void
		{
			blue = b;
			lastBlue = b;
			lastRed = red;
			lastGreen = green;
			timer = 0;
		}
		
		private function lerp(min:Number, max:Number, t:Number):Number
		{
			return min + (max - min) * t;
		}
		
	}

}