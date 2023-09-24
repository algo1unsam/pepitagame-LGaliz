import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()
	
//	method energia() { return energia}
//	method energia(numero){energia = numero }

	method image() {
		return if (self.estaEnElNido())
		{
		 "pepita-grande.png"
		 
		 }
		 else if (self.atrapada() or self.estaCansada()){
		 	"pepita-gris.png"
		 }
		  else "pepita.png"
			
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.estaCansada() and self.validarPosicion(nuevaPosicion)){
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion			
		}
	}
	
	method validarPosicion(nuevaPosicion) = nuevaPosicion.x().between(0,9) and nuevaPosicion.y().between(0,9)
	
	//= nuevaPosicion.x() <=9 and nuevaPosicion.y() <=9 and nuevaPosicion.x() >= 0 and nuevaPosicion.y() >= 0
	  
	method estaCansada() = energia <= 0

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}
	
	method atrapada() = self.position() == silvestre.position()
	
	method caerSiEstaVolando() {
		if(not self.estaEnElSuelo()){
			position = self.position().down(1)
		} 
		else if (self.estaCansada()){
			game.schedule(2000, { game.stop() })
		}
	}

}

