package  
{
	/**
	 * ...
	 * @author Elliot
	 */
	import org.flixel.*;
	public class StartMenuState extends FlxState
	{
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			/*
			var title:FlxText = new FlxText(0, FlxG.stage.stageHeight * 0.3, FlxG.stage.stageWidth, "sword game");
			title.size = 48;
			title.alignment = "center";
			add(title);
			var instructions:FlxText = new FlxText(0, FlxG.stage.stageHeight * 0.6, FlxG.stage.stageWidth, "press x to start");
			instructions.size = 16;
			instructions.alignment = "center";
			add(instructions);
			*/
			var exp1:FlxText = new FlxText(0, FlxG.stage.stageHeight * 0.3, FlxG.stage.stageWidth, "experiment 1");
			exp1.size = 48;
			exp1.alignment = "center"; 
			add(exp1);
		}
		
		override public function update():void
		{
			if(FlxG.keys.ONE)
				FlxG.switchState(new ExperimentOne);
			super.update();
		}
		
	}

}