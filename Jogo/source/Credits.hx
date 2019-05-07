package;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

class Credits extends FlxState 
{
    var _title:FlxText;
    var _matter:FlxText;
    var _author:FlxText;
    var _backButton:FlxButton;

    var _url:FlxText;

    override public function create():Void
    {
        _title = new FlxText(0, 0, 0, "Jogo", 30);
        _title.x = (FlxG.width / 2) - (_title.width / 2);
        _title.y = 20;

        _author = new FlxText(0, 0, 0, "Autor: Claiton Trindade");
        _author.x = (FlxG.width / 2) - (_author.width / 2);
        _author.y = _title.y + _title.height + 10;

        _url = new FlxText(0, 0, 0, "claitontr.github.io");
        _url.x = (FlxG.width / 2) - (_url.width / 2);
        _url.y = FlxG.height - 20;

        _backButton = new FlxButton(20, FlxG.height - 30, "Voltar", back);


        add(_title);
        add(_author);
        add(_url);
        add(_backButton);
        super.create();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);


    }

    function back()
    {
        FlxG.switchState(new MenuState());
    }
}