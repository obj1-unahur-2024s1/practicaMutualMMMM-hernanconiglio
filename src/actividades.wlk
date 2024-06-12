class Actividad {
	const property idiomas = #{}
	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasDeActividad()
	method esInteresante() = idiomas.size() > 1
	method esRecomdadaPara(unSocio) {
		return self.esInteresante()  and unSocio.leAtrae(self) and not unSocio.realizoActividad(self)
	}
}

class ViajeDePlaya inherits Actividad {
	const property largoPlaya
	override method diasDeActividad() = largoPlaya / 500
	override method implicaEsfuerzo() = largoPlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Actividad {
	var property cantAtracciones
	override method diasDeActividad() = cantAtracciones / 2
	override method implicaEsfuerzo() = cantAtracciones.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or cantAtracciones == 5
}

class ExcursionTropical inherits ExcursionACiudad {
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncearse() = true
}

class SalidaTrekking inherits Actividad {
	var property cantKmsSenderos
	const property diasDeSolAlAnio
	override method diasDeActividad() = cantKmsSenderos /50
	override method implicaEsfuerzo() = cantKmsSenderos > 80
	override method sirveParaBroncearse() = 
		diasDeSolAlAnio>=200 or (diasDeSolAlAnio.between(100,200) and cantKmsSenderos > 120) 
	override method esInteresante() = super() and diasDeSolAlAnio > 140
}

class ClaseDeGimnasia inherits Actividad {
	
	method initialize() {
		if(idiomas!=#{"español"}) {
			self.error("solo se permite clase de gimnasia en español")
		}
	} 
	override method diasDeActividad() = 1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
}