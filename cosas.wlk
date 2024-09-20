object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method reaccion() {

	}
	method bulto() {
		return 1
	}
}
object bumblebee {
	var property robot = false 
	method peso() {
		return 800
	}
	method nivelPeligrosidad() {
		return if (self.esRobot())
				30
				else 15 
	}
	method esRobot() {
		return robot  
	}
	method reaccion() {
		robot = true 
	}
	method bulto() {
		return 2

	}
}
object paqueteDeLadrillos {
	var cantidadLadrillos = 0
	method peso() {
		return 2*cantidadLadrillos
	}
	method nivelPeligrosidad() {
		return 2
	}
	method cantidadLadrillos(cantidad) {
		cantidadLadrillos = cantidad
	}
	method cantidadLadrillos() {
		return cantidadLadrillos
	}
	method reaccion() {
		cantidadLadrillos += 12 
	}
	method bulto() {
		return if (cantidadLadrillos <= 100)
				1
				else if (cantidadLadrillos <= 300)
				2
				else 3
	}
}
object arenaDeGranel {
	var peso = 0
	
	method peso(){
		return  peso
	}
	method peso(_peso) {
		peso = _peso
	}
	method nivelPeligrosidad() {
		return 1 
	}
	method reaccion() {
		peso += 20
	}
	method bulto() {
		return 1
	}
	
}
object bateriaAntiaerea {
	var property misiles = false 
	method peso() {
		return if (misiles)
			300  
			else 200 
			
	}

	method nivelPeligrosidad() {
		return if (misiles)
			100
			else 0
	}
	
	method reaccion() {
		misiles = true 
	}
	method bulto() {
		return if (not misiles)
				1
				else 2

	}
}
object contenedorPortuario {
	const cosas = []
	method peso() {
		return if (cosas.isEmpty())
			100 
			else 100 + cosas.sum({cosa=>cosa.peso()})
	}
	method nivelPeligrosidad() {
		return if (cosas.isEmpty())
					0 
					else cosas.max({cosa=> cosa.nivelPeligrosidad()}).nivelDePeligrosidad()
	}
	method addCosa(cosa) {
		cosas.add(cosa)
	}
	method removeCosa(cosa) {
		cosas.remove(cosa)
	}
	method reaccion() {

		cosas.forEach({cosa=> cosa.reaccion()})
	}
	method bulto() {
		return 1 + cosas.sum({cosa=>cosa.bulto()})
	}

}
object residuos {
	var peso = 0
	method peso() {
		return peso
	}
	method pesoA(_peso) {
		peso = _peso 
	}
	method nivelPeligrosidad() {
		return 200 
	}
	method reaccion() {
		peso += 15
	}
	method bulto() {
		return 1
	}
}
object embalaje
{
	var property envuelto = null  
	method peso() {
		return if (self.nadaEnvuelto())
			0
			else envuelto.peso()/2
	}
	method nivelPeligrosidad() {
		return if (self.nadaEnvuelto())
			0
			else envuelto.nivelPeligrosidad()/ 2
	}
	method reaccion(){

	}
	method nadaEnvuelto() {
		return envuelto==null
	}
	method envolver(cosa) {
		envuelto = cosa
	}
	method desenvolver(cosa) {
		if (envuelto == cosa)
			envuelto = null
			else self.error("no tengo envuelto nada")
	}
	method bulto() {
		return 2
	}
	
}


