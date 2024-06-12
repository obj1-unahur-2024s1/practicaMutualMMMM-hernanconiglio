import actividades.*

class Socio {
	const actividades = []
	var property maximoActividades
	var edad
	const idiomas = #{}
	
	method esAdoradorDelSol() = actividades.all({a=>a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividades.filter({a=>a.implicaEsfuerzo()})
	method realizarActividad(unaActividad) {
		if(actividades.size() == maximoActividades) {
			self.error("Llegó al máximo de actividades")
		}
			actividades.add(unaActividad)
	}
	method leAtrae(unaActividad)
	method realizoActividad(unaActividad) = actividades.contains(unaActividad)
}

class SocioTranquilo inherits Socio {
	override method leAtrae(unaActividad) = unaActividad.diasDeActividad() >= 4
}

class SocioCoherente inherits Socio {
	override method leAtrae(unaActividad) {
		return if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuerzo()
	}
}

class SocioRelajado inherits Socio {
	override method leAtrae(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}