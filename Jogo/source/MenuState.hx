package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var _play:FlxButton;
	var _creditos:FlxButton;
	var _text:FlxText;

	override public function create():Void
	{

		FlxG.cameras.bgColor = 0xff3fa3ff;

		_text = new FlxText(0, 0, 0, "Super Tenis", 42);
		_text.y = -100;
		_text.x = (FlxG.width / 2) - (_text.width / 2);
		_text.color = 0xFFffb640;

		_play = new FlxButton(play);
		_play.x = (FlxG.width / 2) - (_play.width + 10);
		_play.y = 150;
		_play.text = "Play";

		_creditos = new FlxButton(openCredits);
		_creditos.x = (FlxG.width / 2) + 10;
		_creditos.y = 150;
		_creditos.text = "Créditos";

		add(_text);
		add(_play);
		add(_creditos);


		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if(_text.y == 70) {
			_text.y = 70;
		}else {
			_text.y = _text.y + 2;
		}
	}

	function play()
	{
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
            {
                FlxG.switchState(new PlayState());
            });
	}

	function openCredits()
	{
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
            {
                FlxG.switchState(new Credits());
            });
	}
}
