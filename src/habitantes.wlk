import planeta.*

class Ensayo {
	
	var energia = 10
	
	method cuantaEnergia () = energia
}

class Persona 
{
	var property edad = 18
	const property potencia = 20

	method inteligencia() = if (edad.between(20, 40)) {12} else {8}
	method esDestacada() = edad == 25 or edad == 35
	method enviarTributo(unPlaneta){}
	method valor() = return self.potencia() + self.inteligencia()
	
}


class Atleta inherits Persona
{
	var property masaMuscular = 4
	var property cantDeTecnicas = 2
	
	override method potencia() =  super() + (masaMuscular * cantDeTecnicas)
	override method esDestacada() = super() or (cantDeTecnicas > 5)
	
	method entrenar(cantDedias) { 
		masaMuscular += cantDedias.div(5)
	}
	
	method aprenderUnaTecnica(){
		cantDeTecnicas += 1
	}
	
	override method enviarTributo(unPlaneta){
		unPlaneta.construirMurallas(2)
	}
}


class Docente inherits Persona
{
	var property cantCursos = 0
	
	override method inteligencia() =  super() + (cantCursos * 2)	
	override method esDestacada() = cantCursos > 3
	override method valor() = super() + 5
	
	override method enviarTributo(unPlaneta){ 
		unPlaneta.fundarUnMuseo()
	}
}


class Soldado inherits Persona
{
	const property coleccionDeArmas = []
	
	override method potencia() = super() + coleccionDeArmas.sum{ a => a.potencia(self)}
	
	override method enviarTributo(unPlaneta)
	{
		unPlaneta.construirMurallas(5)
	}
}


class Arma {
	method potencia(soldado)
}

class Pistolete inherits Arma
{
	var property largo = 0
	override method potencia(soldado) = if (soldado.edad() > 30) {largo * 3} else { largo * 2}
}
	
class Espadon inherits Arma
{
	var property peso = 0
	override method potencia(soldado) = if (soldado.edad() < 40){ peso / 2 } else { 6 }
}


