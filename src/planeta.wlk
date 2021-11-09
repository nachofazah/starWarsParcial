import habitantes.*

class Planetoide
{
	const property listPersonas = #{}
	var property cantMuseos = 0
	var property longitudMurallas = 0
	
	method agregarPersonas(unaPersona){
		listPersonas.add(unaPersona)
	}
	
	method quitarPersonas(unaPersona){
		listPersonas.remove(unaPersona)
	}
	
	method delegacionDiplomatica() = listPersonas.filter{ p => p.esDestacada() }
	method valorInicialDeDefensa() = listPersonas.count{ p => p.potencia() >= 30 }
	method esCulto() = (cantMuseos >= 2) and (listPersonas.all{ p => p.inteligencia() >= 10})
	method potenciaReal() = listPersonas.sum{ p => p.potencia() }
	method potenciaAparente() = listPersonas.max({ p => p.potencia()}).potencia() * listPersonas.size()
	method habitantesValiosos() = listPersonas.filter{ p => p.valor() >= 40}
	method necesitaReforzarse() = self.potenciaAparente() * 2 >= self.potenciaReal()
	
	
	method construirMurallas(cantKm) {
		longitudMurallas += cantKm
	}
	
	method fundarUnMuseo(){
		cantMuseos += 1
	}
	
	method recibirTributos(){
		listPersonas.forEach( {p => p.enviarTributo(self)} )
	}
	
	method apaciguarA(otroPlaneta){
		self.habitantesValiosos().forEach( {p => p.enviarTributo(otroPlaneta)} )
	}
	
}