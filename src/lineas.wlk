import pdepfoniaYconsumo.*
import packs.*


class Linea {
	
	method consumirMb(cantidad, empresa, lineaPersona)
	
	method consumirSeg(cantidad, empresa, lineaPersona)
	
	method crearConsumoMb(cantidad, empresa) {
		const valorDelConsumo = cantidad * empresa.precioPorMb()
		return new Consumo(fecha = new Date(), valorConsumo = valorDelConsumo, segundos = 0, megaBytes = cantidad)
	}
	
	method crearConsumoSeg(cantidad, empresa) {
		const valorDelConsumo = (cantidad - 30).max(0) * empresa.precioPorSeg() + empresa.precioFijoSeg() 
		return new Consumo(fecha = new Date(), valorConsumo = valorDelConsumo, segundos = cantidad, megaBytes = 0)
	}
}

object lineabasic inherits Linea {	
	
	override method consumirMb(cantidad, empresa, lineaPersona) {
		const consumo = self.crearConsumoMb(cantidad, empresa)
		self.hacerConsumoBasic(consumo, lineaPersona)
	}
	
	override method consumirSeg(cantidad, empresa, lineaPersona) {
		const consumo = self.crearConsumoSeg(cantidad, empresa)
		self.hacerConsumoBasic(consumo, lineaPersona)
	}
	
	method hacerConsumoBasic(consumo, lineaPersona) {
		if(lineaPersona.tengoUnPackAdecuado(consumo)) {
			lineaPersona.hacerConsumo(consumo)
			lineaPersona.agregarConsumo(consumo)
		}
		else {
			self.error("No tengo un pack adecuado")
		}
	}
} 


object lineaBlack inherits Linea {
	
	override method consumirMb(cantidad, empresa, lineaPersona) {
		const consumo = self.crearConsumoMb(cantidad, empresa)
		self.hacerConsumoBlack(consumo, lineaPersona)
	}
	
	override method consumirSeg(cantidad, empresa, lineaPersona) {
		const consumo = self.crearConsumoSeg(cantidad, empresa)
		self.hacerConsumoBlack(consumo, lineaPersona)
	}
	
	method hacerConsumoBlack(consumo, lineaPersona) {
		if(lineaPersona.tengoUnPackAdecuado(consumo)) {
			lineaPersona.hacerConsumo(consumo)
			lineaPersona.agregarConsumo(consumo)
		}
		else {
			lineaPersona.hacerConsumo(consumo)
			lineaPersona.agregarDeuda(consumo)
		}
	}
}

object lineaPlatinum inherits Linea {
	
	override method consumirMb(cantidad, empresa, lineaPersona) {
		const consumo = self.crearConsumoMb(cantidad, empresa)
		self.hacerConsumoPlatinum(consumo, lineaPersona)
	}
	
	override method consumirSeg(cantidad, empresa, lineaPersona) {
		const consumo = self.crearConsumoSeg(cantidad, empresa)
		self.hacerConsumoPlatinum(consumo, lineaPersona)
	}
	
	method hacerConsumoPlatinum(consumo, lineaPersona) {
		lineaPersona.hacerConsumo(consumo)
		lineaPersona.agregarConsumo(consumo)
	}
}
