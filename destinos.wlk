import camion.*
import caminos.*
import cosas.*




object almacen {
	const  stock = #{}
	const cantidadBultosMax = 3
	
	method cantidadBultosMaximos() {
		return cantidadBultosMax
}
	method cantidadBultos() {
		return stock.sum({cosa=>cosa.bulto()})
	}
	method stock() {
		return stock
	}
	
}