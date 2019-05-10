package;

import flixel.FlxSprite;

class Ball extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        loadGraphic(AssetPaths.Tennisball__png, true, 32, 32);
        
        scale.set(0.2, 0.2);

        
    }
}