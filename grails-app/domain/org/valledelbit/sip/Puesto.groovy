package org.valledelbit.sip

class Puesto {
	String noPuesto
	String nombre
	String descripcion

	String toString() {
		return "$noPuesto - $nombre"
	}

    static constraints = {
		noPuesto maxSize: 10, blank: false
		nombre	maxSize: 60, blank: false
		descripcion	maxSize: 100  
    }
}
