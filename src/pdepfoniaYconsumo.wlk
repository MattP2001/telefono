class Consumo {
	const megaBytes
	const segundos
	const fecha
	const valorConsumo
	
	method megaBytes() = megaBytes
	
	method segundos() = segundos
	
	method fecha() = fecha
	
	method valorConsumo() = valorConsumo
}

object pdepfonia {
	var property precioPorMb = 0.1
	var property precioPorSeg = 0.05
	var property precioFijoSeg = 1
}