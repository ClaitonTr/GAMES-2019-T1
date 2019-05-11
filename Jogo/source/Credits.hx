package;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class Credits extends FlxState 
{
    var _title:FlxText;
    var _matter:FlxText;
    var _federal:FlxText;
    var _professor:FlxText;
    var _art:FlxText;
    var _author:FlxText;
    var _urlArt:FlxText;
    var _backButton:FlxButton;

    var _url:FlxText;

    override public function create():Void
    {
        FlxG.cameras.bgColor = 0xff000000;

        _title = new FlxText(0, 0, 0, "Super Tenis", 30);
        _title.x = (FlxG.width / 2) - (_title.width / 2);
        _title.y = 10;

        _author = new FlxText(0, 0, 0, "Autor: Claiton Trindade");
        _author.x = (FlxG.width / 2) - (_author.width / 2);
        _author.y = _title.y + _title.height + 10;

        _matter = new FlxText(0, 0, 0, "Disciplina de Jogos");
        _matter.x = (FlxG.width / 2) - (_matter.width / 2);
        _matter.y = _author.y + _author.height + 10;

        _federal = new FlxText(0, 0, 0, "Universidade federal da fronteira sul");
        _federal.x = (FlxG.width / 2) - (_federal.width / 2);
        _federal.y = _matter.y + _matter.height + 10;

        _professor = new FlxText(0, 0, 0, "Professor Fernando Bevilaqua");
        _professor.x = (FlxG.width / 2) - (_professor.width / 2);
        _professor.y = _federal.y + _federal.height + 10;

        _art = new FlxText(0, 0, 0, "Art easyTennis by Marco Giorgini");
        _art.x = (FlxG.width / 2) - (_art.width / 2);
        _art.y = _professor.y + _professor.height + 10;

        _urlArt = new FlxText(0, 0, 0, "http://www.marcogiorgini.com");
        _urlArt.x = (FlxG.width / 2) - (_urlArt.width / 2);
        _urlArt.y = _art.y + _art.height + 10;

        _url = new FlxText(0, 0, 0, "claitontr.github.io");
        _url.x = (FlxG.width ) - (_url.width + 10);
        _url.y = FlxG.height - 20;

        _backButton = new FlxButton(20, FlxG.height - 30, "Voltar", back);


        add(_title);
        add(_author);
        add(_matter);
        add(_federal);
        add(_professor);
        add(_art);
        add(_urlArt);
        add(_url);
        add(_backButton);
        super.create();
    }

    function back()
    {
        FlxG.camera.fade(FlxColor.BLACK, .33, false, function()
            {
                FlxG.switchState(new MenuState());
            });
    }
}