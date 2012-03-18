package org.valledelbit.sip

class ParametroPredial {
	String noParametroPredial
	Date anio
	String tipo
	String base
	String impuest

    static constraints = {
		noParametroPredial maxSize: 10, blank: false
   	  	anio max: new Date(), blank: false
		tipo maxSize: 10, blank: false
		base maxSize: 10, blank: false
		impuest maxSize: 10, blank: false
    }
}
