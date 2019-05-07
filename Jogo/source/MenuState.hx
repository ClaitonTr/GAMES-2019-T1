package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxG;

class MenuState extends FlxState
{
	var _play:FlxButton;
	var _creditos:FlxButton;
	var _text:FlxText;

	override public function create():Void
	{
		_text = new FlxText(0, 0, 0, "Jogo", 64);
		_text.y = -100;
		_text.x = (FlxG.width / 2) - (_text.width / 2);

		_play = new FlxButton();
		_play.x = (FlxG.width / 2) - (_play.width + 10);
		_play.y = 150;
		_play.text = "Play";

		_creditos = new FlxButton();
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
		
		if(_text.y == 50) {
			_text.y = 50;
		}else {
			_text.y = _text.y + 1;
		}
	}
}
