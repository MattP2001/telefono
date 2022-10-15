import pdepfoniaYconsumo.*
import lineas.*

class LineaPersonal {
	const empresa = pdepfonia
	var plan = lineabasic
	var packs = []
	var consumos = []
	var deudas = []
	
	method agregarConsumo(unConsumo) {
		consumos.add(unConsumo)
	}
	
	method agregarDeuda(unConsumo) {
		deudas.add(unConsumo)
	}
	
	method consumosEntre(fecha1, fecha2) {
		const primerFiltro = consumos.filter({ unaFecha => unaFecha >= fecha1 })
		return primerFiltro.filter({ otraFecha => otraFecha <= fecha2 })
	}
	
	method totalConsumos30dias(fecha) = self.totalConsumosEntre(fecha.minusDays(30), fecha)
	
	method totalConsumosEntre(fecha1, fecha2) {
		const consumosEntre1y2 = self.consumosEntre(fecha1, fecha2)
		return consumosEntre1y2.sum({ unConsumo => unConsumo.valorConsumo() })
	}
	
	method promedioConsumosEntre(fecha1, fecha2) {
		const consumosEntre1y2 = self.consumosEntre(fecha1, fecha2)
		const total  = self.totalConsumosEntre(fecha1, fecha2)
		const cantidad  = consumosEntre1y2.size()
		return total / cantidad
	}
	
	method packs(unPack) {
		packs.add(unPack)
	}
	
	method consumirMb(cantidad) {
		plan.consumirMb(cantidad, empresa, self)
	}
	
	method consumirSeg(cantidad) {
		plan.consumirSeg(cantidad, empresa, self)
	}
	
	method limpiarPacks() {
		packs.removeAllSuchThat({ unPack => unPack.sigoFuncionando() })
	} 
	
	method tengoUnPackAdecuado(consumo) = packs.any({ unPack => unPack.puedoHacerConsumo(consumo) })
	
	method hacerConsumo(consumo) {
		packs.filter({ unPack => unPack.puedoHacerConsumo(consumo) }).last().hacerConsumo(consumo)
	}
} 
