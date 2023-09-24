import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"

	method position() = game.at(self.posicionPepita(),0)
	
	method posicionPepita() = pepita.position().x().max(3)
	
	method energiaQueOtorga() {}
	
	method teEncontro(ave) {
		game.say(ave, "PERDISTE! NOOO")
		game.schedule(2000, { game.stop() })
	}
}
