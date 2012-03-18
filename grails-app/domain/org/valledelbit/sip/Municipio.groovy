package org.valledelbit.sip

class Municipio {
	String noMunicipio
	String nombre
	Estado estado

	String toString() {
		return "$noMunicipio - $nombre"
	}

    static constraints = {
		noMunicipio maxSize: 10, blank: false
		nombre	maxSize: 70, blank: false
		estado  blank: false  
    }
}
