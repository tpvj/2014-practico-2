package ;

import flash.display.Bitmap;
import openfl.Assets;


class Avion extends GameElement{
	
	var volando:Bitmap;
	var propulsion:Animation;
	var propulsionPlus:Animation;
	var propulsionUp:Animation;
	var propulsionDown:Animation;
	//var explotando://;
	
	public function new () {
		super();
		volando = new Bitmap( Assets.getBitmapData ("images/player_spaceship.png"));
		this.addChild(volando);
		this.x=50;
		this.y=300;
		propulsion = new Animation( Assets.getBitmapData("images/booster1.png"), 1, 7);
		propulsionPlus = new Animation( Assets.getBitmapData("images/booster2.png"), 1, 7);
		propulsionUp = new Animation( Assets.getBitmapData("images/boosterup.png"), 7, 1);
		propulsionDown  = new Animation( Assets.getBitmapData("images/boosterdown.png"), 7, 1);
		
		this.addChild(propulsion);
		this.addChild(propulsionPlus);
		this.addChild(propulsionUp);
		this.addChild(propulsionDown);
		
		hijos.push(propulsion);
		hijos.push(propulsionPlus);
		hijos.push(propulsionUp);
		hijos.push(propulsionDown);
		
		
		propulsion.x=-33;
		propulsion.y=6;
		propulsionPlus.y=6;
		propulsionPlus.x=-33;
		
		propulsionPlus.visible=false;
		propulsionDown.visible=false;
		propulsionUp.visible=false;
		
		propulsionUp.x=54;
		propulsionUp.y=24;
		propulsionDown.x=54;
		propulsionDown.y=-11;

	}	
	
	override public function updateLogic(time:Float){
		super.updateLogic(time);
		if(InputManager.getInstance().keyPressed('W')){
			this.y--;
			propulsionUp.visible=true;	
		}else{
			propulsionUp.visible=false;
		}
		
		if(InputManager.getInstance().keyPressed('S')){
			this.y++;
			propulsionDown.visible=true;
		}else{
			propulsionDown.visible=false;
		}
		if(InputManager.getInstance().keyPressed('A')){
			propulsion.alpha=0.5;
			x--;
		}else{
			propulsion.alpha=1;
		}
		
		propulsion.visible=true;
		if(InputManager.getInstance().keyPressed('D')){
			propulsionPlus.visible=true;
			propulsion.visible=false;
			x++;
		}else{
			propulsionPlus.visible=false;
		}
	}

}
