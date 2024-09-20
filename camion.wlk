import cosas.*
import destinos.*
import caminos.*



object camion {
	const property cosas = #{}
		
	method cargar(cosa) {
		if (self.excedidoDePeso())
		self.error("esta muy pesado, no puede cargar")
		cosa.reaccion()
		cosas.add(cosa)
	}
	method descargar(cosa) {
		if(cosas.contains(cosa))
		cosas.remove(cosa)
		else self.error(" no lo tengo cargado")
	}
	method todoPesoPar() {
		cosas.all({cosa=> cosa.peso()%2 == 0})
	}
	
	method hayAlgunoQuePesa(pesoN) {
		cosas.any({cosa=> cosa.peso() == pesoN}) 

	}
	method elDeNivel(nivel) {
		cosas.find({cosa=> cosa.nivelPeligrosidad() == nivel})
	}
	method pesoTotal() {

	return self.pesoVacio() + cosas.sum({cosa=> cosa.peso()}) 
	
	}
	method pesoMaximo() {
		return 2500
	}
	method pesoVacio(){
		return 1000
	}
	method excedidoDePeso() {
		return self.pesoTotal() > self.pesoMaximo()

	}
	method objetosQueSuperanPeligrosidad(nivel) {
		cosas.filter({cosa=> cosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa) {
		cosas.filter({cosa => cosa.objetosQueSuperanPeligrosidad(cosa.nivel())})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {

		return not self.excedidoDePeso() && cosas.all({cosa=> cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad})
	}
	method puedeCircularEnCamino(camino) {
		return camino.pesoMaximoSoportado() > self.pesoTotal()

	}
	//
	method tieneAlgoQuePesaEntre(min, max) {

		return cosas.any({cosa=> min < cosa.peso() && cosa.peso()< max })
	}
	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}
	method pesos() {
		cosas.map({cosa => cosa.peso()})
	}
	method totalBultos() {
		return  cosas.sum({cosa=>cosa.bulto()})
	}
	
	method puedoEntregar(destino) {
		return destino.cantidadBultos() + self.totalBultos() < destino.cantidadBultosMaximos()
	}
	method transportar(destino,camino) {
		camino.validarViajePor(self)
		if (self.puedoEntregar(destino))
		self.hacerDescarga(destino)
		else self.error({"no se puede transportar a destino almacen por el camino ruta9"})
		
		

	}
	
	method hacerDescarga(destino) {
		destino.stock().addAll(cosas)
		cosas.removeAll(cosas)

	}
}