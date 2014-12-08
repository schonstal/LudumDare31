package;

import openfl.Assets;
import haxe.io.Path;
import haxe.xml.Parser;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.math.FlxRandom;

class TimerGroup extends FlxGroup
{
  public var time:Int = 0;

  var minutes:NumberGroup;
  var seconds:NumberGroup;
  var hundredths:NumberGroup;

  var border:FlxSprite;

  public function new(X:Float=0,Y:Float=0) {
    super();

    border = new FlxSprite(X,Y);
    border.loadGraphic("assets/images/timerBorder.png");
    add(border);

    minutes    = new NumberGroup(X+4,Y+3);
    seconds    = new NumberGroup(X+33,Y+3);
    hundredths = new NumberGroup(X+62,Y+3);

    add(minutes);
    add(seconds);
    add(hundredths);
  }

  override public function update():Void {
    minutes.number    = Std.int(time / 60000);
    seconds.number    = Std.int((time / 1000) % 60);
    hundredths.number = Std.int((time / 10) % 100);

    super.update();
  }
}
