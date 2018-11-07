
class Comercio {
	const sucursales	=	#{}				//conjunto de sucursales
	
	method totalFacturado()					=	sucursales.sum{	 sucursal => sucursal.totalFacturado()	} //Por comercio
	method totalFacturadoX(unaSucursal)		=	sucursales.find{ sucursal => sucursal==unaSucursal	}.totalFacturado() //Por sucursal
	method sucursalMasVendio()				=	sucursales.max{	 sucursal => sucursal.totalFacturado()	}
	method sucursalVendioTodosLosTalles()	=	sucursales.filter{	sucursal => sucursal.vendioTodosLosTalles()	}	
	method pedidoMasCaro()					=	sucursales.filter{	sucursal => sucursal.pedidoMasCaro()	}
}
