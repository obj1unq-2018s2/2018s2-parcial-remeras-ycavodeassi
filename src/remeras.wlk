
class RemeraLisa {
	const tallesChicos		=	new Range(32,40)		//lista de num
	const property talle								//num entre 32 al 48
	const property color								//instancia que representa un color
	
	method costo		()	=	if(not coloresBasicos.esColorBasico(color))	self.costoXTalle()*1.1 else self.costoXTalle()								
	method costoXTalle	()	=	if(self.esTalleChico()) 80 else 100
	method esTalleChico ()	= 	tallesChicos.contains(talle)	
	method porcentajeDto()	=	10
}

class Bordada inherits RemeraLisa {
	const coloresBordado								//num representando cantidad de colores
	const costoMinimo		=	20						//num representa costo minimo
	
	override method costo()			=	super() + self.costoBordado()
	override method porcentajeDto()	=	2
	method costoBordado	 ()			=	costoMinimo.max(coloresBordado*10)
}

class Sublimada inherits RemeraLisa {
	const dibujoSublimado								//instancia de la clase DibujoSublimado, no me quedo claro si el dibujo podia cambiar por eso la clase.
	
	override method costo() 	    =	super() + self.costoX()
	override method porcentajeDto()	=	if(dibujoSublimado.tieneConvenio()) 20 else super()
	method costoX() 			    =	dibujoSublimado.costoXSuperficie() + dibujoSublimado.derechoAutor()
}

class DibujoSublimado {
	const alto											//num en cm
	const ancho											//num en cm
	const property derechoAutor							//num
	const property tieneConvenio						//boolean
	
	method superficie	   ()	=	alto*ancho
	method costoXSuperficie()	=	self.superficie()*0.5
}


object coloresBasicos {
	const property colores	=	#{blanco, negro, gris}
	
	method esColorBasico(unColor)	=	colores.contains(unColor)
}

object blanco {}
object negro  {}
object gris   {}



