package;

import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.FlxG;

class HUD extends FlxGroup
{
     var _score:FlxText;
     var _strikes:FlxText;

    public function new() {
        super();
        _score = new FlxText(5, 5, 0, "Points: 000");
        _strikes = new FlxText(270, 5, 0, "Strikes: 0");
        
        add(_score);
        add(_strikes);
    }

    override public function update(elapsed:Float) {
        var play:PlayState = cast FlxG.state;
        _score.text = "Points " + play.points;
        _strikes.text = "Strikes " + play.strikes;
        super.update(elapsed);
    }
}