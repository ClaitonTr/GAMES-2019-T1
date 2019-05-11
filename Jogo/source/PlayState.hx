package;

import flixel.*;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

class PlayState extends FlxState 
{
    var _player:Player;
    var _field:FlxSprite;
    var _balls:FlxTypedGroup<Ball>;
    var _start:Bool;
    var velo:Int = 50;
    var count:Int = 0;
    public var strikes:Int = 0;
    public var points:Int = 0;
    var _hud:HUD;

    override public function create():Void
    {
        FlxG.cameras.bgColor = 0xff000000;
        _start = true;

        _player = new Player(0 , 0);
        _player.x = FlxG.width / 2 - _player.width / 2;
        _player.y = FlxG.height - 100;

        _balls = new FlxTypedGroup<Ball>();

        for(i in 0...50)
        {
            var _ball = new Ball(0, 0);
            _ball.kill();
            _balls.add(_ball);
        }

        _hud = new HUD();


        _field = new FlxSprite();
        _field.loadGraphic(AssetPaths.tennisfield__jpg);
        _field.scale.set(0.6, 0.6);
        _field.screenCenter();

        add(_field);
        add(_hud);
        add(_balls);
        add(_player);
        
        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        var b = _balls.getFirstAvailable();

        if(FlxG.keys.justPressed.ESCAPE) {
            FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
            {
                FlxG.switchState(new MenuState());
            });
        }
        if(FlxG.keys.pressed.D) 
        {
            if(_player.x < 230)
            {
                _player.x = _player.x + 1;
            }
        }else if(FlxG.keys.pressed.A)
        {
            if(_player.x > 30)
            {
                _player.x = _player.x - 1;
            }
        }else if(FlxG.keys.pressed.W)
        {
            if(_player.y > 90)
            {
                _player.y = _player.y - 1;
            }
        }else if(FlxG.keys.pressed.S)
        {
            if(_player.y < 190)
            {
                _player.y = _player.y + 1;
            }
        }

        if(_start || !b.isOnScreen())
        {
            _start =false;
            
            var x:Int = FlxG.random.int(90, 200);
            if(b != null)
            {
                count++;
                b.reset(x, 0);
                b.velocity.y = velo;
            }
            if(count % 3 == 0)
            {
                velo += 10;
            }
        }
        

        if(FlxG.mouse.justPressed)
        {
            if(FlxG.overlap(_player, _balls, touch))
            {
                 points += 1;
            }
        }

        if(strikes > 2)
        {
            FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
            {
                FlxG.switchState(new GameOver());
            });
        }
    }

    function touch(player:FlxObject, ball:FlxObject):Void
    {
        ball.velocity.y = -velo;
    }
}