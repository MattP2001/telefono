class Pack { // son atomicos
	const fechaVto
	var sigoFuncionando = true
	
	method sigoFuncionando() = sigoFuncionando
	
	method puedoHacerConsumo(consumo) {
		if (new Date() <= fechaVto)
			sigoFuncionando = false
		return sigoFuncionando		
	}
	
	method hacerConsumo(consumo) 
	
}

class PackMegas inherits Pack {
	var megaBytes
	
	override method puedoHacerConsumo(consumo) = super(consumo) && self.tengoMBSuficientes(consumo.megaBytes())
	
	method tengoMBSuficientes(mbConsumo) = mbConsumo <= megaBytes
	
	override method hacerConsumo(consumo) {
		megaBytes -= consumo.megaBytes()
		if (megaBytes <= 0) {
			megaBytes = 0
			sigoFuncionando = false
		}
	}
}

class PackMegasPlusPlus inherits Pack {
	var megaBytes
	
	override method puedoHacerConsumo(consumo) = super(consumo) && self.tengoMBSuficientesOSonPocosMB(consumo.megaBytes())
	
	method tengoMBSuficientesOSonPocosMB(mbConsumo) = mbConsumo <= megaBytes || mbConsumo <= 0.1
	
	override method hacerConsumo(consumo) {
		megaBytes -= consumo.megaBytes()
		if (megaBytes <= 0) {
			megaBytes = 0
		}
	}
}

class PackSegs inherits Pack {
	var segundos
	
	override method puedoHacerConsumo(consumo) = super(consumo) && self.tengoSegsSuficientes(consumo.segundos())
	
	method tengoSegsSuficientes(segundosConsumo) = segundosConsumo <= segundos
	
	override method hacerConsumo(consumo) {
		segundos -= consumo.segundos()
		if (segundos <= 0) {
			segundos = 0
			sigoFuncionando = false
		}
	}
}

class PackCredito inherits Pack {
	var credito
	
	override method puedoHacerConsumo(consumo) = super(consumo) && self.tengoCreditoSuficiente(consumo.valorConsumo())
	
	method tengoCreditoSuficiente(creditoConsumo) = creditoConsumo <= credito
	
	override method hacerConsumo(consumo) {
		credito -= consumo.valorConsumo()
		if (credito <= 0) {
			credito = 0
			sigoFuncionando = false
		}
	}
}

class PackMegasIlimDias inherits Pack {
	const diasMbGratis = [/*lunes(1), martes, etc*/]
	
	override method puedoHacerConsumo(consumo) = super(consumo) && diasMbGratis.contains(new Date().internalDayOfWeek())	
}

class PackSegsIlimDias inherits Pack {
	const diasLlamadasGratis = [/*lunes(1), martes, etc*/]
	
	override method puedoHacerConsumo(consumo) = super(consumo) && diasLlamadasGratis.contains(new Date().internalDayOfWeek())	
}