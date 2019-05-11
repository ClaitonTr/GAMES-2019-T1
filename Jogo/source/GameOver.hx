package;

import flixel.FlxState;
import flixel.text.FlxText;

class GameOver extends FlxState
{
    var _gameOver:FlxText;

    override public function create():Void
    {
        _gameOver = new FlxText(5, 5, 0, "Score: 000");
        _gameOver.screenCenter();
        add(_gameOver);
        super.create();
    }
}