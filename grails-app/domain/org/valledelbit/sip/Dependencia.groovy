package org.valledelbit.sip

class Dependencia {
	String noDependencia
	String nombre
	String descripcion

	String toString() {
		return "$noDependencia - $nombre"
	}
	
    static constraints = {
		noDependencia maxSize: 10, blank: false
		nombre maxSize: 50, blank: false
		descripcion maxSize: 100, blank: false
    }
}