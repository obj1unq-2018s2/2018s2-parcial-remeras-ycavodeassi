
class Sucursal {
	const property pedidos	=	[]							//lista de pedidos
	const property cantidadMinimaRemeras			//num
	const tallesDisponibles	= new Range(32,48)		//conjunto de talles disponibles

	method registrarPedido(unPedido)	=   pedidos.add(unPedido)
	method aplicaDto	  (unPedido)	=	unPedido.cantidadRemeras()>=cantidadMinimaRemeras
	method totalFacturado ()			=	pedidos.sum{	pedido => pedido.precio(self)	}
	method pedidosDeUnColor(unColor)	=	pedidos.count{	pedido => pedido.modeloRemera().color() == unColor }
	method pedidoMasCaro()				=	pedidos.max{	pedido => pedido.precio(self)	}
	method tallesPedidos()				=	pedidos.map{	pedido => pedido.modeloRemera().talle()			   }
	method tallesNoPedidos()			=	tallesDisponibles.asList().asSet().difference(self.tallesPedidos().asSet()) 	//retorna un conjunto vacio si pidieron todos los talles.
	method vendioTodosLosTalles()		=	self.tallesNoPedidos()==tallesDisponibles
		
}

class Pedido {
	const property modeloRemera								//inst de clase RemerasLisa/bordada/sublimada
	const property cantidadRemeras	
	
	method precioBase()    			=	modeloRemera.costo() * cantidadRemeras
	method precio	 (unaSucursal)	= 	if(unaSucursal.aplicaDto(self)) 
											self.precioBase()-self.precioBase()*(modeloRemera.porcentajeDto()/100)
								 		else
								 			self.precioBase()
}
