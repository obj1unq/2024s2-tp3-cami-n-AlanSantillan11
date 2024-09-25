import cosas.*
import camion.*


object ruta9 {
	const nivelPeligroMax = 11 
	
    method validarViajePor(camion) {
        return if (not camion.puedeCircularEnRuta(nivelPeligroMax))
                self.error("viaje no validado")
    }
}
object caminosVecinales {
	var pesoMaximoSoportado = 100 
  method pesoMaximoSoportado() {
	return pesoMaximoSoportado
	}
  method pesoMaximoSoportado(peso) {
		pesoMaximoSoportado = peso
	}
	method validarViajePor(camion) {
    return if (camion.pesoTotal() > pesoMaximoSoportado)
            self.error("viaje no validado")
    
	}
}


