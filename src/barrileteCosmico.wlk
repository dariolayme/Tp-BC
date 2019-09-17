object barrileteCosmico {
	
	var destinos = []
	
	method agregarDestino(nuevoDestino) {
		destinos.add(nuevoDestino)
	}	
	
	
	method destinosMasImportantes (){
		return destinos.filter({
			destino => destino.esDestacado()
		})
	}
	
	method descuentoMasivo(porcentaje){
		destinos.forEach({
			destino => destino.aplicarDescuento(porcentaje)
		})
	}
	
	method esExtrema() {
		return destinos.any({
			destino => destino.necesitaAlgunaVacuna()
		})
	}
	
	method destinos(){
		return destinos
	}
	
	
	//%%%%%%%%%%%%%%% No Relevado %%%%%%%%%%%//
	method elDestinoMasPeligroso() {
		return 0
	}
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
}

class Destino {
	
	const property nombre
	var property precio
	var property equipajeImpresindible = []
	
	method esDestacado() {
		return (precio > 2000)
	}
	
	method aplicarDescuento(porcentaje) {
		precio = precio * ((100-porcentaje) / 100)
		equipajeImpresindible.add("Certificado de descuento")/* */
	}
	
	
	method necesitaAlgunaVacuna() {
		return equipajeImpresindible.any({
			objeto => objeto.contains("Vacuna")
		})
	}
	
	method tieneElCertificadoDeDescuento() {
		return self.equipajeImpresindible().contains("Certificado de descuento")
	}
	
	
	//%%%%%%%%%%%%%%% No Relevado %%%%%%%%%%%//
	method esPeligroso()
	{
		return true
	}
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%//
	
}


class Usuario {
	
	
	const property nombre
	var property usuario 
	var  destinosConocidos = []
	var  usuariosSeguidos = []
	var  dineroDisponible = 0
	var kilometros 
	//var equipaje 
	
	method volarA(destino) {
		if (self.puedeVolarA(destino))
			{
				destinosConocidos.add(destino)
				//self.dineroDisponible(dineroDisponible - destino.precio())
				dineroDisponible = dineroDisponible - destino.precio()
				return "Voló"	
			}
		else{
			return "No Puede Volar"
		}
			
	}
	
	method puedeVolarA(destino) {
		return (/*self.dineroDisponible()*/dineroDisponible > destino.precio() )// && equipaje == desdestino.equipajeImpresindible()
	}
	
	method kilometros() {
		kilometros = destinosConocidos.sum({
			destino => destino.precio()
		}) * 0.1
		return kilometros
	}
	
	
	
	method seguirA(unUsuario) {
		if(self.sigoA(unUsuario).negate()){
			usuariosSeguidos.add(unUsuario)
			unUsuario.seguirA(self)
		}
		
	}
	
	method sigoA(unUsuario) {
		return usuariosSeguidos.contains(unUsuario)
	}
	
	method destinosConocidos() {
		return destinosConocidos
	}
	
}