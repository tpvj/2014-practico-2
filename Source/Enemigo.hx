package ;

import flash.display.Bitmap;
import openfl.Assets;


class Enemigo extends GameElement{
	
	var volando:Bitmap;
	var scene:HelloShooter;

	public function new (scene:HelloShooter) {
		super();
		volando = new Bitmap( Assets.getBitmapData ("images/asteroid.png"));
		volando.scaleX=volando.scaleY=0.4;
		this.addChild(volando);
		this.scene=scene;
	}

	public function atack(){
		trace("ATACANDO");
		this.x=1000;
		this.y=50+Std.random(500);
		this.estado=1;
		scene.hijos.push(this);
		scene.addChild(this);
		scene.enemigosActivos.push(this);
	}
	
	override public function updateLogic(time:Float){
		if(estado==0) return;
		super.updateLogic(time);
		x-=time*50;
		if(x<-100){
			scene.enemigos.push(this);
			scene.enemigosActivos.remove(this);
			scene.hijos.remove(this);
			scene.removeChild(this);
		}
	}

}
