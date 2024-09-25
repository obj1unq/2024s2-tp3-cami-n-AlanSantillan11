object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method reaccion() {
		
	}
	
	method bulto() = 1
}

object bumblebee {
	var property transformado = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = transformado.nivelPeligrosidad()
	
	method esRobot() = robot
	
	method reaccion() {
		transformado = robot
	}
	
	method bulto() = 2
}

object robot {
	method nivelPeligrosidad() = 30
}

object auto {
	method nivelPeligrosidad() = 15
}

class PaqueteDeLadrillos {
	var cantidadLadrillos = null
	
	method peso() = 2 * cantidadLadrillos
	
	method nivelPeligrosidad() = 2
	
	method cantidadLadrillos(cantidad) {
		cantidadLadrillos = cantidad
	}
	
	method cantidadLadrillos() = cantidadLadrillos
	
	method reaccion() {
		cantidadLadrillos += 12
	}
	
	method bulto() = if (cantidadLadrillos <= 100) {
		1
	} else {
		if (cantidadLadrillos <= 300) 2 else 3
	}
}

object arenaDeGranel {
	var peso = 0
	
	method peso() = peso
	
	method peso(_peso) {
		peso = _peso
	}
	
	method nivelPeligrosidad() = 1
	
	method reaccion() {
		peso += 20
	}
	
	method bulto() = 1
}

object bateriaAntiaerea {
	var property misiles = false
	
	method peso() = if (misiles) 300 else 200
	
	method nivelPeligrosidad() = if (misiles) 100 else 0
	
	method reaccion() {
		misiles = true
	}
	
	method bulto() = if (not misiles) 1 else 2
}

object contenedorPortuario {
	const cosas = []
	
	method peso() = if (cosas.isEmpty()) 100
	                else 100 + cosas.sum({ cosa => cosa.peso() })
	
	method nivelPeligrosidad() = if (cosas.isEmpty()) 0
	                             else cosas.max(
	                             		{ cosa => cosa.nivelPeligrosidad() }
	                             	).nivelDePeligrosidad()
	
	method addCosa(cosa) {
		cosas.add(cosa)
	}
	
	method removeCosa(cosa) {
		cosas.remove(cosa)
	}
	
	method reaccion() {
		cosas.forEach({ cosa => cosa.reaccion() })
	}
	
	method bulto() = 1 + cosas.sum({ cosa => cosa.bulto() })
}

object residuos {
	var peso = 0
	
	method peso() = peso
	
	method pesoA(_peso) {
		peso = _peso
	}
	
	method nivelPeligrosidad() = 200
	
	method reaccion() {
		peso += 15
	}
	
	method bulto() = 1
}

class Embalaje {
	var property envuelto = null
	
	method peso() = if (self.nadaEnvuelto()) 0 else envuelto.peso() / 2
	
	method nivelPeligrosidad() = if (self.nadaEnvuelto()) 0
	                             else envuelto.nivelPeligrosidad() / 2
	
	method reaccion() {
		
	}
	
	method nadaEnvuelto() = envuelto == null
	
	method envolver(cosa) {
		envuelto = cosa
	}
	
	method desenvolver(cosa) {
		if (envuelto == cosa) {
			envuelto = null
		} else {
			self.error("no tengo envuelto nada")
		}
	}
	
	method bulto() = 2
}