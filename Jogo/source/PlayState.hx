package;

import flixel.*;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

class PlayState extends FlxState 
{
    var _player:Player;
    var _field:FlxSprite;
    var _balls:FlxTypedGroup<Ball>;

    override public function create():Void
    {
        FlxG.cameras.bgColor = 0xff000000;

        _player = new Player(0 , 0);
        _player.x = FlxG.width / 2 - _player.width / 2;
        _player.y = FlxG.height - 100;

        _ball = new Ball(200, -5);
        _ball.velocity.y = 50;

        _field = new FlxSprite();
        _field.loadGraphic(AssetPaths.tennisfield__jpg);
        _field.scale.set(0.6, 0.6);
        _field.screenCenter();

        add(_field);
        add(_ball);
        add(_player);
        
        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        if(FlxG.keys.justPressed.ESCAPE) {
            FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
            {
                FlxG.switchState(new MenuState());
            });
        }
        if(FlxG.keys.pressed.D) 
        {
            _player.x = _player.x + 1;
        }else if(FlxG.keys.pressed.A)
        {
            _player.x = _player.x - 1;
        }else if(FlxG.keys.pressed.W)
        {
            _player.y = _player.y - 1;
        }else if(FlxG.keys.pressed.S)
        {
            _player.y = _player.y + 1;
        }

        if(FlxG.mouse.justPressed)
        {
            if(FlxG.collide(_ball, _player))
            {
                _ball.velocity.y = -50;
            }
        }
    }
}