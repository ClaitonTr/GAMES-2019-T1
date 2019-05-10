package;

import flixel.FlxSprite;

class Adversary extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x,y);
        loadGraphic(AssetPaths.playerup_sheet__png, true, 60, 64);
        
        scale.set(0.5, 0.5);

        
    }
}