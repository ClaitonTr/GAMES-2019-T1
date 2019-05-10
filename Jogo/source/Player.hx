package;

import flixel.*;

class Player extends FlxSprite 
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        loadGraphic(AssetPaths.playerdown_sheet__png, true, 60, 64);
        
        scale.set(0.5, 0.5);

         animation.add("hit", [9, 10, 11], false);
          animation.add("move", [3, 4, 11], false);
    }

    function hit():Void
    {
        var _click:Bool = false;
        var _move:Bool = false;

        _click = FlxG.mouse.justPressed;
        _move = FlxG.keys.anyPressed([A, S, W, D]);


        if(_click) {
            animation.play("hit");
        }
        if(_move) {
            animation.play("move");
        }
    }

    override public function update(elapsed:Float)
    {
        hit();
        super.update(elapsed);
    }

}