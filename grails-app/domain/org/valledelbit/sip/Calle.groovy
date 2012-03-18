package org.valledelbit.sip

class Calle {
	String noCalle
	String nombre
	Colonia colonia

	String toString() {
		return "$noCalle - $nombre"
	}

    static constraints = {
		noCalle	maxSize: 25, blank: false
		nombre	maxSize: 25, blank: false
		colonia  blank: false  
    }
}