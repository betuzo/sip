package org.valledelbit.sip

class Colonia {
	String noColonia
	String nombre
	Municipio municipio
	
	String toString() {
		return "$noColonia - $nombre"
	}

	static constraints = {
		noColonia maxSize: 25, blank:false
		nombre maxSize: 50, blank:false
		municipio maxSize: 25, blank:false
	}
}